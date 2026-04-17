# bmad-idea

> Route fuzzy-front-end ideation into the right Creative Intelligence lane
> before the team commits to PRDs, architecture, or implementation.

[![Skills](https://img.shields.io/badge/Skills-bmad--idea-brightgreen)](../../.god-skills/bmad-idea/SKILL.md)
[![Version](https://img.shields.io/badge/version-1.0.0-blue)](../../.god-skills/bmad-idea/SKILL.md)

---

## Installation

```bash
npx skills add https://github.com/akillness/oh-my-gods --skill bmad-idea
```

Activate in conversation:

```text
bmad-idea 스킬을 설정하고 사용해줘. 기억해.
```

---

## When to use

- Brainstorm concept directions before narrowing scope
- Run design thinking when the job centers on users, empathy, workflows, or
  prototype direction
- Use innovation strategy for market gaps, differentiation, JTBD framing, or
  business-model choices
- Diagnose recurring blockers and root causes before roadmap or solution
  planning
- Turn a concept into a narrative, pitch, or product story

Use `bmad` instead when the work has already moved into structured delivery,
artifact progression, or implementation planning.

---

## Primary lanes

| Lane | Workflow | Slash command | Lead agent | Typical output |
|------|----------|---------------|------------|----------------|
| Brainstorming | `bmad-cis-brainstorming` | `/cis-brainstorm` | Carson | idea set, themes, next experiments |
| Design thinking | `bmad-cis-design-thinking` | `/cis-design-thinking` | Maya | empathy map, reframed problem, prototype/test plan |
| Innovation strategy | `bmad-cis-innovation-strategy` | `/cis-innovation-strategy` | Victor | market-gap analysis, JTBD framing, business model options |
| Problem solving | `bmad-cis-problem-solving` | `/cis-problem-solving` | Dr. Quinn | root-cause analysis, constraints map, solution plan |
| Storytelling | `bmad-cis-storytelling` | `/cis-storytelling` | Sophia | narrative framework, pitch story, messaging arc |

Default to one primary lane. Use `creative squad` only when the request
genuinely needs multiple creative lenses in the same pass.

---

## Direct specialist conversations

Load one specialist when the user wants an ongoing conversation rather than the
full workflow wrapper:

| Command | Agent |
|---------|-------|
| `/cis-agent-brainstorming-coach` | Carson |
| `/cis-agent-design-thinking-coach` | Maya |
| `/cis-agent-innovation-strategist` | Victor |
| `/cis-agent-creative-problem-solver` | Dr. Quinn |
| `/cis-agent-storyteller` | Sophia |
| `/cis-agent-presentation-master` | Caravaggio |

---

## Progressive disclosure

Keep the entrypoint compact and load deeper detail only when it helps:

- `references/workflow-map.md` for command mapping, output shapes, and
  `creative squad` guidance
- `references/agent-profiles.md` for facilitation style, methods, and visual
  tool notes

Do not dump the whole catalog when one lane is enough.

---

## Review notes

- `assets`: not needed for this skill
- `scripts`: not needed; there is no repeated deterministic helper to package
- `references`: required and now split behind progressive disclosure
- `evals`: required and present for lane-routing and trigger-quality coverage

---

## Related

- [SKILL.md](../../.god-skills/bmad-idea/SKILL.md) - standardized skill entrypoint
- [workflow-map.md](../../.god-skills/bmad-idea/references/workflow-map.md) - command map and output shapes
- [agent-profiles.md](../../.god-skills/bmad-idea/references/agent-profiles.md) - specialist fit and methods
- [bmad docs](../bmad/README.md) - structured BMAD delivery workflow
- [bmad-gds docs](../bmad-gds/README.md) - game development with BMAD
