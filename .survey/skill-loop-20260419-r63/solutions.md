# Solutions

## Solution Inventory

1. Keep the entrypoint compact and procedural
   - Use a small behavior-preserving refactor workflow rather than a large
     pattern catalog in `SKILL.md`.
   - Evidence:
     - Agent Skills specification: https://agentskills.io/specification
     - Claude Code skills docs: https://code.claude.com/docs/en/skills

2. Add targeted references before adding scripts or assets
   - The current standards still treat `references/` as the highest-leverage
     support surface for dense guidance, while `scripts/` and `assets/` remain
     optional.
   - Evidence:
     - Agent Skills specification: https://agentskills.io/specification
     - Script guidance: https://agentskills.io/skill-creation/using-scripts

3. Add evals before `skill-autoresearch`
   - A frozen prompt-and-assertion surface is now the cleanest justification
     for any future optimization loop.
   - Evidence:
     - Agent Skills eval guidance: https://agentskills.io/skill-creation/evaluating-skills
     - Recent skill-benchmark papers show gains depend on better matching and
       measured refinement rather than blind instruction growth:
       https://arxiv.org/abs/2603.15401
       https://arxiv.org/abs/2604.04323

## Frequency Ranking

Highest-value packaging moves for `code-refactoring`:

1. Tighten trigger wording and add explicit route-outs
2. Replace the inline-heavy entrypoint with a compact behavior-preserving workflow
3. Add focused references for slice planning and verification
4. Add evals so future `skill-autoresearch` runs are measurable
5. Defer scripts and assets unless repeated deterministic workflow gaps appear

## Categories

- Discovery quality: trigger wording, route-outs, negative triggers
- Progressive disclosure quality: compact entrypoint, focused references
- Evaluation quality: realistic prompts and binary assertions
- Scope control: cleanup versus review, debugging, testing, or redesign

## Curated Sources

- Agent Skills specification: https://agentskills.io/specification
- Agent Skills script guidance: https://agentskills.io/skill-creation/using-scripts
- Agent Skills eval guidance: https://agentskills.io/skill-creation/evaluating-skills
- Claude Code skills docs: https://code.claude.com/docs/en/skills
- SWE-Skills-Bench: https://arxiv.org/abs/2603.15401
- How Well Do Agentic Skills Work in the Wild: https://arxiv.org/abs/2604.04323

## Key Insight

For the next lane, `code-refactoring` does not need assets or scripts yet. It
needs the same compact entrypoint plus references and eval package that the
repo's stronger standardized skills now share.
