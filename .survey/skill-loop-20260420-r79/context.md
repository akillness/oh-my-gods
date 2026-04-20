# Context

## Workflow Context

- The previous run already packaged `pattern-detection` with a rewritten
  trigger surface, local references, and eval scaffolding.
- The active question on this run is not which lane to choose next, but whether
  the open PR still has duplicate work, missing route-outs, or spec gaps that
  justify another bounded patch.

## Affected Users

- Repo maintainers who need the recurring loop to avoid reopening already-clean
  PRs
- Agent hosts that rely on `SKILL.md`, `SKILL.toon`, references, and evals to
  route prompts consistently

## Current Workarounds

- Re-run repo validation and per-skill validation
- Diff the PR against `origin/main`
- Compare the active skill boundary against neighboring skills with similar
  trigger surfaces

## Adjacent Problems

- Reusable instructions inside `skill-standardization` mention a catalog-sync
  helper path that this repo does not ship, but that is a separate repo-level
  tooling issue rather than a blocker on `pattern-detection`
- Remote merge metadata from GitHub CLI can be thin (`mergeStateStatus:
  UNKNOWN`) even when the PR is mergeable, so the branch still needs a direct
  merge attempt

## User Voices

- The recurring loop contract says the run after PR registration must review
  the branch again for duplicate work, missing improvements, or
  standardization gaps, then proceed to merge if clean
