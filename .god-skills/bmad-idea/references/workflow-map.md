# bmad-idea Workflow Map

Use this file when the user already needs command-level mapping, output shapes,
or a multi-lane creative session plan.

## Workflow Commands

| Workflow | Primary command | Slash command | Lead agent | Typical output |
|----------|-----------------|---------------|------------|----------------|
| Brainstorming | `bmad-cis-brainstorming` | `/cis-brainstorm` | Carson | idea set, themes, next experiments |
| Design thinking | `bmad-cis-design-thinking` | `/cis-design-thinking` | Maya | empathy map, reframed problem, prototype/test plan |
| Innovation strategy | `bmad-cis-innovation-strategy` | `/cis-innovation-strategy` | Victor | market-gap analysis, JTBD framing, business model options |
| Problem solving | `bmad-cis-problem-solving` | `/cis-problem-solving` | Dr. Quinn | root-cause analysis, constraints map, solution plan |
| Storytelling | `bmad-cis-storytelling` | `/cis-storytelling` | Sophia | narrative framework, pitch story, messaging arc |

Outputs are typically saved to `./creative-outputs/` or `_bmad-output/`,
depending on the host configuration.

## Multi-Lane Use

Use `creative squad` when the request genuinely needs multiple lenses in the
same pass, such as:

- a raw idea that needs concept shaping, differentiation, and a pitch angle
- a user problem that needs empathy work plus problem diagnosis
- a launch concept that needs innovation framing and narrative packaging

Do not default to `creative squad` for single-lane requests.

## Direct Agent Loading

Load one agent directly when the user wants an ongoing conversation rather than
the full workflow wrapper:

| Command | Agent |
|---------|-------|
| `/cis-agent-brainstorming-coach` | Carson |
| `/cis-agent-design-thinking-coach` | Maya |
| `/cis-agent-innovation-strategist` | Victor |
| `/cis-agent-creative-problem-solver` | Dr. Quinn |
| `/cis-agent-storyteller` | Sophia |
| `/cis-agent-presentation-master` | Caravaggio |
