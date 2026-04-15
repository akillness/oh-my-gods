# Cleanup Plan: run 51 PR-review lane (`codebase-search`)

## Goal

Review the active `codebase-search` PR now that the packaging pass is already
registered, keep the branch limited to survey-lock updates unless review finds
a bounded defect inside `.god-skills/codebase-search/*`, and merge PR `#35` if
the lane remains clean.

## Behavior lock

- Keep the next run limited to `.survey/llm-agent-skill-landscape/*` unless
  PR review reveals a bounded defect inside `.god-skills/codebase-search/*`.
- Do not reopen the merged `state-management`, `deployment-automation`,
  `technical-writing`, `prompt-repetition`, `genkit`, or
  `database-schema-design` lanes.
- Do not widen scope into `ui-component-patterns`, `git-workflow`, or another
  large skill while PR `#35` is still open.
- Do not add scripts or assets unless the packaging work proves a reusable
  deterministic helper or bundled data file is necessary.

## Packaging decisions

- `codebase-search`
  - Assets: no
  - Scripts: no further additions in this pass
  - References: already added and sufficient
  - Evals: already added and sufficient
- `skill-autoresearch`
  - Keep at triage only in the next run
  - Revisit only after the packaged skill has a stable merged outcome

## Planned edits

1. Refresh the survey lock so the repo treats `codebase-search` as the active
   PR-review lane instead of an improvement lane.
2. Re-run target validation and repo-wide validation to confirm no new
   standardization regressions appeared after PR registration.
3. Confirm the diff stays bounded to the packaged `codebase-search` surface
   plus survey lock files.
4. Merge PR `#35` if the review pass stays clean and the branch remains
   scoped.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/codebase-search`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to the `codebase-search` skill package plus
  survey lock files
- Confirm PR `#35` remains clean and has no reported checks blocking merge
- Record current state, blocker, next owner, and stage for the next scheduled
  review run
