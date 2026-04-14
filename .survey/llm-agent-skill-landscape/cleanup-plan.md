# Cleanup Plan: run 36 merge gate (`backend-testing`)

## Goal

Finish the bounded `backend-testing` packaging slice by re-reviewing PR `#27`,
confirming no duplicate work or standards gaps remain, then merge it and leave
the next packaging lane to the large non-eval backlog.

## Behavior lock

- Do not change runtime scripts unless the skill entrypoint is currently
  pointing at the wrong script name or tool surface.
- Keep the follow-up diff limited to recurring survey state files; do not
  reopen `backend-testing`, `ralph`, `plannotator`, `ohmg`, `omg`,
  `vibe-kanban`, or older merged lanes.
- Do not start a `skill-autoresearch` mutation loop for `backend-testing` in
  this run; first land the standards-clean packaging and eval baseline by
  merging PR `#27`.
- Do not add new assets or runtime scripts for `backend-testing` unless the
  review finds a concrete missing support surface.

## Planned edits

1. Refresh the survey lock from current official docs and GitHub state so the
   repo records the post-open review outcome instead of the older `PR-open`
   checkpoint.
2. Re-run the repo validator and the `skill-standardization` validator for
   `.god-skills/backend-testing/`.
3. Confirm PR `#27` still has no review objections and the branch stays bounded
   to `backend-testing` plus the survey lock files.
4. Merge PR `#27` if the review remains clean.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/backend-testing/`.
- Validate `backend-testing/evals/evals.json` as parseable JSON.
- Confirm the branch diff stays bounded to `.god-skills/backend-testing/*`
  plus the survey lock files before merging the PR.
- Confirm PR `#27` is still mergeable and has no review objections.
