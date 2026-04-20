# Platform Map: recurring oh-my-gods skill loop

## Settings

- Portable skill packaging still rewards compact entrypoints plus on-demand
  support files. Source: https://agentskills.io/specification
- GitHub now treats skills as an installable lifecycle through `gh skill`.
  Source:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Tracing and observability remain first-class concepts in current agent and
  LLM platform docs. Sources:
  https://openai.github.io/openai-agents-python/tracing/
  https://docs.langchain.com/langsmith/observability-concepts

## Rules

- Keep merged lanes closed unless review feedback or failing checks reopen them
- Package the next lane with `references/` and `evals/` before considering
  `skill-autoresearch`
- Keep `monitoring-observability` focused on telemetry design, dashboards,
  alerting, and ownership instead of raw log triage or tuning work

## Hooks

- Validate the repo before opening the next PR path
- Record the lane decision in the shared lock so later runs do not duplicate
  the closed `performance-optimization` work
- Revisit `skill-autoresearch` only after the packaged lane is review-clean

## Platform Gaps

| Surface | Current repo gap | Why it is next |
|---|---|---|
| `monitoring-observability` | generic `SKILL.md`, no `references/`, no `evals/` | strongest remaining bounded package target after PR `#68` merged |
| `performance-optimization` | none for this loop | already merged and should stay closed |
