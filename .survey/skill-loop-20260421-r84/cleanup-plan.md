# Cleanup Plan

## Target

- `standup-meeting`

## Why this lane

- `task-estimation` is merged on `main`, so the recurring loop needs one new
  bounded lane instead of another stale merge-only run.
- `standup-meeting` remains a generic single-file PM skill with stale template
  metadata and no local `references/` or `evals/`, despite sitting on a
  crowded boundary with `task-planning`, `task-estimation`, and
  `sprint-retrospective`.

## Behavior to preserve

- The skill must keep owning daily coordination, blocker triage, and
  short-form team syncs.
- It must remain distinct from backlog decomposition, sizing, and retrospective
  facilitation.
- It must keep problem-solving outside the main standup ritual unless blocker
  triage is explicitly requested.

## Bounded edits

1. Rewrite `standup-meeting/SKILL.md` into a routing-aware coordination
   workflow with sharper route-outs and a reusable standup packet output.
2. Add only the support files justified by the gap: `references/` and
   `evals/`.
3. Refresh `standup-meeting/SKILL.toon`.
4. Update recurring survey lock artifacts for the new `standup-meeting`
   PR-open lane.

## Explicit non-goals

- No new dependencies
- No scripts
- No assets
- No `skill-autoresearch` loop without a measured residual failure after this
  packaging pass
