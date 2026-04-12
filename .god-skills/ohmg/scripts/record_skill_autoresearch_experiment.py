#!/usr/bin/env python3

"""Record a manually scored skill-autoresearch experiment for ohmg."""

from __future__ import annotations

import argparse
import json
import sys
from datetime import date
from pathlib import Path
from typing import Any


def parse_args() -> argparse.Namespace:
    script_path = Path(__file__).resolve()
    skill_dir = script_path.parent.parent
    workspace_dir = skill_dir / "skill-autoresearch-ohmg"
    evals_path = skill_dir / "evals" / "evals.json"

    parser = argparse.ArgumentParser(
        description=(
            "Generate a scoring template or record a manually scored "
            "skill-autoresearch experiment for ohmg."
        )
    )
    parser.add_argument(
        "--workspace",
        type=Path,
        default=workspace_dir,
        help="Workspace directory containing results.json/results.tsv/changelog.md",
    )
    parser.add_argument(
        "--evals",
        type=Path,
        default=evals_path,
        help="Path to evals/evals.json",
    )
    parser.add_argument(
        "--write-template",
        type=Path,
        help="Write a JSON template for manual scoring and exit",
    )
    parser.add_argument(
        "--input",
        type=Path,
        help="Path to a completed experiment JSON file to record",
    )
    return parser.parse_args()


def load_json(path: Path) -> Any:
    try:
        return json.loads(path.read_text())
    except FileNotFoundError as exc:
        raise SystemExit(f"Missing JSON file: {path}") from exc
    except json.JSONDecodeError as exc:
        raise SystemExit(f"Invalid JSON in {path}: {exc}") from exc


def write_json(path: Path, payload: Any) -> None:
    path.write_text(json.dumps(payload, indent=2) + "\n")


def normalize_bool(value: Any, field_name: str) -> bool:
    if isinstance(value, bool):
        return value
    raise SystemExit(f"Expected boolean for {field_name}, got: {value!r}")


def build_template(evals: dict[str, Any], runs_per_experiment: int) -> dict[str, Any]:
    prompt_rows = [
        {
            "prompt_id": eval_row["id"],
            "pass": None,
            "notes": "",
        }
        for eval_row in evals["evals"]
    ]
    return {
        "experiment": 0,
        "status": "baseline",
        "description": "Baseline run with the current ohmg skill wording.",
        "change": "No mutation. Establish experiment 0 before any prompt edits.",
        "reasoning": "Use the same prompt set for every future experiment.",
        "result": "Fill after manual scoring.",
        "remaining_failures": "Describe recurring misses after reviewing the captured outputs.",
        "current_blocker": "Response capture is still manual outside this recorder.",
        "next_action": "Fill the pass/fail grid after capturing five real runs, then rerun this script with --input.",
        "runs": [
            {
                "run": run_number,
                "scores": prompt_rows,
            }
            for run_number in range(1, runs_per_experiment + 1)
        ],
    }


def validate_scores(
    experiment_input: dict[str, Any],
    eval_ids: list[int],
    runs_per_experiment: int,
) -> tuple[int, int, float]:
    runs = experiment_input.get("runs")
    if not isinstance(runs, list) or not runs:
        raise SystemExit("Experiment input must contain a non-empty 'runs' list.")
    if len(runs) != runs_per_experiment:
        raise SystemExit(
            f"Expected {runs_per_experiment} runs, found {len(runs)}."
        )

    total_score = 0
    max_score = len(eval_ids) * len(runs)
    seen_runs: set[int] = set()

    for run_entry in runs:
        run_id = run_entry.get("run")
        if not isinstance(run_id, int):
            raise SystemExit(f"Each run needs an integer 'run' value. Got: {run_id!r}")
        if run_id in seen_runs:
            raise SystemExit(f"Duplicate run number: {run_id}")
        seen_runs.add(run_id)

        scores = run_entry.get("scores")
        if not isinstance(scores, list):
            raise SystemExit(f"Run {run_id} is missing a 'scores' list.")

        score_map: dict[int, bool] = {}
        for score_entry in scores:
            prompt_id = score_entry.get("prompt_id")
            if prompt_id not in eval_ids:
                raise SystemExit(
                    f"Run {run_id} references unknown prompt_id: {prompt_id!r}"
                )
            if prompt_id in score_map:
                raise SystemExit(
                    f"Run {run_id} includes prompt_id {prompt_id} more than once."
                )
            score_map[prompt_id] = normalize_bool(
                score_entry.get("pass"), f"run {run_id} prompt {prompt_id}"
            )

        missing = [prompt_id for prompt_id in eval_ids if prompt_id not in score_map]
        if missing:
            raise SystemExit(f"Run {run_id} is missing prompt_ids: {missing}")

        total_score += sum(1 for passed in score_map.values() if passed)

    pass_rate = round((total_score / max_score) * 100, 1) if max_score else 0.0
    return total_score, max_score, pass_rate


