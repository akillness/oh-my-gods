#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: init_skill_autoresearch_workspace.sh [--force]

Initializes or refreshes the ohmg skill-autoresearch workspace with:
  - SKILL.md.baseline
  - results.tsv
  - results.json
  - changelog.md
  - dashboard.html
EOF
}

force=0
if [[ "${1:-}" == "--force" ]]; then
  force=1
elif [[ $# -gt 0 ]]; then
  usage >&2
  exit 1
fi

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
skill_dir=$(cd -- "$script_dir/.." && pwd)
workspace_dir="$skill_dir/skill-autoresearch-ohmg"
skill_file="$skill_dir/SKILL.md"
evals_file="$skill_dir/evals/evals.json"
today=$(date +%F)
eval_count=$(grep -c '"id"' "$evals_file" || true)

if [[ ! -f "$skill_file" ]]; then
  echo "Missing skill file: $skill_file" >&2
  exit 1
fi

if [[ ! -f "$evals_file" ]]; then
  echo "Missing eval file: $evals_file" >&2
  exit 1
fi

mkdir -p "$workspace_dir"

write_file_if_needed() {
  local target="$1"
  if [[ -f "$target" && $force -ne 1 ]]; then
    return
  fi
  cat > "$target"
}

cp_if_needed() {
  local source="$1"
  local target="$2"
  if [[ -f "$target" && $force -ne 1 ]]; then
    return
  fi
  cp "$source" "$target"
}

cp_if_needed "$skill_file" "$workspace_dir/SKILL.md.baseline"

write_file_if_needed "$workspace_dir/results.tsv" <<'EOF'
experiment	score	max_score	pass_rate	status	description
EOF

write_file_if_needed "$workspace_dir/results.json" <<EOF
{
  "skill": "ohmg",
  "status": "idle",
  "current_state": "workspace_initialized",
  "last_updated": "$today",
  "baseline": {
    "status": "pending",
    "runs_per_experiment": 5,
    "test_input_count": $eval_count,
    "eval_count": $eval_count
  },
  "run_contract": {
    "target_skill": "../SKILL.md",
    "evals": "../evals/evals.json",
    "workspace_initializer": "../scripts/init_skill_autoresearch_workspace.sh",
    "mutation_policy": "one_change_at_a_time",
    "keep_policy": "keep_only_strict_score_improvements",
    "current_blocker": "No deterministic response-capture and yes-no scoring runner has been executed yet.",
    "next_action": "Record experiment 0 baseline with the same prompt set across 5 repetitions once a deterministic scorer is wired."
  },
  "experiments": []
}
EOF

write_file_if_needed "$workspace_dir/changelog.md" <<EOF
# ohmg skill-autoresearch changelog

## Workspace initialization — keep

Score: pending
Change: Added the baseline workspace and run contract without mutating \`SKILL.md\`.
Reasoning: \`ohmg\` is standards-clean and eval-ready, but it was blocked on having no saved baseline workspace.
Result: Baseline artifacts exist and future runs can start at experiment 0 instead of recreating scaffolding.
Remaining failures: No deterministic response capture or scoring run has been executed yet.

## Run contract

- Target skill: \`../SKILL.md\`
- Eval file: \`../evals/evals.json\`
- Runs per experiment: 5
- Mutation policy: one instruction change at a time
- Keep policy: only strict score improvements
- Initialized: $today
EOF

write_file_if_needed "$workspace_dir/dashboard.html" <<'EOF'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ohmg skill-autoresearch dashboard</title>
    <style>
      :root {
        color-scheme: light;
        --bg: #f4f1ea;
        --surface: #fffdf8;
        --ink: #1f1b16;
        --muted: #655b4f;
        --accent: #a24d2f;
        --border: #d9cbb8;
      }
      body {
        margin: 0;
        font-family: "Iowan Old Style", "Palatino Linotype", serif;
        background: linear-gradient(180deg, #efe7da 0%, var(--bg) 100%);
        color: var(--ink);
      }
      main {
        max-width: 900px;
        margin: 0 auto;
        padding: 32px 20px 48px;
      }
      .panel {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: 18px;
        padding: 20px;
        box-shadow: 0 14px 40px rgba(80, 48, 25, 0.08);
      }
      h1, h2 {
        margin: 0 0 12px;
      }
      h1 {
        font-size: 2rem;
      }
      h2 {
        font-size: 1.1rem;
        color: var(--accent);
      }
      .meta {
        display: grid;
        gap: 12px;
        grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
        margin: 20px 0;
      }
      .card {
        padding: 14px;
        border-radius: 14px;
        border: 1px solid var(--border);
        background: #fff9f0;
      }
      .label {
        display: block;
        font-size: 0.8rem;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        color: var(--muted);
        margin-bottom: 6px;
      }
      .value {
        font-size: 1.1rem;
      }
      ul {
        margin: 0;
        padding-left: 18px;
      }
      code {
        font-family: "SFMono-Regular", "Menlo", monospace;
        font-size: 0.95em;
      }
      .empty {
        color: var(--muted);
      }
    </style>
  </head>
  <body>
    <main>
      <div class="panel">
        <h1>ohmg skill-autoresearch</h1>
        <p id="summary">Loading run state...</p>
        <div class="meta" id="meta"></div>
        <h2>Run Contract</h2>
        <ul id="contract"></ul>
        <h2>Experiments</h2>
        <div id="experiments" class="empty">Loading...</div>
      </div>
    </main>
    <script>
      fetch("./results.json")
        .then((response) => response.json())
        .then((data) => {
          document.getElementById("summary").textContent =
            `State: ${data.current_state}. Baseline is ${data.baseline.status}.`;

          const meta = [
            ["Skill", data.skill],
            ["Status", data.status],
            ["Updated", data.last_updated],
            ["Runs / experiment", data.baseline.runs_per_experiment],
            ["Prompt count", data.baseline.test_input_count],
            ["Eval count", data.baseline.eval_count]
          ];

          document.getElementById("meta").innerHTML = meta
            .map(
              ([label, value]) =>
                `<div class="card"><span class="label">${label}</span><span class="value">${value}</span></div>`
            )
            .join("");

          const contract = [
            ["Target skill", data.run_contract.target_skill],
            ["Eval file", data.run_contract.evals],
            ["Initializer", data.run_contract.workspace_initializer],
            ["Mutation policy", data.run_contract.mutation_policy],
            ["Keep policy", data.run_contract.keep_policy],
            ["Current blocker", data.run_contract.current_blocker],
            ["Next action", data.run_contract.next_action]
          ];

          document.getElementById("contract").innerHTML = contract
            .map(([label, value]) => `<li><strong>${label}:</strong> <code>${value}</code></li>`)
            .join("");

          const experiments = data.experiments || [];
          document.getElementById("experiments").innerHTML = experiments.length
            ? `<ul>${experiments
                .map(
                  (experiment) =>
                    `<li>Experiment ${experiment.experiment}: ${experiment.status} (${experiment.score}/${experiment.max_score})</li>`
                )
                .join("")}</ul>`
            : "No experiments recorded yet. Run experiment 0 once deterministic scoring is wired.";
        })
        .catch((error) => {
          document.getElementById("summary").textContent = `Failed to load results.json: ${error.message}`;
          document.getElementById("experiments").textContent = "Check that results.json exists next to dashboard.html.";
        });
    </script>
  </body>
</html>
EOF

echo "Initialized skill-autoresearch workspace: $workspace_dir"
