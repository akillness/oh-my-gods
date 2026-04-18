# Cleanup Plan: reset the loop after merging `clawteam`

## Goal

Close the merged `clawteam` lane cleanly and reset the recurring loop to the
next survey target, `presentation-builder`. Keep this run limited to
survey-state rollover so the next hourly pass starts from the right target
instead of reopening the merged PR lane.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, `bmad`, `bmad-idea`, `langchain-bmad`,
  or `clawteam` lanes unless measured failures appear.
- Do not start `presentation-builder` edits in this post-merge checkpoint.
- Do not add assets, scripts, references, or evals in this run; only record
  what the next lane is expected to need.
- Do not start a `skill-autoresearch` mutation loop for `presentation-builder`
  before its standards gaps are measured and packaged.

## Planned edits

1. Record that PR `#47` merged cleanly and that `clawteam` is now closed.
2. Refresh the durable lock to the next highest-value bounded survey target:
   `presentation-builder`.
3. Carry forward the explicit packaging decision for `presentation-builder`
   without starting implementation in this run.
4. Keep the branch explicitly in `survey` state so the following run begins
   with standards triage rather than re-reviewing the merged PR.

## Verification

- Check `gh pr view 47 --json state,isDraft,mergedAt,mergeCommit,url`
- Re-run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
  and confirm the leaderboard moved to `presentation-builder`
- Keep the repo in explicit `survey` state for the next owner
