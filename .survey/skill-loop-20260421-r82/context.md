# Context

## Workflow Context

- The recurring loop has already closed `debugging`,
  `performance-optimization`, `monitoring-observability`, `log-analysis`,
  `environment-setup`, `user-guide-writing`, `data-analysis`,
  `pattern-detection`, and now `task-planning`.
- Repo-wide spec validation still passes, so the remaining value is not schema
  repair. The remaining value is sharper routing, progressive-disclosure
  packaging, and reproducible trigger checks for still-generic skills.
- The strongest remaining under-packaged cluster is still PM-adjacent:
  `task-estimation`, `standup-meeting`, and `sprint-retrospective`.

## Affected Users

- Maintainers who need one bounded recurring lane at a time without reopening
  merged work
- Agents that need a reliable sizing surface distinct from planning, daily
  status cadence, and retrospective facilitation
- Reviewers who need objective trigger/output checks before any deeper
  optimization loop

## Current Workarounds

- Rely on generic task-estimation boilerplate that mixes sprint scope, roadmap
  planning, and scheduling with weak boundary language
- Manually infer when a request should move to `task-planning`,
  `standup-meeting`, or `sprint-retrospective`
- Skip local references and evals, which makes future rewrites harder to judge

## Adjacent Problems

- PM-adjacent skills can over-trigger each other when their boundaries stay
  generic
- Single-file skills without local references or evals are harder to keep
  aligned as the catalog grows
- Starting `skill-autoresearch` before packaging the basic support surface
  would freeze a weak baseline

## User Voices

- Current ecosystem guidance still rewards portable skill directories with
  reusable references, evals, and clean route-outs over oversized inline
  instructions
- Eval-backed skill packaging is increasingly the default expectation for
  reusable agent workflows rather than a later optional polish step
