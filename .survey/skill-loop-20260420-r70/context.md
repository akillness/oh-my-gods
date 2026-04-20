# Context: recurring oh-my-gods skill loop

## Workflow Context

The loop is in a post-merge reconciliation pass, not an active PR review. `main`
already contains `749b1eb Package debugging for root-cause isolation and clear
route-outs (#67)`, but the shared survey lock still says PR `#67` is open.
This run therefore has to repair state first, then freeze the next lane.

## Affected Users

| Role | Responsibility | Skill Level |
|------|----------------|-------------|
| Skill maintainer | keep the repo's next lane small, reviewable, and standards-clean | Advanced |
| Agent host | auto-trigger the correct workflow skill with minimal context waste | Intermediate |
| Operator or developer | land on the right optimization or observability surface without reading the whole catalog | Intermediate |

## Current Workarounds

1. Re-read stale lock files manually to infer whether the scheduled loop is in survey or PR review
2. Keep using generic single-file performance and observability skills with weak sibling boundaries
3. Defer support packaging because the next lane is not frozen tightly enough

## Adjacent Problems

- State drift can make the scheduler revisit closed PR lanes
- Both `monitoring-observability` and `performance-optimization` are still under-packaged compared with recently upgraded lanes
- Missing `references/` and `evals/` still block any justified `skill-autoresearch` run

## User Voices

- Agent Skills still emphasizes progressive disclosure with optional
  `references/`, `scripts/`, `assets/`, and focused main entrypoints:
  https://agentskills.io/specification
- GitHub's `gh skill` launch on April 16, 2026 makes portable, provenance-aware
  skill packaging more valuable:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- LangChain and OpenAI continue to elevate observability and tracing as agent
  primitives, which keeps `monitoring-observability` strategically important:
  https://docs.langchain.com/langsmith/observability-concepts
  https://openai.github.io/openai-agents-python/tracing/
