# Cleanup Plan: run 26 review (`agentation`)

## Goal

Review the bounded `agentation` PR slice for duplicate work or missed standards
gaps, apply only the smallest loop-state update if needed, and move the branch
onto the merge path.

## Behavior lock

- Do not change the core `agentation` contract around UI annotations, MCP watch
  loops, and copy-paste fallback unless review uncovers a real in-scope defect.
- Keep the slice limited to `.god-skills/agentation/*` plus the recurring survey
  lock files; do not widen into `vibe-kanban`, `ohmg`, or older merged slices.
- Do not start a `skill-autoresearch` mutation loop for `agentation`; this
  review pass is only deciding whether the current packaging slice is clean
  enough to merge.

## Planned edits

1. Reuse the saved survey evidence and rerun the standards validation on the
   current `agentation` branch.
2. Review the diff against `main` and confirm the slice stays bounded to
   `agentation` plus the loop-state files.
3. If the review remains clean, update the lock files from `PR-open` to
   `merge` and merge the existing PR instead of reopening implementation work.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/agentation/`.
- Review the diff against `main` to confirm the slice stays bounded to
  `agentation` plus the survey lock files.
- Confirm PR `#22` is still the only open lane for this slice before merging it.
