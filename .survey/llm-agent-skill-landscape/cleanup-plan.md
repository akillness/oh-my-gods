# Cleanup Plan: run 23 packaging (`agent-manager`)

## Goal

Package the bounded `agent-manager` slice so the next scheduled run can review a small PR instead of rediscovering the same packaging gap from scratch.

## Behavior lock

- Do not change the core `agent-manager` contract around lightweight local orchestration with `tmux` and Python.
- Keep the slice limited to `.god-skills/agent-manager/*` plus the recurring survey lock files; do not widen into `agentation` or reopen `ohmg`.
- Reuse the existing `scripts/` and `references/` footprint; this run should add reviewability and eval coverage, not new runtime tooling.
- Do not start a `skill-autoresearch` mutation loop for `agent-manager`; the goal is to make that decision measurable on a later run.

## Planned edits

1. Refresh the survey evidence after the `agent-browser` merge and confirm `agent-manager` is now the smallest high-value packaging gap.
2. Add the missing reviewability sections to `.god-skills/agent-manager/SKILL.md` and create `.god-skills/agent-manager/evals/evals.json`.
3. Revalidate the repo, confirm the diff is bounded to `agent-manager` plus the survey lock files, then open the PR path.

## Verification

- Run the repo validator and confirm `.god-skills/agent-manager/evals/evals.json` is valid JSON.
- Review the diff against `main` to confirm the slice stays bounded to `agent-manager` plus the survey lock files.
- Open the PR and record the resulting PR-open state for the next scheduled review run.
