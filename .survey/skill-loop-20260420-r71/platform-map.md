# Platform Map: recurring oh-my-gods skill loop

## Settings

- Portable skill packaging still rewards compact entrypoints plus on-demand
  support files. Source: https://agentskills.io/specification
- GitHub now treats skill installation and updates as a managed lifecycle
  through `gh skill`. Source:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Observability and tracing remain first-class agent concerns across major
  vendor docs. Sources:
  https://openai.github.io/openai-agents-python/tracing/
  https://docs.langchain.com/langsmith/observability-concepts

## Rules

- If the active PR lane is review-clean, merge it instead of reopening the same scope
- Keep merged lanes closed unless measured failures or review feedback reopen them
- Prefer `references/` and `evals/` before any `skill-autoresearch` loop
- Pick the next lane using both ecosystem signal and repo-local packaging gaps

## Hooks

- Validate the repo before moving from PR review to merge
- Update the shared lock as part of the merge path so the scheduler does not reopen the closed lane
- Promote the next candidate immediately after a clean merge

## Platform Gaps

| Surface | Current repo gap | Why this run closed `performance-optimization` |
|---|---|---|
| `performance-optimization` | Review-clean packaged lane | No duplicate work, no review blockers, and no standards drift remained |
| `monitoring-observability` | Generic `SKILL.md`, no `references/`, no `evals/` | Strongest remaining bounded packaging target after the perf lane closed |
