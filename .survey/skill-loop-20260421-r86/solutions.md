# Solutions

## Solutions

1. Keep the legacy `sprint-retrospective` skill unchanged
2. Run a deeper `skill-autoresearch` loop immediately
3. Do a bounded standardization pass first: tighten the trigger surface, add
   focused references, add routing evals, and sync compact discovery surfaces

## Frequency Ranking

1. Bounded standardization pass first
2. Leave the skill unchanged until a user complains
3. Full optimization loop before the support surface exists

## Categories

- `progressive-disclosure packaging`
- `routing-boundary hardening`
- `eval-backed trigger validation`
- `defer mutation-loop until measured residual failures exist`

## Curated Sources

- Agent Skills specification:
  https://agentskills.io/specification
- Agent Skills integration guidance:
  https://agentskills.io/integrate-skills
- Agent Skills description optimization guidance:
  https://agentskills.io/skill-creation/optimizing-descriptions
- GitHub `gh skill` launch:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Microsoft skills repository example:
  https://github.com/microsoft/skills

## Chosen Approach

- Use `skill-standardization` as the primary lane
- Do not start `skill-autoresearch` yet because the current target lacks the
  support baseline needed for a credible mutation loop
- Add only the support files justified by the PM routing boundary:
  `references/`, `evals/`, and a synced `SKILL.toon`
- Skip `assets/` and `scripts/` because the skill does not need executable
  helpers or static templates for this bounded pass
