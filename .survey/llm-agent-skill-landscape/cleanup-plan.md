# Cleanup Plan: standardize agent-evaluation before any mutation loop

## Goal

Keep the recurring loop aligned with the current skill-packaging signal by
running one bounded `agent-evaluation` standards lane, converting it from a
large inline primer into a reviewable evaluation-planning skill with
progressive-disclosure support files, and opening the PR path once validation is
clean.

## Behavior lock

- Keep this run focused on `agent-evaluation` and the matching survey lock.
- Do not widen this run to `pm-skills`, `ai-research-skills`, or any already
  merged lane unless a shared blocker appears.
- Keep the support package minimal and explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, because grader-selection and eval-ops detail should move
    out of the main entrypoint
  - `evals`: yes, because this skill needs trigger and boundary checks before
    any future mutation loop
- Update compact/discovery surfaces only where the lane meaning changes
  materially (`SKILL.toon` and survey lock files).
- Do not start a `skill-autoresearch` mutation loop in this run unless the new
  standards package still leaves measured failures after review.

## Planned edits

1. Refresh the survey lock against the live ecosystem and merged PR state after
   `marketing-automation` closed via PR `#52`.
2. Rewrite `agent-evaluation` into a standards-clean evaluation-planning skill
   with explicit use-cases, route-outs, and structured output guidance.
3. Add the missing `references/` package for grader selection and eval
   operations.
4. Add `evals/evals.json` and refresh `SKILL.toon` so discovery and future
   optimization work use the new boundary.
5. Open the next bounded PR path if validation is clean.

## Verification

- Validate `agent-evaluation` with the repo validator and confirm it stays
  standards-compliant.
- Re-run repo-wide validation and confirm no new errors are introduced.
- Check `git diff --stat` and `git status --short --branch` for bounded scope.
- Open a PR only after the branch is committed and the bounded scope is
  reviewable.
