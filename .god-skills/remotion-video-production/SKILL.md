---
name: remotion-video-production
description: >
  Compatibility alias for `video-production` when a prompt, setup surface, or
  legacy workflow explicitly asks for Remotion video production. Use when the
  request names Remotion, React-based video rendering, compositions, scene
  components, or a legacy `remotion-video-production` catalog entry, but the
  real workflow is still the canonical programmable-video lane. Prefer
  `video-production` for general use. Triggers on: remotion-video-production,
  Remotion render pipeline, React video composition, migrate old Remotion
  skill.
allowed-tools: Read Write Grep Glob
metadata:
  tags: video, remotion, alias, compatibility, react
  platforms: Claude, ChatGPT, Gemini, Codex
---

# Remotion Video Production

This skill is a compatibility alias for `video-production`. Keep it thin.

## When to use this skill

- The user explicitly names `remotion-video-production`
- A repo or workflow still points at the old Remotion-specific skill name
- You need migration-safe compatibility without maintaining a second full video
  production spec

Do not use this alias as a separate methodology. For normal programmable video,
batch render, variant generation, or automated video workflow requests, use
`video-production`.

## Instructions

### Step 1: Confirm that this is alias-routing work

Use this skill only when the legacy name itself matters for discovery or
migration.

If the user simply wants programmable or automated video production, treat
`video-production` as the canonical surface.

### Step 2: Load the canonical skill

Read the canonical skill and its repo-local reference:

- `../video-production/SKILL.md`
- `../video-production/references/video-direction.md`

Reuse the canonical guidance for:

- pipeline choice
- scene or segment planning
- render and validation checkpoints
- route-outs to neighboring skills

### Step 3: Keep the alias thin

Do not duplicate a separate support package here unless the alias itself gains
distinct behavior.

For this alias:

- `assets`: no
- `scripts`: no
- `references`: point to the canonical `video-production` reference
- `evals`: no separate package while the alias remains thin

### Step 4: Preserve route-outs

Keep neighboring boundaries aligned with the canonical skill:

- Route editable slide decks to `presentation-builder`
- Route campaign or messaging-only work to `marketing-automation`
- Route single bitmap-image generation to `imagegen`

## Examples

### Example 1: Legacy workflow call

Input:

```text
Use remotion-video-production to help us design a code-driven product trailer.
```

Expected behavior:

- treat the request as a `video-production` job
- load the canonical `video-production` guidance
- keep Remotion as a valid pipeline choice without maintaining alias-specific
  instructions

### Example 2: Alias-only migration question

Input:

```text
Our old prompt pack still mentions remotion-video-production. Should we keep it?
```

Expected behavior:

- explain that it is a compatibility alias
- point future work to `video-production`
- keep the alias only for migration-safe discovery

## Best practices

1. Keep the alias short and routing-focused.
2. Update the canonical `video-production` skill first when behavior changes.
3. Add alias-specific support files only if the alias gains unique behavior.
4. Preserve route-outs so the alias does not become a catch-all media skill.

## References

- Canonical skill: `../video-production/SKILL.md`
- Canonical reference: `../video-production/references/video-direction.md`
- Agent Skills specification: `https://agentskills.io/specification`
