# Cleanup Plan

## Target

- `sprint-retrospective`

## Why this lane

- `standup-meeting` is already merged on `origin/main`, so the recurring loop
  must move to the next bounded PM skill gap.
- `sprint-retrospective` is adjacent to `standup-meeting`, `task-planning`, and
  `task-estimation`, but still lacks route-clean support files and trigger
  checks.

## Behavior to preserve

- The skill must keep owning retrospectives, milestone reviews, and completed
  work reflection.
- It must remain distinct from planning, estimation, daily syncs, and deep
  incident forensics.

## Bounded edits

1. Rewrite the skill front door to be routing-first and action-review aware.
2. Add only the reference files needed for mode choice and action follow-through.
3. Add evals that prove correct routing against neighboring PM skills.
4. Sync `SKILL.toon` to the new trigger surface.
5. Update recurring survey locks to move this lane into the current run state.

## Explicit non-goals

- No new dependencies
- No scripts
- No assets
- No `skill-autoresearch` loop on this run
- No repo-wide PM skill rewrite beyond `sprint-retrospective`
