# Solutions

## Solutions

- Keep merged lanes closed and choose one remaining generic PM skill for a
  bounded packaging pass
- Prefer `standup-meeting` over `sprint-retrospective` because it is more
  collision-prone with the newly packaged planning and estimation surfaces,
  still contains stale template metadata, and has no local references or evals
- Add references and evals, but avoid assets or scripts unless a concrete
  implementation need appears
- Defer `skill-autoresearch` until the packaged skill still shows measured
  failures after the bounded packaging pass

## Frequency Ranking

1. Package a still-generic PM coordination skill with route-outs and
   reproducible evals
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
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- OpenAI agent evals guidance:
  https://developers.openai.com/api/docs/guides/agent-evals
- Microsoft `skills` repository:
  https://github.com/microsoft/skills

## Key Insight

- The next highest-value lane is still a PM-adjacent generic skill. After
  `task-estimation` merged, `standup-meeting` is now the clearest remaining gap
  because it still behaves like a generic ceremony template instead of a
  routing-aware daily coordination workflow.
