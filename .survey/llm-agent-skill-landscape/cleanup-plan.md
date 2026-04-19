# Cleanup Plan: `performance-optimization` packaging lane

## Goal

Advance the recurring improvement loop after PR `#67` merged the `debugging`
lane by packaging `performance-optimization` as the next bounded skill. Keep
the work focused on trigger and boundary repair, concise references, and eval
coverage. Defer `skill-autoresearch` until the packaged lane still shows
measured failures after review.

## Why this lane is next

- The shared lock was stale and still treated PR `#67` as open even though
  `main` already contains `749b1eb ... (#67)`.
- External survey signal says observability remains a strong follow-on area,
  but the repo-local contradiction is sharper in `performance-optimization`:
  the current skill still contains React-heavy recipe content while
  `react-best-practices` already claims the React/Next performance lane.
- This makes `performance-optimization` the best next bounded repair because it
  can become the measurement-led cross-stack tuning surface while routing
  stack-specific work outward.

## Behavior lock

- Keep this run focused on `performance-optimization` only.
- Do not reopen already-merged unrelated lanes.
- Keep the support package decision explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, add focused tuning modes, handoff boundaries, and
    measurement guidance
  - `evals`: yes, add trigger, route-out, and evidence-first assertions
- Keep `monitoring-observability` as the next survey candidate, not a parallel
  packaging lane in the same PR.
- Do not start a `skill-autoresearch` mutation loop until the packaged lane
  still shows measured failures.

## Planned checks

1. Re-read `performance-optimization` for catch-all or framework-specific
   wording that conflicts with sibling skills.
2. Copy in only the references and evals needed to make the skill measurable
   and boundary-clean.
3. Re-run repo validation with the repo-local validator.
4. Open the next PR path as soon as the branch is validator-clean.
5. Hand the following scheduled run to PR review once the lane is open.

## Verification

- `python3 validate_frontmatter.py`
- `git diff --stat origin/main...HEAD`
- `gh pr list --state open`

## Intended stage transition

- This run completed the `performance-optimization` packaging lane.
- The package validated cleanly and PR `#68` is now open:
  https://github.com/akillness/oh-my-gods/pull/68
- The next run should stay in `pr-open`, review the branch for duplicate work
  or standardization gaps, and merge if clean.
