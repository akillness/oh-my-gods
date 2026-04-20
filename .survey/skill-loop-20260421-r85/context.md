# Context

## Workflow Context

- The recurring loop has already closed `debugging`,
  `performance-optimization`, `monitoring-observability`, `log-analysis`,
  `environment-setup`, `user-guide-writing`, `data-analysis`,
  `pattern-detection`, `task-planning`, and `task-estimation`.
- `standup-meeting` is the current active lane, but this run is a review gate
  rather than a rewrite because the packaging pass already added route-outs,
  `references/`, `evals/`, and a refreshed `SKILL.toon`.
- Repo-wide validation still passes, so the question for this run is whether
  any bounded follow-up patch is justified after PR registration.

## Affected Users

- Maintainers who need the recurring lock to match the actual PR lifecycle
- Reviewers who need one clean merge-path decision instead of repeated
  `pr-open` runs on the same lane
- Agents that need `standup-meeting` to stay distinct from planning,
  estimation, and retrospective workflows

## Current Workarounds

- Keep re-reading the open PR branch by hand to determine whether another patch
  is actually needed
- Leave the lock at `pr-open`, which causes the next run to repeat already
  completed review work

## Adjacent Problems

- Advancing to a new lane before merging `standup-meeting` would strand a live
  recurring PR
- Starting `skill-autoresearch` now would optimize a target that has not shown
  a post-packaging measured failure

## User Voices

- Current ecosystem guidance still rewards portable skill directories with
  progressive-disclosure support files and reproducible evals over repeated
  large rewrites
- Review-stage recurrence should move to merge once validation and diff review
  stay clean, otherwise the loop wastes runs on stale branch state
