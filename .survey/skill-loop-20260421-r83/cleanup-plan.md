# Cleanup Plan

## Target

- `task-estimation`

## Why this lane

- It is the only active recurring PR lane and must be cleared before a new
  survey target is chosen.
- The first packaging pass already added route-outs, references, evals, and a
  synced `SKILL.toon`, so this run is a review gate rather than a rewrite.

## Behavior to preserve

- The skill must keep owning sizing, uncertainty framing, split signals, and
  estimate-packet output.
- It must remain distinct from backlog decomposition, standup cadence, and
  retrospective workflows.

## Bounded edits

1. Update the recurring survey lock and direction from `pr-open` to `merge` if
   branch review stays clean.
2. Record this run's survey artifacts under `.survey/skill-loop-20260421-r83/`.

## Explicit non-goals

- No further `task-estimation` content rewrite unless review exposes a concrete
  gap
- No new dependencies
- No scripts
- No assets
- No `skill-autoresearch` loop without a measured residual failure
