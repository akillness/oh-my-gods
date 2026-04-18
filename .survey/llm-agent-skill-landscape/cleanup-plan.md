# Cleanup Plan: standardize marketing-automation before any mutation loop

## Goal

Keep the recurring loop aligned with the current skill-packaging signal by
running one bounded `marketing-automation` standards lane, converting it from a
broad catalog dump into a clear routing skill, adding only the support files
that materially improve reuse, and opening the PR path once validation is
clean.

## Behavior lock

- Keep this run focused on `marketing-automation` and the matching survey lock.
- Do not widen this run to `pm-skills`, `agent-evaluation`, or any already
  merged lane unless a shared blocker appears.
- Keep the support package minimal and explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, because the lane-selection and measurement rules should
    move out of the main entrypoint
  - `evals`: yes, because this router needs trigger and boundary checks before
    any future mutation loop
- Update compact/discovery surfaces only where the lane meaning changes
  materially (`SKILL.toon` and survey lock files).
- Do not start a `skill-autoresearch` mutation loop in this run unless the
  standards pass plus new eval surface still leaves measured failures.

## Planned edits

1. Refresh the survey lock against the live ecosystem and merged PR state after
   `langextract` closed via PR `#51`.
2. Rewrite `marketing-automation` into a standards-clean routing skill with
   explicit route-ins, route-outs, one-primary-lane guidance, and measurement
   handoff requirements.
3. Add the missing `references/` package for routing heuristics and measurement
   rules.
4. Add `evals/evals.json` and refresh `SKILL.toon` so discovery and future
   optimization work use the new boundary.
5. Open the next bounded PR path if validation is clean.

## Verification

- Validate `marketing-automation` with the repo validator and confirm it stays
  standards-compliant.
- Re-run repo-wide validation and confirm no new errors are introduced.
- Check `git diff --stat` and `git status --short --branch` for bounded scope.
- Open a PR only after the branch is committed and the bounded scope is
  reviewable.
