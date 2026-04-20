# Context: recurring oh-my-gods skill loop

## Workflow Context

This run starts after PR registration, so the job is a review pass rather than a
fresh packaging pass. The `performance-optimization` lane already ships focused
references, evals, and a compact trigger surface; the question is whether any
duplicate work, missing support, or standards drift remains before merge.

## Affected Users

| Role | Responsibility | Skill Level |
|------|----------------|-------------|
| Skill maintainer | keep the next lane small, reviewable, and standards-clean | Advanced |
| Agent host | trigger the right performance or observability surface with minimal context waste | Intermediate |
| Operator or developer | land on the right measurement or observability skill without reading the whole catalog | Intermediate |

## Current Workarounds

1. Re-read the PR diff manually to decide whether support packaging is complete
2. Keep generic observability guidance in one oversized entrypoint instead of packaging it like the newer lanes
3. Delay the next lane choice until PR `#68` either fails review or merges

## Adjacent Problems

- `monitoring-observability` still ships as a generic single-file skill with no focused support package
- Reopening `performance-optimization` without measured review findings would duplicate closed work
- `skill-autoresearch` still has no justified target because the review-clean lane does not show objective failures

## User Voices

- Agent Skills still emphasizes progressive disclosure with optional
  `references/`, `scripts/`, `assets/`, and `evals/`:
  https://agentskills.io/specification
- GitHub's `gh skill` lifecycle raises the value of stable, provenance-friendly
  skill packaging:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- GitHub, OpenAI, Anthropic, and LangChain docs continue to reinforce skills,
  subagents, and tracing as first-class agent surfaces:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
  https://openai.github.io/openai-agents-python/tracing/
  https://code.claude.com/docs/en/sub-agents
  https://docs.langchain.com/langsmith/observability-concepts
