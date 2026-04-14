# Cleanup Plan: run 25 packaging (`agentation`)

## Goal

Open the next bounded post-merge skill slice by making `agentation` standards-clean,
reviewable, and eval-ready without changing its runtime contract.

## Behavior lock

- Do not change the core `agentation` contract around UI annotations, MCP watch
  loops, and copy-paste fallback unless review uncovers a real in-scope gap.
- Keep the slice limited to `.god-skills/agentation/*` plus the recurring survey
  lock files; do not widen into `vibe-kanban`, `ohmg`, or older merged slices.
- Do not start a `skill-autoresearch` mutation loop for `agentation`; this run
  is only creating the packaging and measurement gate required before any scored
  optimization work would be justified.

## Planned edits

1. Reuse the saved survey evidence and refresh the lock files now that PR `#21`
   is already merged on `origin/main`.
2. Standardize `.god-skills/agentation/SKILL.md` so it has explicit trigger
   phrasing plus the missing `When to use this skill`, `Instructions`,
   `Examples`, and exact `Best practices` sections.
3. Add the missing `references/setup-guide.md` linked from `SKILL.md`.
4. Add `evals/evals.json` so future `skill-autoresearch` work has a real
   baseline gate.
5. Open a fresh PR path for this bounded `agentation` packaging slice.

## Verification

- Run `skill-standardization` validation on `.god-skills/agentation/` before and
  after the edits.
- Review the branch diff to confirm it stays bounded to `agentation` plus the
  survey lock files.
- Confirm the new branch is ready for a PR-open handoff rather than a wider
  implementation pass.
