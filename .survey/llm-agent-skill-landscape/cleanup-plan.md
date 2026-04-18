# Cleanup Plan: standardize the duplicate video lane and open the next PR path

## Goal

Keep the recurring loop aligned with the latest skill-packaging signal, close
the duplicate peer relationship between `video-production` and
`remotion-video-production`, add only the support files this lane needs, and
open the next bounded PR path once validation is clean.

## Behavior lock

- Keep this run focused on the `video-production` canonical surface, the
  `remotion-video-production` alias surface, and the matching survey lock.
- Do not widen this run to `langextract`, `marketing-automation`, or any
  already-merged lane unless a shared blocker appears.
- Keep the support package minimal:
  - `video-production`: add `references/` and `evals/`
  - `remotion-video-production`: keep thin; no separate support package unless
    the audit proves distinct behavior
- Update the compact/discovery surface only where the lane meaning changes
  materially (`SKILL.toon`, README catalog text).
- Do not start a `skill-autoresearch` mutation loop in this run unless the
  standards pass plus new eval surface still leaves measured failures.

## Planned edits

1. Refresh the survey lock against current landscape and repo state.
2. Rewrite `video-production` as the canonical programmable-video surface with
   explicit route-ins and route-outs.
3. Collapse `remotion-video-production` into a compatibility alias that points
   to `video-production`.
4. Add only the missing `references/` and `evals/` support files for
   `video-production`.
5. Sync the compact/discovery surfaces and open the PR path if validation is
   clean.

## Verification

- Validate `video-production` and `remotion-video-production` with the repo
  validator and remove the current warning pattern for imperative description
  and missing references.
- Re-run repo-wide validation and confirm no new errors are introduced.
- Check `git diff --stat` and `git status --short --branch` for bounded scope.
- Open a PR only after the branch is committed and the bounded scope is
  reviewable.
