# Cleanup Plan: `monitoring-observability` packaging lane

## Goal

Advance the recurring improvement loop after PR `#68` merged by packaging
`monitoring-observability` as the next bounded skill. Keep the work focused on
trigger and boundary repair, concise references, and eval coverage. Defer
`skill-autoresearch` until the packaged lane still shows measured failures
after review.

## Why this lane is next

- PR `#68` merged, so reopening `performance-optimization` would duplicate
  already-closed work.
- External survey signal still favors portable, standards-clean skill
  directories with progressive disclosure over oversized inline entrypoints.
- `monitoring-observability` is now the strongest remaining repo-local
  contradiction because it still ships as a large generic recipe dump with no
  `references/` or `evals/`.

## Behavior lock

- Keep this run focused on `monitoring-observability` only.
- Do not reopen already-merged unrelated lanes.
- Keep the support package decision explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, add focused signal-design and handoff guidance
  - `evals`: yes, add trigger and route-out checks
- Keep `skill-autoresearch` deferred until a packaged, review-clean target
  still shows measured failures.

## Planned checks

1. Replace the oversized inline recipe content with a compact routing-first
   entrypoint.
2. Add only the references and evals needed to make the skill measurable.
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
