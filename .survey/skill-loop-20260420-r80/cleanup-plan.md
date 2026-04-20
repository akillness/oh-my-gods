# Cleanup Plan

## Target

- `task-planning`

## Why this lane

- It is still a generic single-file planning template with no local references
  or evals.
- It overlaps a crowded planning/process cluster and needs sharper route-outs
  more than a broader rewrite.

## Behavior to preserve

- The skill still owns backlog grooming, feature breakdown, and sprint/milestone
  task decomposition.
- It must remain a planning workflow rather than a sizing, standup, or
  retrospective workflow.

## Bounded edits

1. Tighten `SKILL.md` description and instructions around planning packets,
   readiness, blockers, and domain-tailored decomposition.
2. Add `references/planning-patterns.md` and
   `references/readiness-checklist.md`.
3. Add `evals/evals.json` with realistic planning prompts.
4. Refresh `SKILL.toon` to match the new trigger surface.

## Explicit non-goals

- No new dependencies
- No scripts
- No assets
- No repo-wide catalog rename or manifest surgery
- No `skill-autoresearch` loop unless validation exposes a measured failure
