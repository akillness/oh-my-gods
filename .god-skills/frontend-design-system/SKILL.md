---
name: frontend-design-system
description: >
  Compatibility alias for `design-system`. Use when an existing workflow, setup
  script, or user explicitly asks for `frontend-design-system`; route ordinary
  UI system, design-token, landing-page, dashboard, form, and component-library
  visual-language work to `design-system` instead. Triggers on: legacy skill
  name, frontend-design-system alias, exact-folder compatibility, migration-safe
  UI system routing.
allowed-tools: Read Write Grep Glob
metadata:
  tags: frontend, design-system, alias, compatibility, design-tokens
  platforms: Claude, ChatGPT, Gemini, Codex
---

# Frontend Design System

This skill is a compatibility alias for `design-system`. Keep it thin.

## When to use this skill

- The user explicitly names `frontend-design-system`
- A repo or workflow still points at the old skill name
- You need migration-safe compatibility without creating a second UI-system spec

Do not use this alias as a separate design methodology. For normal UI-system,
token, visual-language, or page-system work, use `design-system`.

## Instructions

### Step 1: Confirm that this is alias-routing work

Use this skill only when the old skill name must remain discoverable.

If the user simply wants a design system or shared UI language, treat
`design-system` as the canonical surface.

### Step 2: Load the canonical skill

Read the canonical skill and its repo-local reference:

- `../design-system/SKILL.md`
- `../design-system/references/system-direction.md`

Reuse the canonical guidance for:

- token governance
- visual direction
- responsive and accessibility checkpoints
- handoff format

### Step 3: Keep the alias thin

Do not duplicate a separate support package here unless the alias itself gains
distinct behavior.

For this alias:

- `assets`: no
- `scripts`: no
- `references`: point to the canonical `design-system` reference
- `evals`: no separate package while the alias remains thin

### Step 4: Preserve route-outs

Keep neighboring boundaries aligned with the canonical skill:

- Route component API and slot design to `ui-component-patterns`
- Route responsive layout-only fixes to `responsive-design`
- Route accessibility-only remediation to `web-accessibility`

## Examples

### Example 1: Legacy workflow call

Input:

```text
Use frontend-design-system to clean up the visual language across our landing
page and dashboard.
```

Expected behavior:

- treat the request as a `design-system` job
- load the canonical `design-system` guidance
- avoid inventing alias-specific rules

### Example 2: Alias-only migration question

Input:

```text
Our prompt pack still mentions frontend-design-system. Should we keep using it?
```

Expected behavior:

- explain that it is a compatibility alias
- point future work to `design-system`
- keep the alias only for migration-safe discovery

## Best practices

1. Keep the alias short and routing-focused.
2. Update the canonical `design-system` skill first when behavior changes.
3. Add alias-specific support files only if the alias gains unique behavior.
4. Preserve route-outs so the alias does not become a catch-all frontend skill.

## References

- Canonical skill: `../design-system/SKILL.md`
- Canonical reference: `../design-system/references/system-direction.md`
- Agent Skills specification: `https://agentskills.io/specification`

## Metadata

### Version

- **Current Version**: 1.0.0
- **Last Updated**: 2026-04-18
- **Compatible Platforms**: Claude, ChatGPT, Gemini, Codex

### Related Skills

- [design-system](../design-system/SKILL.md)
- [ui-component-patterns](../ui-component-patterns/SKILL.md)
- [responsive-design](../responsive-design/SKILL.md)
- [web-accessibility](../web-accessibility/SKILL.md)

### Tags

`#frontend` `#design-system` `#alias` `#compatibility`
