# Cleanup Plan: standardize playwriter before any mutation loop

## Goal

Keep the recurring loop aligned with the current skill-packaging signal by
running one bounded `playwriter` standards lane, refreshing it against the current
browser-agent landscape, adding the missing support package, and
opening the PR path once validation is clean.

## Behavior lock

- Keep this run focused on `playwriter` and the matching survey lock.
- Do not widen this run to `pm-skills`, `react-best-practices`, or any already
  merged lane unless a shared blocker appears.
- Keep the support package minimal and explicit:
  - `assets`: no
  - `scripts`: no
  - `references`: yes, because install, MCP, and recovery details should live
    outside the main entrypoint
  - `evals`: existing evals should be refreshed to check enabled-tab consent,
    recovery, and live-session guidance
- Update compact/discovery surfaces only where the lane meaning changes
  materially (`SKILL.toon` and survey lock files).
- Do not start a `skill-autoresearch` mutation loop in this run unless the new
  standards package still leaves measured failures after review.

## Planned edits

1. Refresh the survey lock against the live browser-agent landscape and the
   merged `survey` lane in PR `#54`.
2. Upgrade `.god-skills/playwriter/SKILL.md` to a more compact workflow entrypoint.
3. Add the missing `references/` package for install, MCP, security, and recovery.
4. Refresh `evals/evals.json` and `SKILL.toon` so discovery and future
   optimization work use the new support package.
5. Open the next bounded PR path if validation is clean.

## Verification

- Validate `playwriter` with the repo validator and confirm it stays
  standards-compliant.
- Re-run repo-wide validation and confirm no new errors are introduced.
- Check `git diff --stat` and `git status --short --branch` for bounded scope.
- Open a PR only after the branch is committed and the bounded scope is
  reviewable.
