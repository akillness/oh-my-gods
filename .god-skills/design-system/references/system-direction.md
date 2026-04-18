# design-system direction reference

Load this reference after `design-system` is selected. Keep `SKILL.md`
focused on activation, high-level steps, and reusable examples.

## Why this skill exists

Use `design-system` when the job is to define or repair the shared visual
language across multiple surfaces, not just polish one component or fix one
screen.

The canonical output is:

1. visual direction
2. token policy
3. page-system rules
4. responsive and accessibility checks
5. handoff summary

## Route-in rules

Choose `design-system` when the request is about:

- a design-token set or token cleanup
- shared visual language across landing pages, dashboards, and forms
- primitive naming or visual-system governance
- landing page plus dashboard consistency
- page-system direction before component-by-component implementation

## Route-out rules

Do not keep adjacent jobs inside `design-system` when they are narrower:

- `ui-component-patterns`
  - reusable component APIs
  - slot and variant design
  - controlled vs uncontrolled boundaries
- `responsive-design`
  - breakpoint-only or overflow-only fixes
  - container query decisions without broader token/system work
- `web-accessibility`
  - accessibility-only remediation
  - focus management, labels, keyboard traps, WCAG-specific fixes

## Minimum design-system brief

Produce a compact brief with:

- audience and product context
- visual direction in plain language
- token groups to define or revise
- page types in scope
- responsive constraints
- accessibility guardrails
- handoff expectations for implementation

## Token checklist

Define only the token groups the product actually needs:

- color
- typography
- spacing
- radius
- shadow
- motion
- layout/container widths

Prefer named semantic tokens over raw one-off values.

## Page-system checklist

Before generating UI sections, lock:

- primary action hierarchy
- secondary action hierarchy
- section order by page type
- grid/container behavior
- mobile-first stacking rules
- content-density rules for dashboard and form surfaces

## Handoff contract

A good handoff includes:

- token summary
- section and layout rationale
- component primitives touched
- responsive notes
- accessibility notes
- open implementation risks

## Source anchors checked on 2026-04-18

- Agent Skills specification:
  `https://agentskills.io/specification`
- Agent Skills description guidance:
  `https://agentskills.io/skill-creation/optimizing-descriptions`
- Agent Skills best practices:
  `https://agentskills.io/skill-creation/best-practices`
- OpenAI Codex skills guide:
  `https://developers.openai.com/codex/skills`

Current ecosystem signal still favors compact entrypoints with progressive
disclosure, explicit trigger wording, and support files only when they add
clear leverage.