def append_results_tsv(
    results_tsv: Path,
    experiment_number: int,
    score: int,
    max_score: int,
    pass_rate: float,
    status: str,
    description: str,
) -> None:
    existing_lines = []
    if results_tsv.exists():
        existing_lines = results_tsv.read_text().splitlines()
    header = "experiment\tscore\tmax_score\tpass_rate\tstatus\tdescription"
    if not existing_lines:
        existing_lines = [header]

    prefix = f"{experiment_number}\t"
    filtered = [
        line for line in existing_lines[1:] if not line.startswith(prefix)
    ]
    filtered.append(
        f"{experiment_number}\t{score}\t{max_score}\t{pass_rate}\t{status}\t{description}"
    )
    filtered.sort(key=lambda line: int(line.split("\t", 1)[0]))
    results_tsv.write_text(header + "\n" + "\n".join(filtered) + "\n")


def update_results_json(
    results_json_path: Path,
    experiment_input: dict[str, Any],
    score: int,
    max_score: int,
    pass_rate: float,
) -> None:
    payload = load_json(results_json_path)
    experiment_number = experiment_input["experiment"]
    status = experiment_input["status"]
    description = experiment_input["description"]

    payload["status"] = "idle"
    payload["last_updated"] = date.today().isoformat()
    payload["current_state"] = (
        "baseline_recorded" if experiment_number == 0 else "experiment_recorded"
    )

    if experiment_number == 0:
        payload.setdefault("baseline", {})
        payload["baseline"]["status"] = "recorded"
        payload["baseline"]["score"] = score
        payload["baseline"]["max_score"] = max_score
        payload["baseline"]["pass_rate"] = pass_rate

    contract = payload.setdefault("run_contract", {})
    contract["current_blocker"] = experiment_input.get(
        "current_blocker",
        contract.get("current_blocker", ""),
    )
    contract["next_action"] = experiment_input.get(
        "next_action",
        contract.get("next_action", ""),
    )
    contract["scoring_recorder"] = "../scripts/record_skill_autoresearch_experiment.py"

    record = {
        "experiment": experiment_number,
        "score": score,
        "max_score": max_score,
        "pass_rate": pass_rate,
        "status": status,
        "description": description,
    }
    experiments = [
        existing
        for existing in payload.get("experiments", [])
        if existing.get("experiment") != experiment_number
    ]
    experiments.append(record)
    experiments.sort(key=lambda item: item["experiment"])
    payload["experiments"] = experiments

    write_json(results_json_path, payload)


def append_changelog(changelog_path: Path, experiment_input: dict[str, Any], score: int, max_score: int) -> None:
    status = experiment_input["status"]
    experiment_number = experiment_input["experiment"]
    block = "\n".join(
        [
            "",
            f"## Experiment {experiment_number} — {status}",
            "",
            f"Score: {score}/{max_score}",
            f"Change: {experiment_input['change']}",
            f"Reasoning: {experiment_input['reasoning']}",
            f"Result: {experiment_input['result']}",
            f"Remaining failures: {experiment_input['remaining_failures']}",
        ]
    )

    existing = changelog_path.read_text() if changelog_path.exists() else "# ohmg skill-autoresearch changelog\n"
    if f"## Experiment {experiment_number} —" in existing:
        raise SystemExit(
            f"Experiment {experiment_number} is already recorded in {changelog_path}."
        )
    changelog_path.write_text(existing.rstrip() + block + "\n")


def main() -> None:
    args = parse_args()
    evals = load_json(args.evals)
    eval_ids = [row["id"] for row in evals.get("evals", [])]
    if not eval_ids:
        raise SystemExit(f"No evals found in {args.evals}")

    results_json_path = args.workspace / "results.json"
    baseline_contract = load_json(results_json_path).get("baseline", {})
    runs_per_experiment = int(baseline_contract.get("runs_per_experiment", 5))

    if args.write_template:
        args.write_template.parent.mkdir(parents=True, exist_ok=True)
        write_json(args.write_template, build_template(evals, runs_per_experiment))
        print(f"Wrote scoring template to {args.write_template}")
        return

    if not args.input:
        raise SystemExit("Use --write-template <path> or --input <path>.")

    experiment_input = load_json(args.input)
    for field in [
        "experiment",
        "status",
        "description",
        "change",
        "reasoning",
        "result",
        "remaining_failures",
    ]:
        if field not in experiment_input:
            raise SystemExit(f"Experiment input is missing required field: {field}")

    if not isinstance(experiment_input["experiment"], int):
        raise SystemExit("'experiment' must be an integer.")

    score, max_score, pass_rate = validate_scores(
        experiment_input, eval_ids, runs_per_experiment
    )

    append_results_tsv(
        args.workspace / "results.tsv",
        experiment_input["experiment"],
        score,
        max_score,
        pass_rate,
        experiment_input["status"],
        experiment_input["description"],
    )
    update_results_json(
        results_json_path,
        experiment_input,
        score,
        max_score,
        pass_rate,
    )
    append_changelog(
        args.workspace / "changelog.md",
        experiment_input,
        score,
        max_score,
    )
    print(
        f"Recorded experiment {experiment_input['experiment']} with score "
        f"{score}/{max_score} ({pass_rate}%)."
    )


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.exit(130)
