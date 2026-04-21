# Context

## Workflow Context

- `web-design-guidelines` is a review skill, not an implementation skill. It
  should help an agent audit a UI surface against a live guideline set and
  report concrete findings without collapsing into a generic frontend or a11y
  catch-all.
- The current entrypoint is still a compact `1.0.0` carryover from the older
  Vercel skill packaging style: broad description, no support files, and a
  single "fetch guidelines then review files" flow.
- The live guideline source is external and mutable:
  `https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md`
  so the skill benefits from reference packaging that preserves route-outs and
  review structure even when the fetched command evolves.

## Affected Users

- Agents and maintainers who need a repeatable UI audit lane
- Users asking for "review my UI", "design audit", "UX review", or "check this
  page against best practices"
- Teams that need the skill to stay distinct from `web-accessibility`,
  `ui-component-patterns`, `react-best-practices`, and browser-validation tools

## Current Workarounds

- Rely on the inline `SKILL.md` only and refetch the raw guidelines every time
- Manually decide when to route to neighboring skills
- Apply ad hoc judgment about whether the task is a code review, a runtime
  browser pass, or an accessibility-only audit

## Adjacent Problems

- Overlap with accessibility-only and component-architecture lanes
- Risk of stale or overbroad triggering because the description still frames the
  skill as a generic "review my UI" surface
- No evals to protect the intended boundary between a broad UI audit and a
  narrower accessibility or implementation task

## User Voices

- Agent skill ecosystems are converging on portable skill folders with optional
  instructions, scripts, and resources rather than oversized inline entrypoints:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- GitHub's CLI docs explicitly frame skills as `SKILL.md` plus optional
  resources and scripts that are referenced from the instructions:
  https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
- The upstream Vercel guideline command itself is dense and fast-moving, which
  increases the value of a local routing and review scaffold:
  https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md
