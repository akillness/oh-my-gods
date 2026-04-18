---
name: vercel-react-best-practices
description: >
  Compatibility alias for `react-best-practices`. Use when an existing
  workflow, setup script, or user explicitly asks for
  `vercel-react-best-practices`; route general React and Next.js performance
  work to `react-best-practices` instead. Triggers on: legacy skill name,
  Vercel React best practices alias, exact-folder compatibility.
license: MIT
allowed-tools: Read Write Grep Glob
---

# Vercel React Best Practices

This skill is a compatibility alias for `react-best-practices`. Keep it thin.

## When to use this skill

- The user explicitly names `vercel-react-best-practices`
- An older prompt pack or setup surface still points at this folder name
- A migration-safe alias is needed without maintaining a second full rule pack

Do not use this alias as a separate methodology. For normal React or Next.js
performance work, use `react-best-practices`.

## Instructions

### Step 1: Confirm that this is alias-routing work

Use this skill only when the legacy name itself matters for discovery or
migration.

If the user simply wants React or Next.js performance help, treat
`react-best-practices` as the canonical surface.

### Step 2: Load the canonical skill

Read the canonical skill and its bundled detailed rule pack:

- `../react-best-practices/SKILL.md`
- `../react-best-practices/AGENTS.md`

Reuse the canonical guidance for:

- waterfall removal
- bundle-size optimization
- RSC or server/client boundary checks
- rerender and hydration diagnosis

### Step 3: Keep the alias thin

Do not maintain a second copy of the Vercel rule catalog here.

For this alias:

- `assets`: no
- `scripts`: no
- `references`: point back to the canonical skill
- `evals`: only enough to prove the alias stays a routing surface

### Step 4: Preserve route-outs

Keep neighboring boundaries aligned with the canonical skill:

- Route broader app or backend performance work to
  `../performance-optimization/SKILL.md`
- Route browser verification on a live page to `../playwriter/SKILL.md` or
  `../agent-browser/SKILL.md` depending on session needs

## Examples

### Example 1: Legacy prompt name

Input:

```text
Use vercel-react-best-practices to audit this Next.js route for waterfalls.
```

Expected behavior:

- keep the request on this alias for discovery
- load `react-best-practices` for the actual optimization guidance
- avoid maintaining a second, duplicated rule pack here

### Example 2: Migration question

Input:

```text
Our old automation still invokes vercel-react-best-practices. Should we keep it?
```

Expected behavior:

- explain that this folder is a compatibility alias
- point future work to `react-best-practices`
- keep the alias only for migration-safe discovery

## References

- Canonical skill: `../react-best-practices/SKILL.md`
- Detailed rule pack: `../react-best-practices/AGENTS.md`
- Agent Skills specification: `https://agentskills.io/specification`
