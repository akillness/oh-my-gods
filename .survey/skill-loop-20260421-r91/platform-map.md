# Platform Map

## settings

- Reuse the standing landscape survey unless a newer external signal displaces
  the active lane.
- Treat PR-review runs as validation-first, not rewrite-first.
- Keep the recurring lock explicit about the current stage so scheduled runs do
  not repeat stale work.

## rules

- Review the active branch against `main`, the live PR state, and the packaged
  support surface before adding any new patch.
- Apply a bounded follow-up only if the review finds a concrete gap.
- If the review stays clean, move the lane to `merge` and defer the next survey
  lane to the following run.
- Do not start `skill-autoresearch` unless a packaged reviewed target still
  shows measured failures.

## hooks

- Pre-review: inspect the open PR and validate the active branch.
- During review: check for duplicate work, missing support surfaces, and
  standards drift.
- Post-review: update the shared lock with `blocker`, `next owner`, and
  `stage`.

## Current Mapping

- Survey result: no newer landscape signal displaced the active lane
- Active workflow on this run: `merge`
- Support decision:
  - assets: no
  - scripts: no
  - references: no additional changes needed
  - evals: no additional changes needed
  - skill-autoresearch: no
