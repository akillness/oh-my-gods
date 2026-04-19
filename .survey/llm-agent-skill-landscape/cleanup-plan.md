# Cleanup Plan: `workflow-automation` post-merge follow-up

## Goal

Repair the compact discovery and eval surfaces for `workflow-automation` after
the merged lane review found one stale `SKILL.toon` file and one soft eval set.
Keep the follow-up bounded to those two files, re-validate the repo, and reopen
a narrow PR instead of broadening the lane.

## Behavior lock

- Keep this run focused on the follow-up `workflow-automation` lane only.
- Do not reopen already-merged unrelated lanes.
- Keep the support package decision unchanged:
  - `assets`: no
  - `scripts`: no
  - `references`: keep the added runner-selection and local-CI parity guides
  - `evals`: tighten the existing checks without changing the covered prompts
- Do not start a `skill-autoresearch` mutation loop in this run.

## Planned checks

1. Sync `SKILL.toon` to the current repo-scoped `SKILL.md` intent.
2. Tighten eval assertions so they are more explicit and testable.
3. Re-run repo validation with the repo-local validator.
4. Open a narrow follow-up PR for the repaired discovery/eval surfaces.

## Verification

- `python3 validate_frontmatter.py`
- `git diff --stat main...HEAD`
- `gh pr create --fill`
