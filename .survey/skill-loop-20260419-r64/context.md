# Context

## Workflow Context

- API work still tends to arrive as mixed packets: feature requests, PRD notes,
  integration asks, migration questions, and "should this be REST or GraphQL?"
  debates.
- Reusable agent skills are increasingly expected to turn those mixed packets
  into compact decision artifacts, not broad implementation dumps.
- In `oh-my-gods`, the better-maintained lanes now follow the same pattern:
  small triggerable `SKILL.md`, explicit route-outs, focused `references/`, and
  eval-backed boundaries.

## Affected Users

- Maintainers who need the repo's general-purpose skills to stay consistent.
- Agents choosing between `api-design`, `api-documentation`,
  `authentication-setup`, `backend-testing`, and `database-schema-design`.
- Downstream developers who need a contract packet before implementation,
  testing, or docs work begins.

## Current Workarounds

- Treat the old `api-design` skill as a generic API best-practices dump.
- Mix docs publishing, auth implementation, and testing advice directly into
  contract-design answers.
- Rely on human judgment to route to sibling skills because the current
  entrypoint lacks strong boundaries and measurable evals.

## Adjacent Problems

- `api-documentation` can be pulled in too early when the user really needs
  contract design first.
- `authentication-setup` and `database-schema-design` can be skipped even when
  unresolved auth or storage questions remain.
- Without evals, `skill-autoresearch` would optimize wording before the lane's
  basic package and boundaries are stable.

## User Voices

- Agent Skills packaging keeps rewarding compact entrypoints with support files:
  https://agentskills.io/specification
- GitHub's `gh skill` launch increases the value of portable, provenance-aware,
  update-friendly skill directories:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Anthropic continues to position subagents as specialized task-routing
  surfaces, which raises the cost of vague skill boundaries:
  https://docs.anthropic.com/en/docs/claude-code/sub-agents
