# Cleanup Plan

## Target

- `task-estimation`

## Why this lane

- `task-planning` is now merged on `main`, so the recurring loop needs one new
  bounded lane instead of another stale merge-only run.
- `task-estimation` remains a generic single-file PM skill with no local
  `references/` or `evals/`, despite sitting on a crowded boundary with
  `task-planning`, `standup-meeting`, and `sprint-retrospective`.

## Behavior to preserve

- The skill must keep owning sizing, estimate framing, and uncertainty-aware
  planning support.
- It must remain distinct from backlog decomposition, daily sync rituals, and
  retrospectives.
- It must keep estimates as planning signals rather than promises or deadlines.

## Bounded edits

1. Rewrite `task-estimation/SKILL.md` into a routing-aware estimation workflow
   with sharper route-outs and a reusable estimate packet output.
2. Add only the support files justified by the gap:
   `references/` and `evals/`.
3. Refresh `task-estimation/SKILL.toon`.
4. Update recurring survey lock artifacts for the new `task-estimation`
   PR-open lane.

## Explicit non-goals

- No new dependencies
- No scripts
- No assets
- No `skill-autoresearch` loop without a measured residual failure after this
  packaging pass
