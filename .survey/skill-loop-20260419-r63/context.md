# Workflow Context

The refactoring/cleanup skill lane sits in a part of the ecosystem where skills
need to be easy to trigger, easy to route away from neighboring work, and easy
to verify before a mutation loop is justified.

- Agent Skills still recommends progressive disclosure: keep `SKILL.md` compact
  and move dense material into `references/`, `scripts/`, or `assets/` only
  when needed: https://agentskills.io/specification
- Agent Skills guidance for scripts explicitly frames `scripts/` as optional and
  worth adding only when commands become complex or reliability-critical:
  https://agentskills.io/skill-creation/using-scripts
- Agent Skills guidance for evals now gives a more explicit `evals/evals.json`
  path and with-skill versus baseline comparisons, which raises the value of
  adding eval coverage before a mutation loop:
  https://agentskills.io/skill-creation/evaluating-skills
- Claude Code skill docs also keep supporting files optional and reference-led
  instead of defaulting every skill to scripts or assets:
  https://code.claude.com/docs/en/skills

## Affected Users

- Maintainers deciding what legacy skill to package next
- Agents that need to distinguish cleanup work from review, debugging, testing,
  or performance work
- Users who ask for "cleanup", "refactor", "deslop", "extract method", or
  "remove duplication" and need the right workflow to trigger

## Current Workarounds

- Keep old refactoring heuristics inline in the main `SKILL.md`
- Rely on manual interpretation to separate refactoring from review or debugging
- Defer `skill-autoresearch` because no frozen eval surface exists yet

## Adjacent Problems

- Without route-outs, refactoring can collide with `code-review`, `debugging`,
  `testing-strategies`, and `performance-optimization`
- Without references, the top-level skill becomes bulky and less triggerable
- Without evals, optimization loops are easy to justify rhetorically but hard
  to freeze and measure

## User Voices

- Recent empirical work suggests skill gains in the wild depend heavily on
  better matching and verification, not only on having more instructions:
  https://arxiv.org/abs/2603.15401
  https://arxiv.org/abs/2604.04323
