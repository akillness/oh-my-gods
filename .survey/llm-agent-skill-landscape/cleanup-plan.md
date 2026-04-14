# Cleanup Plan: run 24 review (`agent-manager`)

## Goal

Review the bounded `agent-manager` PR slice for duplicate work or missed standards gaps, apply only the smallest loop-state update if needed, and move the branch onto the merge path.

## Behavior lock

- Do not change the core `agent-manager` contract around lightweight local orchestration with `tmux` and Python unless review uncovers a real in-scope defect.
- Keep the slice limited to `.god-skills/agent-manager/*` plus the recurring survey lock files; do not widen into `agentation`, `vibe-kanban`, or reopen `ohmg`.
- Do not start a `skill-autoresearch` mutation loop for `agent-manager`; this review pass is only deciding whether the current packaging slice is clean enough to merge.

## Planned edits

1. Reuse the saved survey evidence and re-run the standards validation on the current `agent-manager` branch.
2. Review the diff against `main` and confirm the slice stays bounded to `agent-manager` plus the loop-state files.
3. If the review remains clean, update the lock files from `PR-open` to `merge` and merge the existing PR instead of reopening implementation work.

## Verification

- Run the repo validator and the `skill-standardization` validator on `.god-skills/agent-manager/`.
- Review the diff against `main` to confirm the slice stays bounded to `agent-manager` plus the survey lock files.
- Confirm PR `#21` is still the only open lane for this slice before merging it.
