# Solutions

## Solutions

- Keep merged lanes closed and choose one remaining generic PM skill for a
  bounded packaging pass
- Prefer `task-estimation` over nearby candidates because it sits on the same
  crowded planning cluster as `task-planning`, still has no local
  `references/` or `evals/`, and benefits from clearer route-outs around
  sizing, forecasting, and commitment language
- Add references and evals, but avoid assets or scripts unless a concrete
  implementation need appears
- Defer `skill-autoresearch` until the packaged skill still shows measured
  failures after the bounded packaging pass

## Frequency Ranking

1. Package a still-generic PM skill with route-outs and reproducible evals
2. Keep standardization as the repo-wide compliance gate
3. Defer mutation-loop optimization until a packaged skill still fails
   objective checks

## Categories

- recurring skill packaging
- PM-surface boundary repair
- progressive-disclosure support files
- eval-backed trigger quality

## Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- GitHub skills overview:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- GitHub CLI `gh skill` release notes:
  https://github.com/cli/cli/releases/tag/v2.90.0
- OpenAI agent evals guidance:
  https://developers.openai.com/api/docs/guides/agent-evals
- Microsoft `skills` repository test harness:
  https://github.com/microsoft/skills

## Key Insight

- The next highest-value lane is still a PM-adjacent generic skill. After
  `task-planning` merged, `task-estimation` is now the clearest remaining gap
  because it still looks like a template instead of a routing-aware sizing and
  forecast workflow.
