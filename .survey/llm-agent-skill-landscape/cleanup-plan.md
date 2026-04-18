# Cleanup Plan: open the `design-system` PR path and freeze the review handoff

## Goal

Open the bounded standards lane on the canonical `design-system` skill plus
the `frontend-design-system` compatibility alias, then freeze the recurring
loop into PR review state.

## Behavior lock

- Keep this run focused on:
  - `.god-skills/design-system/*`
  - `.god-skills/frontend-design-system/SKILL.md`
  - `.survey/llm-agent-skill-landscape/*`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, `bmad`, `bmad-idea`, `langchain-bmad`,
  `clawteam`, or `presentation-builder` lanes unless measured failures appear.
- Keep the next implementation lane bounded to `design-system` plus
  `frontend-design-system`; do not widen it to `langextract`,
  `marketing-automation`, `remotion-video-production`, or
  `video-production` unless a shared blocker appears.
- Do not start a `skill-autoresearch` mutation loop for the next lane before
  the standards pass lands, the PR review is clean, and measured failures
  still remain afterward.

## Planned edits

1. Standardize `design-system` with imperative trigger copy plus packaged
   references and evals.
2. Thin `frontend-design-system` into a compatibility alias that points back
   to the canonical skill.
3. Re-run focused and repo-wide validation.
4. Open the PR path for the lane.
5. Update the durable survey lock so the next run reviews the live PR instead
   of repeating local standards work.

## Verification

- Re-run `bash .god-skills/skill-standardization/scripts/validate_skill.sh
  .god-skills/design-system`
- Re-run `bash .god-skills/skill-standardization/scripts/validate_skill.sh
  .god-skills/frontend-design-system`
- Re-run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
  and confirm the repo drops from `0` errors / `20` warnings to `0` errors /
  `16` warnings
- Open the live PR for the lane and record its URL/state
- Check `git diff --stat` and `git status --short --branch` for bounded scope
- Keep the resulting PR lane bounded to `design-system` plus the alias without
  widening into another warning leader
