# Cleanup Plan: run 37 PR-open gate (`authentication-setup`)

## Goal

Open and record the bounded `authentication-setup` packaging slice, then leave
the next run to handle the post-open review before merge.

## Behavior lock

- Do not add runtime scripts or assets unless the next review finds a concrete
  missing support surface.
- Keep the auth lane limited to `.god-skills/authentication-setup/*` plus the
  recurring survey lock files.
- Do not reopen `backend-testing`, `ralph`, `plannotator`, `omg`, `vibe-kanban`,
  or older merged lanes.
- Do not start a `skill-autoresearch` mutation loop for `authentication-setup`
  in this run; first keep the packaged and eval-backed baseline reviewable in
  PR `#28`.

## Planned edits

1. Refresh the landscape lock from current official docs and live GitHub state.
2. Repackage `authentication-setup` into a compact entrypoint with local
   references and eval coverage.
3. Re-run the target validator and repo-wide validator.
4. Push `chore/skill-loop-pr-open-20260415-r29` and register PR `#28`.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/authentication-setup`
- Validate `.god-skills/authentication-setup/evals/evals.json` as parseable JSON
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm PR `#28` exists and the branch diff stays bounded to the auth skill
  plus the survey lock files
