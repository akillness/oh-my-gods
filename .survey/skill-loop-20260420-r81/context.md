# Context

## Workflow Context

- The recurring loop has already closed `debugging`,
  `performance-optimization`, `monitoring-observability`, `log-analysis`,
  `environment-setup`, `user-guide-writing`, `data-analysis`, and
  `pattern-detection`.
- `task-planning` is the only active open lane. The repo now needs branch review
  discipline more than another fresh survey target.
- Repo-wide spec validation still passes, so the review focus is duplicate work,
  missing route-outs, support-file sync, and whether a mutation loop is
  justified.

## Affected Users

- Maintainers who need the recurring loop to move forward without reopening
  closed lanes
- Agents that need `task-planning` to produce planning packets instead of
  estimation, standup, or retrospective behavior
- Reviewers who need objective evidence before merging the active lane

## Current Workarounds

- Re-read the branch diff against `origin/main`
- Re-run repo-wide validation
- Compare `task-planning` against neighboring PM skills and its new support
  files

## Adjacent Problems

- Leaving the lock at `pr-open` would cause the next run to repeat already-done
  review work
- Starting a new target before closing `task-planning` would break the one-lane
  recurring discipline
- Running `skill-autoresearch` without a measured residual failure would add
  loop overhead without clear leverage

## User Voices

- Current ecosystem guidance still rewards portable skill packaging, sharp
  route-outs, and eval-backed trigger quality over broad rewrites
- The active branch already added the support surfaces most likely to improve
  `task-planning`, so review evidence now matters more than more edits
