# Cleanup Plan: run 34 PR-open lane (`backend-testing`)

## Goal

Open the next bounded skill-improvement lane by packaging `backend-testing`
for review: refresh the survey lock after the `ralph` merge, split the giant
entrypoint into a compact main skill plus support references, add eval
coverage, and register the new PR path without reopening already-merged
skills.

## Behavior lock

- Do not change runtime scripts unless the skill entrypoint is currently
  pointing at the wrong script name or tool surface.
- Keep the follow-up diff limited to `.god-skills/backend-testing/*` plus the
  recurring survey state files; do not reopen `ralph`, `plannotator`, `ohmg`,
  `omg`, `vibe-kanban`, or older merged lanes.
- Do not start a `skill-autoresearch` mutation loop for `backend-testing` in
  this run. First land the standards-clean eval baseline and progressive-
  disclosure packaging.
- Do not add new assets or runtime scripts for `backend-testing` unless the
  compact entrypoint clearly cannot express the workflow without them.

## Planned edits

1. Refresh the survey lock from current official docs and GitHub state so the
   repo records the merged `ralph` lane and the next target choice.
2. Re-run the repo validator, then package `.god-skills/backend-testing/`
   with a compact entrypoint, support references, and `evals/evals.json`.
3. Re-run the `skill-standardization` validator for
   `.god-skills/backend-testing/` and confirm the diff stays bounded to
   `backend-testing` plus the survey lock files.
4. Open the next PR once the bounded lane is verified and clean.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/backend-testing/`.
- Validate `backend-testing/evals/evals.json` as parseable JSON.
- Confirm the branch diff stays bounded to `.god-skills/backend-testing/*`
  plus the survey lock files before opening the PR.
- Confirm the new PR targets `main` and that no open PR already exists for the
  same lane.
