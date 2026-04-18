# Cleanup Plan: review the React guidance lane before merge

## Goal

Keep the recurring loop aligned with the current skill-packaging signal by
running one bounded review pass on the open React-guidance PR, removing any
remaining duplicate alias support content, aligning catalog copy with the
canonical/alias split, and moving the lane toward merge once validation is
clean.

## Behavior lock

- Keep this run focused on the already-open
  `react-best-practices` / `vercel-react-best-practices` lane.
- Do not widen this run to `playwriter` or any already merged lane unless a
  shared blocker appears.
- Keep the support package minimal and explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: no alias-local support files; the canonical skill should
    continue to own the detailed rule pack
  - `evals`: yes, because the canonical/alias split needs trigger-quality
    checks on both sides
- Update public discovery surfaces where the lane meaning changed materially:
  README catalog entries and survey lock files.
- Do not start a `skill-autoresearch` mutation loop in this run unless the new
  canonical/alias split still leaves measured failures after review.

## Planned edits

1. Remove any remaining duplicate alias support content from
   `.god-skills/vercel-react-best-practices/`.
2. Align the README catalog entries with the compatibility-alias wording.
3. Refresh the survey lock so the run is recorded as a review follow-up instead
   of the initial PR-open registration.
4. Re-run validation and confirm the lane is ready for merge if no other gaps
   remain.

## Verification

- Validate both React guidance skills with the repo validator and confirm they
  stay standards-compliant after the alias support surface is thinned.
- Re-run repo-wide validation and confirm no new errors are introduced.
- Check `git diff --stat` and `git status --short --branch` for bounded scope.
- Keep the existing PR reviewable and move it toward merge only if the scope is
  still bounded.
