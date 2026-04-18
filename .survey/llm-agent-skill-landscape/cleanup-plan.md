# Cleanup Plan: review `langchain-bmad` and advance it to merge

## Goal

Review the bounded `langchain-bmad` PR lane for duplicate work, missing
standardization fixes, or support-surface gaps. If the lane stays clean, apply
only lifecycle-state updates and move the branch onto the merge path.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/langchain-bmad/*`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, `bmad`, or `bmad-idea` lanes unless
  measured failures appear.
- Do not widen this run into `clawteam` or `presentation-builder`; they are
  next-lane decisions, not this branch's work.
- Do not add scripts or assets unless review evidence proves a reusable
  deterministic helper or bundled template is required.
- Do not start a `skill-autoresearch` mutation loop for `langchain-bmad`; this
  review pass only validates the packaging slice and advances its lifecycle
  state.

## Planned edits

1. Reuse the saved survey evidence and re-run focused standards validation on
   `.god-skills/langchain-bmad/`.
2. Re-run the repo-wide validator and confirm the branch warning total stays at
   `26` without introducing new regressions.
3. Review the diff against `main` and the live PR metadata to confirm the slice
   remains bounded to `langchain-bmad` plus recurring survey state.
4. If the review remains clean, update the durable lock files from `pr-open` to
   `merge` and queue the next survey target instead of reopening the same lane.

## Verification

- Run `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/langchain-bmad`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Check `gh pr view 46 --json state,isDraft,mergeStateStatus,mergeable,url`
- Review `git diff --name-only origin/main...HEAD`
- Keep the repo in explicit `merge` state for the next owner
