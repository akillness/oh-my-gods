# Context

## Workflow Context

- This recurring loop advances one bounded skill lane at a time.
- `sprint-retrospective` is the active lane because `standup-meeting` already
  merged and the next highest-leverage PM boundary gap moved into PR `#78`.
- The scheduled follow-up run must review the live branch before merge instead
  of reopening survey mode too early.

## Affected Users

- Repo maintainers who need predictable recurring-loop state
- Downstream agents that rely on PM skill boundaries to avoid routing
  retrospectives into planning, estimation, or standup work

## Current Workarounds

- Manual repo-wide validation
- Manual diff review against the open branch
- Survey lock files that carry stage, blocker, and next-owner state between runs

## Adjacent Problems

- Stale `pr-open` locks can cause the scheduler to repeat review work
- Missing recommended sections create low-grade standards drift even when the
  skill already has support files
- Premature `skill-autoresearch` would still be noise because this lane did not
  show a measured post-packaging failure

## User Voices

- The run contract requires each cycle to report current state, blocker, next
  owner, and whether the lane is in survey, improvement, PR-open, PR-review, or
  merge stage.
- The next run after PR registration must review the branch for duplicate work,
  missing improvements, or standardization gaps before merge.
