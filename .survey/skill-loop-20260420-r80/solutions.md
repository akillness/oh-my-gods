# Solutions

## Solutions

- Keep merged lanes closed and choose one remaining generic planning skill for a
  bounded packaging pass
- Prefer `task-planning` over nearby candidates because it sits on a crowded
  routing surface, lacks local `references/` and `evals/`, and benefits from a
  clearer planning-packet output shape
- Add references and evals, but avoid assets or scripts unless a concrete
  implementation need appears
- Revisit `skill-autoresearch` only if the packaged skill still shows measured
  failures after the bounded packaging pass

## Frequency Ranking

1. Package a still-generic planning skill with route-outs and reproducible evals
2. Keep standardization as the repo-wide compliance gate
3. Defer mutation-loop optimization until a packaged skill still fails objective
   checks

## Categories

- recurring skill packaging
- planning-surface boundary repair
- progressive-disclosure support files
- eval-backed trigger quality

## Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- GitHub skills overview:
  https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- Adding skills for Copilot CLI:
  https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
- GitHub `gh skill` launch:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- OpenAI agent evals guidance:
  https://platform.openai.com/docs/guides/agent-evals

## Key Insight

- The next highest-value lane is not another debugging or observability skill.
  It is a planning surface that still looks like a generic template instead of a
  reusable routing and decomposition workflow.
