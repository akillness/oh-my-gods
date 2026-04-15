# Cleanup Plan: run 49 review and merge lane (`state-management`)

## Goal

Review the active `state-management` PR now that the packaging pass is already
registered, keep the branch limited to survey-lock updates unless review finds
a bounded defect, and merge PR `#34` if the lane remains clean.

## Behavior lock

- Keep this run limited to the survey lock files under
  `.survey/llm-agent-skill-landscape/*` unless PR review reveals a bounded
  defect inside `.god-skills/state-management/*`.
- Do not reopen the merged `deployment-automation`, `technical-writing`,
  `prompt-repetition`, `genkit`, or `database-schema-design` lanes.
- Do not start a `skill-autoresearch` mutation loop in this run; first close
  the active PR-review lane and reopen the queue on the next packaging target.
- Do not add scripts or assets unless the packaging work proves a deterministic
  helper or bundled data file is truly reusable.

## Review decisions

- `state-management`
  - Assets: no
  - Scripts: no further additions in this pass
  - References: already added and sufficient
  - Evals: already added and sufficient
- `skill-autoresearch`
  - Keep as a triage-only surface in this run
  - Revisit only after the packaged skill has a stable merged outcome

## Planned edits

1. Refresh the survey lock so the repo treats `state-management` as the active
   review-to-merge lane instead of an improvement lane.
2. Re-run target validation and repo-wide validation to confirm no new
   standardization regressions appeared after PR registration.
3. Confirm the branch diff still stays bounded to the packaged
   `state-management` surface plus survey lock files.
4. Merge PR `#34` if the review pass stays clean and the branch remains
   scoped.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/state-management`
- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to the state-management skill package plus
  survey lock files
- Confirm PR `#34` remains clean and has no reported checks blocking merge
- Record current state, blocker, next owner, and stage for the next scheduled
  post-merge run
