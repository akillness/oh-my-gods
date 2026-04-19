# Context: recurring oh-my-gods skill loop

## Workflow Context

The recurring loop advances one bounded skill lane at a time. After PR `#66`
merged on April 19, 2026, the repo needed a fresh post-merge survey instead of
another `api-documentation` review pass. The remaining high-value gaps are
workflow-critical skills that still ship as generic single-file entrypoints
without focused `references/` and `evals/`.

## Affected Users

| Role | Responsibility | Skill Level |
|------|----------------|-------------|
| Skill maintainer | Keep repo skills spec-clean, discoverable, and reusable | Advanced |
| Agent host | Auto-trigger the right skill with minimal context waste | Intermediate |
| Operator or developer | Invoke the right workflow for debugging, reviews, docs, or planning | Intermediate |

## Current Workarounds

1. Keep using older generic entrypoints that mix boundaries and examples inside one large `SKILL.md`
2. Manually infer sibling-skill boundaries without route-out guidance
3. Defer eval-backed trigger checks and rely on subjective review alone

## Adjacent Problems

- Stale survey locks can cause the scheduler to replay closed PR lanes
- Missing evals delay any justified `skill-autoresearch` loop
- Missing references force the main skill body to carry too much explanatory load

## User Voices

- Agent Skills continues to emphasize progressive disclosure and optional
  support directories such as `references/`, `scripts/`, `assets/`, and
  `evals/`: https://agentskills.io/specification
- GitHub's April 16, 2026 `gh skill` launch raises the value of portable,
  provenance-friendly skill directories that can be discovered and published
  cleanly: https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Claude's sub-agent docs continue to frame descriptions and reusable skills as
  routing surfaces, which increases the cost of weak trigger copy:
  https://code.claude.com/docs/en/sub-agents
