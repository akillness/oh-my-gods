# Cleanup Plan: standardize survey before any mutation loop

## Goal

Keep the recurring loop aligned with the current skill-packaging signal by
running one bounded `survey` standards lane, refreshing it against the current
skill-hosting landscape, adding the missing evidence-recovery support file, and
opening the PR path once validation is clean.

## Behavior lock

- Keep this run focused on `survey` and the matching survey lock.
- Do not widen this run to `pm-skills`, `ai-research-skills`, or any already
  merged lane unless a shared blocker appears.
- Keep the support package minimal and explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, because the evidence-recovery ladder should live outside
    the main entrypoint
  - `evals`: existing evals should be refreshed to check evidence labeling and
    thin-evidence handling
- Update compact/discovery surfaces only where the lane meaning changes
  materially (`SKILL.toon` and survey lock files).
- Do not start a `skill-autoresearch` mutation loop in this run unless the new
  standards package still leaves measured failures after review.

## Planned edits

1. Refresh the survey lock against the live ecosystem and merged PR state after
   `agent-evaluation` closed via PR `#53`.
2. Upgrade `.god-skills/survey/SKILL.md` to the newer evidence-aware survey
   contract without widening it into implementation guidance.
3. Add the missing `references/` package for the evidence-recovery ladder.
4. Refresh `evals/evals.json` and `SKILL.toon` so discovery and future
   optimization work use the new evidence rules.
5. Open the next bounded PR path if validation is clean.

## Verification

- Validate `survey` with the repo validator and confirm it stays
  standards-compliant.
- Re-run repo-wide validation and confirm no new errors are introduced.
- Check `git diff --stat` and `git status --short --branch` for bounded scope.
- Open a PR only after the branch is committed and the bounded scope is
  reviewable.
