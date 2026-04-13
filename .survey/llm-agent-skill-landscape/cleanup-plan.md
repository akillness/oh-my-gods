# Cleanup Plan: run 22 review (`agent-browser`)

## Goal

Review the bounded `agent-browser` PR slice for duplicate work or missed standards gaps, apply only the smallest lifecycle fix if needed, and move the branch onto the merge path.

## Behavior lock

- Do not change the core `agent-browser` contract around isolated browser automation, ref-based interaction, or explicit verification unless review uncovers a real in-scope defect.
- Preserve the distinction between `agent-browser` and `playwriter`: disposable or CI-friendly browser state vs the user's running authenticated Chrome session.
- Keep the slice limited to `.god-skills/agent-browser/*` plus the recurring survey lock files; do not widen into `agent-manager`, `agentation`, or `ohmg`.
- Do not start a `skill-autoresearch` mutation loop for `agent-browser`; this review pass only validates the packaging slice and advances its lifecycle state.

## Planned edits

1. Reuse the saved survey evidence and re-run the standards validation on the current `agent-browser` branch.
2. Review the diff against `main` to confirm the slice still stays bounded to `agent-browser` plus loop-state files.
3. If the review remains clean, update the lock files from `PR-open` to `merge` and ready the existing PR for merge instead of opening duplicate PR work.

## Verification

- Run the validator on `.god-skills/agent-browser/`.
- Recompute the repo-wide standards counts after the review pass.
- Review the diff and PR state to confirm the slice stays bounded and no duplicate work is being reopened.
