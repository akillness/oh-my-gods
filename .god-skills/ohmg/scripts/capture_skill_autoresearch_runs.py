#!/usr/bin/env python3

"""Capture repeated ohmg baseline or mutation runs via Gemini CLI."""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path
from typing import Any


def parse_args() -> argparse.Namespace:
    script_path = Path(__file__).resolve()
    skill_dir = script_path.parent.parent
    workspace_dir = skill_dir / "skill-autoresearch-ohmg"
    evals_path = skill_dir / "evals" / "evals.json"

    parser = argparse.ArgumentParser(
        description=(
            "Capture repeated Gemini CLI responses for ohmg skill-autoresearch "
            "baseline or mutation scoring."
        )
    )
    parser.add_argument(
        "--workspace",
        type=Path,
        default=workspace_dir,
        help="Workspace directory containing the ohmg skill-autoresearch artifacts.",
    )
    parser.add_argument(
        "--evals",
        type=Path,
        default=evals_path,
        help="Path to ohmg evals/evals.json.",
    )
    parser.add_argument(
        "--experiment",
        type=int,
        default=0,
        help="Experiment number to capture. Default: 0 (baseline).",
    )
    parser.add_argument(
        "--runs",
        type=int,
        default=5,
        help="Number of repetitions per eval prompt. Default: 5.",
    )
    parser.add_argument(
        "--model",
        help="Optional Gemini model override passed through to the CLI.",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print the capture plan without invoking Gemini CLI.",
    )
    return parser.parse_args()


def load_json(path: Path) -> Any:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError as exc:
        raise SystemExit(f"Missing JSON file: {path}") from exc
    except json.JSONDecodeError as exc:
        raise SystemExit(f"Invalid JSON in {path}: {exc}") from exc


def write_json(path: Path, payload: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def gemini_capabilities(gemini_bin: str) -> dict[str, bool]:
    help_run = subprocess.run(
        [gemini_bin, "--help"],
        capture_output=True,
        text=True,
        check=False,
    )
    help_text = f"{help_run.stdout}\n{help_run.stderr}"
    return {
        "supports_prompt": "--prompt" in help_text or "-p, --prompt" in help_text,
        "supports_output_format": "--output-format" in help_text,
    }


def build_capture_plan(
    evals_payload: dict[str, Any],
    run_count: int,
    experiment: int,
) -> list[dict[str, Any]]:
    prompts = evals_payload.get("evals", [])
    if not isinstance(prompts, list) or not prompts:
        raise SystemExit("The evals payload must contain a non-empty 'evals' list.")

    plan: list[dict[str, Any]] = []
    for run_number in range(1, run_count + 1):
        for eval_row in prompts:
            prompt_id = eval_row.get("id")
            prompt_text = eval_row.get("prompt")
            if not isinstance(prompt_id, int) or not isinstance(prompt_text, str):
                raise SystemExit("Each eval row needs integer 'id' and string 'prompt' fields.")
            plan.append(
                {
                    "experiment": experiment,
                    "run": run_number,
                    "prompt_id": prompt_id,
                    "prompt": prompt_text,
                }
            )
    return plan


def capture_one(
    gemini_bin: str,
    item: dict[str, Any],
    out_dir: Path,
    model: str | None,
    supports_output_format: bool,
) -> dict[str, Any]:
    command = [gemini_bin, "--prompt", item["prompt"]]
    if model:
        command.extend(["--model", model])
    if supports_output_format:
        command.extend(["--output-format", "json"])

    timestamp = datetime.now(timezone.utc).isoformat()
    result = subprocess.run(
        command,
        capture_output=True,
        text=True,
        check=False,
    )

    stdout_path = out_dir / ("response.json" if supports_output_format else "response.txt")
    stderr_path = out_dir / "stderr.txt"
    stdout_path.write_text(result.stdout, encoding="utf-8")
    stderr_path.write_text(result.stderr, encoding="utf-8")

    metadata = {
        "captured_at": timestamp,
        "experiment": item["experiment"],
        "run": item["run"],
        "prompt_id": item["prompt_id"],
        "prompt": item["prompt"],
        "command": command,
        "model": model or "gemini-default",
        "capture_mode": "json" if supports_output_format else "text",
        "exit_code": result.returncode,
        "stdout_path": stdout_path.name,
        "stderr_path": stderr_path.name,
    }
    write_json(out_dir / "metadata.json", metadata)
    return metadata


def main() -> int:
    args = parse_args()

    gemini_bin = shutil.which("gemini")
    if gemini_bin is None:
        raise SystemExit("Missing required CLI: gemini")

    capabilities = gemini_capabilities(gemini_bin)
    if not capabilities["supports_prompt"]:
        raise SystemExit("Installed Gemini CLI does not support --prompt headless mode.")

    evals_payload = load_json(args.evals)
    plan = build_capture_plan(evals_payload, args.runs, args.experiment)
    capture_root = args.workspace / "captured-runs" / f"experiment-{args.experiment}"
    capture_root.mkdir(parents=True, exist_ok=True)

    plan_payload = {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "experiment": args.experiment,
        "runs": args.runs,
        "model": args.model or "gemini-default",
        "gemini_bin": gemini_bin,
        "supports_output_format": capabilities["supports_output_format"],
        "item_count": len(plan),
        "items": [
            {
                "run": item["run"],
                "prompt_id": item["prompt_id"],
                "prompt": item["prompt"],
            }
            for item in plan
        ],
    }
    write_json(capture_root / "capture-plan.json", plan_payload)

    if args.dry_run:
        print(
            json.dumps(
                {
                    "status": "dry-run",
                    "capture_root": str(capture_root),
                    "supports_output_format": capabilities["supports_output_format"],
                    "planned_items": len(plan),
                },
                indent=2,
            )
        )
        return 0

    recorded = 0
    for item in plan:
        out_dir = capture_root / f"run-{item['run']:02d}" / f"prompt-{item['prompt_id']:02d}"
        out_dir.mkdir(parents=True, exist_ok=True)
        metadata = capture_one(
            gemini_bin=gemini_bin,
            item=item,
            out_dir=out_dir,
            model=args.model,
            supports_output_format=capabilities["supports_output_format"],
        )
        recorded += 1
        if metadata["exit_code"] != 0:
            print(
                json.dumps(
                    {
                        "status": "capture-failed",
                        "capture_root": str(capture_root),
                        "recorded_items": recorded,
                        "failed_item": {
                            "run": item["run"],
                            "prompt_id": item["prompt_id"],
                        },
                        "next_action": (
                            "Inspect the saved stderr.txt and metadata.json for the failed "
                            "item, fix Gemini auth/runtime issues, then rerun the capture."
                        ),
                    },
                    indent=2,
                )
            )
            return metadata["exit_code"] or 1

    print(
        json.dumps(
            {
                "status": "capture-complete",
                "capture_root": str(capture_root),
                "recorded_items": recorded,
                "supports_output_format": capabilities["supports_output_format"],
                "next_action": (
                    "Score the captured outputs in experiment-0.template.json, then "
                    "record the experiment with record_skill_autoresearch_experiment.py."
                ),
            },
            indent=2,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
