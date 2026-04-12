# ohmg skill-autoresearch baseline workflow

Use this note when the next run is ready to record a real `ohmg` baseline or mutation experiment.

## Why this exists

The `ohmg` skill now has:

- a standards-clean `SKILL.md`
- eval prompts in `evals/evals.json`
- a workspace in `skill-autoresearch-ohmg/`
- a recorder script in `scripts/record_skill_autoresearch_experiment.py`

What it still does not have is recorded baseline evidence. The workspace now includes a capture helper so the next run can collect outputs first and score them second.

## Step 1: Capture the raw runs

From the `ohmg` skill directory:

```bash
python3 scripts/capture_skill_autoresearch_runs.py --experiment 0
```

What this does:

- writes responses under `skill-autoresearch-ohmg/captured-runs/experiment-0/`
- stores one `metadata.json` plus stdout/stderr files per run and prompt
- detects whether the installed Gemini CLI supports `--output-format json`; if not, it falls back to plain-text capture

Useful preflight:

```bash
python3 scripts/capture_skill_autoresearch_runs.py --experiment 0 --dry-run
```

Current known caveat:

- the official Gemini CLI docs describe `--output-format json`, but the installed local CLI may lag those docs; the helper records that capability in `capture-plan.json`

## Step 2: Generate or open the scoring template

From the `ohmg` skill directory:

```bash
python3 scripts/record_skill_autoresearch_experiment.py \
  --write-template skill-autoresearch-ohmg/experiment-0.template.json
```

This creates a pass/fail grid with five runs and one score row per eval prompt.

## Step 3: Fill the template after real runs

For each run:

1. Read the captured `response.txt` or `response.json` for each eval prompt.
2. Decide whether the response passes the prompt-level assertions as a whole.
3. Set each `pass` field to `true` or `false`.
4. Add short notes only where a failure pattern is useful to remember.

Use the top-level fields to summarize the experiment:

- `description`: one-line label
- `change`: the one mutation you tested, or `"No mutation"` for baseline
- `reasoning`: why the run exists
- `result`: short interpretation of the score
- `remaining_failures`: recurring misses worth targeting next
- `current_blocker`: only if the blocker changed
- `next_action`: what the next run owner should do

## Step 4: Record the experiment

```bash
python3 scripts/record_skill_autoresearch_experiment.py \
  --input skill-autoresearch-ohmg/experiment-0.template.json
```

The recorder updates:

- `skill-autoresearch-ohmg/results.tsv`
- `skill-autoresearch-ohmg/results.json`
- `skill-autoresearch-ohmg/changelog.md`

## Scoring model

- Max score = `runs_per_experiment * eval_count`
- Current `ohmg` contract = `5 * 4 = 20`
- Each prompt/run pair is one binary pass/fail decision

This keeps the loop honest: one mutation at a time, same prompt set every run, and recorded evidence for both kept and discarded experiments.
