# Cleanup Plan: standardize langextract before any mutation loop

## Goal

Keep the recurring loop aligned with the current skill-packaging signal by
running one bounded `langextract` standards lane, adding only the missing
support files that materially improve reuse, and opening the next PR path once
validation is clean.

## Behavior lock

- Keep this run focused on `langextract` and the matching survey lock.
- Do not widen this run to `marketing-automation` or any already-merged lane
  unless a shared blocker appears.
- Keep the support package minimal and explicit:
  - `assets`: no
  - `scripts`: keep the existing helper, but only if it gains one bounded
    improvement that follows upstream behavior
  - `references`: add the missing package because `langextract` is still one of
    the remaining 2-warning skills and currently lacks progressive-disclosure
    support
  - `evals`: keep the existing package, but refresh only where upstream
    provider and grounding guidance changed materially
- Update compact/discovery surfaces only where the lane meaning changes
  materially (`SKILL.toon` and survey lock files).
- Do not start a `skill-autoresearch` mutation loop in this run unless the
  standards pass plus refreshed eval surface still leaves measured failures.

## Planned edits

1. Refresh the survey lock against live repo and GitHub state after PR `#50`
   merged.
2. Rewrite `langextract` into a standards-clean entrypoint with explicit
   route-ins, route-outs, and compact top-level instructions.
3. Add the missing `references/` package for upstream grounding, provider, and
   long-document guidance.
4. Refresh `evals/evals.json`, `SKILL.toon`, and the existing helper script
   only where the boundary or upstream usage changed materially.
5. Open the next bounded PR path if validation is clean.

## Verification

- Validate `langextract` with the repo validator and remove its remaining
  missing-section warning pattern.
- Re-run repo-wide validation and confirm no new errors are introduced.
- Check `git diff --stat` and `git status --short --branch` for bounded scope.
- Open a PR only after the branch is committed and the bounded scope is
  reviewable.
