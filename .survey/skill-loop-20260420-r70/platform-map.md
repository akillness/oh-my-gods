# Platform Map: recurring oh-my-gods skill loop

## Settings

- Skill packaging remains progressive-disclosure first: metadata, bounded
  `SKILL.md`, then on-demand support files. Source:
  https://agentskills.io/specification
- GitHub now treats portable skill packaging as a managed lifecycle through
  `gh skill`, which increases the value of clean provenance and stable
  frontmatter. Source:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent runtimes increasingly expose tracing and observability as first-class
  concepts, which keeps observability improvements strategically relevant even
  when they are not the immediate next PR lane. Sources:
  https://openai.github.io/openai-agents-python/tracing/
  https://docs.langchain.com/langsmith/observability-concepts

## Rules

- Repair stale lock state before starting a new improvement branch
- Keep one bounded lane per run
- Prefer `references/` and `evals/` before `skill-autoresearch`
- Choose the next lane using both ecosystem signal and repo-local boundary pain

## Hooks

- After merges, rerun the survey lock before letting the scheduler assume PR review
- Validate the repo before any PR-open transition
- Register the PR path only after the target lane is validator-clean

## Platform Gaps

| Surface | Current repo gap | Why this run chose `performance-optimization` |
|---|---|---|
| Shared lock state | `current-lock.md` and `direction.md` still say PR `#67` is open | The scheduler first needed a survey-stage repair |
| Performance lane | Generic `SKILL.md`, no support files, overlap with `react-best-practices` | Strongest bounded local contradiction |
| Observability lane | Generic `SKILL.md`, no support files, strong external signal | Kept as the next survey candidate after the performance lane |
