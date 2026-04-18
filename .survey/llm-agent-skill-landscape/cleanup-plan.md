# Cleanup Plan: standardize `clawteam` after the `langchain-bmad` merge

## Goal

Advance one bounded standards lane on `clawteam` now that `langchain-bmad` is
merged. Keep the work limited to the missing recommended sections and the
survey-state rollover needed for the recurring loop.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/clawteam/*`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, `bmad`, `bmad-idea`, or
  `langchain-bmad` lanes unless measured failures appear.
- Do not widen this run into `presentation-builder`; it remains queued behind
  `clawteam`.
- Do not add assets, new scripts, references, or evals unless fresh evidence
  proves the existing support surface is insufficient.
- Do not start a `skill-autoresearch` mutation loop for `clawteam`; this pass
  is for standards cleanup first, not optimization.

## Planned edits

1. Reuse the saved survey evidence and refresh the durable lock from the closed
   `langchain-bmad` merge lane to the new `clawteam` lane.
2. Re-run focused standards validation on `.god-skills/clawteam/`.
3. Convert the missing recommended sections in `clawteam` to the standard
   `Instructions`, `Examples`, and `Best practices` shape without changing the
   substantive workflow.
4. Re-run the repo-wide validator and confirm the total warning count drops by
   the expected `3` without introducing new regressions.
5. Keep the branch explicitly on the next bounded lane so the following run can
   review draft PR `#47` cleanly instead of reopening survey work.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/clawteam`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Review `git diff --name-only origin/main...HEAD`
- Check `gh pr view 47 --json state,isDraft,mergeStateStatus,mergeable,url`
- Keep the repo in explicit `pr-open` state for the next owner
