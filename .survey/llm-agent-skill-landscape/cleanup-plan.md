# Cleanup Plan: standardize the React guidance lane before any mutation loop

## Goal

Keep the recurring loop aligned with the current skill-packaging signal by
running one bounded React-guidance standards lane, closing the duplicate
`react-best-practices` / `vercel-react-best-practices` split into a canonical
skill plus a thin compatibility alias, and opening the PR path once validation
is clean.

## Behavior lock

- Keep this run focused on `react-best-practices` and
  `vercel-react-best-practices`.
- Do not widen this run to `playwriter` or any already merged lane unless a
  shared blocker appears.
- Keep the support package minimal and explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: no new support files; the canonical skill should continue to
    route detailed rule content to the bundled `AGENTS.md`
  - `evals`: yes, because the canonical/alias split needs trigger-quality
    checks on both sides
- Update compact/discovery surfaces where the lane meaning changes materially:
  `SKILL.toon`, `evals/`, and survey lock files.
- Do not start a `skill-autoresearch` mutation loop in this run unless the new
  canonical/alias split still leaves measured failures after review.

## Planned edits

1. Refresh the survey lock after PR `#55` merged and advance the next target to
   the React guidance duplicate.
2. Keep `.god-skills/react-best-practices/SKILL.md` as the canonical React and
   Next.js performance surface with tighter trigger ownership.
3. Convert `.god-skills/vercel-react-best-practices/SKILL.md` into a thin
   compatibility alias that routes normal work to the canonical skill.
4. Add eval coverage and refresh `SKILL.toon` so discovery and future
   optimization work use the canonical/alias split.
5. Open the next bounded PR path if validation is clean.

## Verification

- Validate both React guidance skills with the repo validator and confirm they
  stay standards-compliant.
- Re-run repo-wide validation and confirm no new errors are introduced.
- Check `git diff --stat` and `git status --short --branch` for bounded scope.
- Open a PR only after the branch is committed and the bounded scope is
  reviewable.
