# Context

## Workflow Context

- The recurring loop has already closed `debugging`,
  `performance-optimization`, `monitoring-observability`, `log-analysis`,
  `environment-setup`, `user-guide-writing`, `data-analysis`, and
  `pattern-detection`.
- Repo-wide spec validation still passes, so the remaining work is not schema
  repair. The remaining value is sharper routing, progressive-disclosure
  packaging, and reproducible trigger checks for still-generic skills.
- The strongest remaining under-packaged cluster is planning and PM-adjacent
  skills such as `task-planning`, `task-estimation`, `standup-meeting`, and
  `sprint-retrospective`.

## Affected Users

- Maintainers who need bounded packaging work that does not reopen merged lanes
- Agents that need a reliable planning surface before implementation or sizing
- Users who ask vague "what should we do next?" questions that should become a
  planning packet rather than agile boilerplate

## Current Workarounds

- Rely on generic task-planning text with broad examples and weak route-outs
- Manually infer when requests should move to `task-estimation`,
  `standup-meeting`, or `sprint-retrospective`
- Reuse richer planning guidance from other local skill catalogs instead of the
  repo-local packaged skill

## Adjacent Problems

- Broad planning prompts can over-trigger nearby PM and process skills
- Single-file skills without local references or evals are harder to keep
  aligned as the catalog grows
- Reviewers lack an objective trigger/output harness when planning skills are
  rewritten

## User Voices

- Agents increasingly depend on portable skill directories with reusable
  references, scripts, and evals rather than oversized inline instructions
- Current ecosystem guidance keeps rewarding clean skill boundaries and
  reproducible evaluation over broad catch-all instructions
