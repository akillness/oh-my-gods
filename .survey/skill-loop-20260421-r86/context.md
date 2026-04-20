# Context

## Workflow Context

- The recurring loop already closed `debugging`,
  `performance-optimization`, `monitoring-observability`, `log-analysis`,
  `environment-setup`, `user-guide-writing`, `data-analysis`,
  `pattern-detection`, `task-planning`, `task-estimation`, and
  `standup-meeting`.
- `standup-meeting` is merged on `origin/main`, so keeping the loop at `merge`
  would now be stale duplicate work.
- The highest-leverage remaining gap sits in the same PM routing cluster:
  `sprint-retrospective` still uses an older generic structure with no
  `references/` or `evals/`, while adjacent PM skills now use route-first
  packaging and explicit trigger boundaries.

## Affected Users

- Maintainers who need the recurring loop to pick the next bounded lane instead
  of re-reporting merged PR state
- Agents that need clear separation between retrospective work, standups,
  planning, and estimation
- Reviewers who need a small support-file-backed diff instead of another broad
  PM rewrite

## Current Workarounds

- Re-reading merged `standup-meeting` state instead of opening a new lane
- Letting `sprint-retrospective` stay discoverable only through a broad,
  ceremony-heavy legacy description
- Handling retrospective follow-through ad hoc because the skill has no action
  review reference or trigger evals

## Adjacent Problems

- A weak retrospective boundary can steal prompts that belong to
  `task-planning`, `task-estimation`, or `standup-meeting`
- Without evals, the repo has no reproducible check that the retrospective
  skill routes neighboring PM work outward
- Starting `skill-autoresearch` before the support surface exists would be
  optimizing an unmeasured baseline

## User Voices

- Agent Skills guidance continues to favor progressive disclosure and
  support-file-backed skills over oversized inline instructions:
  https://agentskills.io/specification
- Agent Skills best-practice guidance explicitly warns against over-comprehensive
  skills and recommends moving detailed material into references:
  https://agentskills.io/skill-creation/best-practices
- GitHub's April 16, 2026 `gh skill` launch increases the value of portable,
  provenance-friendly skills that are easy to inspect, validate, and update:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- OpenAI's eval guidance continues to reward frozen, reproducible evaluation
  gates before deeper optimization loops:
  https://developers.openai.com/api/docs/guides/agent-evals

## Selected Direction

- Target this run: `sprint-retrospective`
- Why: it is the highest-value remaining PM boundary gap after
  `standup-meeting` merged, and it needs packaging hardening before any
  mutation loop could be justified
