# Cleanup Plan

## Target

- `task-planning`

## Why this lane

- It is the only active recurring PR lane and must be cleared before a new
  survey target is chosen.
- The first packaging pass already added route-outs, references, evals, and a
  synced `SKILL.toon`, so this run is a review gate rather than a rewrite.

## Behavior to preserve

- The skill must keep owning backlog grooming, feature breakdown, sprint
  candidate shaping, and milestone planning packets.
- It must remain distinct from sizing, standup, and retrospective workflows.

## Bounded edits

1. Update the recurring survey lock and direction from `pr-open` to `merge` if
   branch review stays clean.
2. Record this run's survey artifacts under `.survey/skill-loop-20260420-r81/`.

## Explicit non-goals

- No further `task-planning` content rewrite unless review exposes a concrete
  gap
- No new dependencies
- No scripts
- No assets
- No `skill-autoresearch` loop without a measured residual failure
