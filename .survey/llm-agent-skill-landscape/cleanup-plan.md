# Cleanup Plan: `log-analysis` packaging lane

## Goal

Advance the recurring improvement loop after PR `#69` merged by packaging
`log-analysis` as the next bounded skill. Keep the work focused on trigger and
boundary repair, concise references, eval coverage, and a compact companion
`SKILL.toon`. Defer `skill-autoresearch` until the packaged lane still shows
measured failures after review.

## Why this lane is next

- PR `#69` merged, so reopening `monitoring-observability` would duplicate
  already-closed work.
- External survey signal still favors portable, standards-clean skill
  directories with progressive disclosure over oversized inline entrypoints.
- `log-analysis` is now the strongest remaining repo-local contradiction
  because it still ships as a generic recipe sheet with weak route-outs and no
  `references/`, `evals/`, or compact companion surface.

## Behavior lock

- Keep this run focused on `log-analysis` only.
- Do not reopen already-merged unrelated lanes.
- Keep the support package decision explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, add focused triage and handoff guidance
  - `evals`: yes, add trigger and route-out checks
- Keep `skill-autoresearch` deferred until a packaged, review-clean target
  still shows measured failures.

## Planned checks

1. Replace the generic inline recipe content with a compact routing-first
   entrypoint.
2. Add only the references, evals, and `SKILL.toon` surface needed to make the
   skill measurable.
3. Re-run repo validation with the repo-local validator.
4. Open the next PR path as soon as the branch is validator-clean.
5. Hand the following scheduled run to PR review once the lane is open.

## Verification

- `python3 validate_frontmatter.py`
- `git diff --stat main...HEAD`
- `gh pr list --state open`

## Intended stage transition

- This run should move from `survey`/`improvement` into `pr-open` if validation
  stays clean and PR registration succeeds.
- The next run should review the PR branch for duplicate work or
  standardization gaps, then merge if clean.
