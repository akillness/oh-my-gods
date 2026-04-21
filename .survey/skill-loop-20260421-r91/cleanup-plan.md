# Cleanup Plan

## Target

- `web-design-guidelines` review lane

## Why this lane is active now

- PR `#80` is already open, so this run must execute the first PR-review pass
  instead of opening a new lane.
- The recurring loop contract requires an explicit decision about whether the
  branch needs one bounded follow-up or is clean enough to move to merge.

## Behavior to preserve

- Keep `web-design-guidelines` as a broad UI audit surface based on the live
  Vercel guideline command.
- Preserve the packaged route-outs, references, evals, and synced
  `SKILL.toon`.
- Preserve the recurring-loop rule that review runs add only concrete bounded
  fixes, not churn.

## Bounded edits

1. Re-check the active branch for duplicate work, missing improvements, or
   standardization gaps.
2. Re-run the standard validation surfaces needed to justify a merge decision.
3. Update the recurring survey lock to `merge` if the review stays clean.
4. Record the review-run survey package for traceability.

## Explicit non-goals

- No new dependencies
- No scripts or assets unless review reveals a concrete missing support need
- No `skill-autoresearch` loop on this run
- No browser validation; `playwriter` would be used only if runtime review were
  required
- No unrelated repo-wide cleanup beyond the recurring lock and this run's
  survey artifact
