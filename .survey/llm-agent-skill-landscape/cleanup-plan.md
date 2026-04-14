# Cleanup Plan: run 33 PR-open lane (`ralph`)

## Goal

Open the next bounded skill-improvement lane by packaging `ralph` for review:
refresh the survey lock after the `plannotator` merge, add only the missing
standardization and eval coverage for `ralph`, and register the new PR path
without reopening already-merged skills.

## Behavior lock

- Do not change runtime scripts unless the skill entrypoint is currently
  pointing at the wrong script name or tool surface.
- Keep the follow-up diff limited to `.god-skills/ralph/*` plus the recurring
  survey state files; do not reopen `plannotator`, `ohmg`, `omg`,
  `vibe-kanban`, or older merged lanes.
- Do not start a `skill-autoresearch` mutation loop for `ralph` in this run.
  First land the standards-clean eval baseline and section cleanup.
- Do not add new assets, runtime scripts, or reference files for `ralph`
  unless the existing bundled references prove insufficient during validation.

## Planned edits

1. Refresh the survey lock from current official docs and GitHub state so the
   repo records the merged `plannotator` lane and the next target choice.
2. Re-run the repo validator, then package `.god-skills/ralph/` with only the
   missing standard sections and `evals/evals.json`.
3. Re-run the `skill-standardization` validator for `.god-skills/ralph/` and
   confirm the diff stays bounded to `ralph` plus the survey lock files.
4. Open the next PR once the bounded lane is verified and clean.

## Verification

- Run the repo validator and the `skill-standardization` validator on
  `.god-skills/ralph/`.
- Validate `ralph/evals/evals.json` as parseable JSON.
- Confirm the branch diff stays bounded to `.god-skills/ralph/*` plus the
  survey lock files before opening the PR.
- Confirm the new PR targets `main` and that no open PR already exists for the
  same lane.
