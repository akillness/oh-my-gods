# Cleanup Plan: run 38 PR-review gate (`authentication-setup`)

## Goal

Re-review the bounded `authentication-setup` packaging slice, close any small
standards or support-surface gap inside the same lane, and merge if the branch
stays clean.

## Behavior lock

- Do not add runtime scripts or assets unless this review finds a concrete
  missing support surface.
- Keep the auth lane limited to `.god-skills/authentication-setup/*` plus the
  recurring survey lock files.
- Do not reopen `backend-testing`, `ralph`, `plannotator`, `omg`, `vibe-kanban`,
  or older merged lanes.
- Do not start a `skill-autoresearch` mutation loop for `authentication-setup`
  in this run; keep the packaged and eval-backed baseline reviewable and merge
  it before opening the next packaging lane.

## Planned edits

1. Refresh live GitHub state and re-run the validators before changing stage.
2. Fix only review-discovered gaps inside `.god-skills/authentication-setup/*`.
3. Re-run the target validator and repo-wide validator after the review patch.
4. Push `chore/skill-loop-pr-open-20260415-r29` and merge PR `#28` if it stays
   bounded and clean.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/authentication-setup`
- Validate `.god-skills/authentication-setup/evals/evals.json` as parseable JSON
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm PR `#28` stays bounded to the auth skill plus the survey lock files
- Confirm PR `#28` remains clean and mergeable after the review patch
