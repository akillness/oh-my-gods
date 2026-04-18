# Cleanup Plan: open the next bounded standards lane on `design-system`

## Goal

Keep `presentation-builder` closed after merge and prepare the next bounded
standards lane on the canonical `design-system` skill plus the
`frontend-design-system` compatibility alias.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, `bmad`, `bmad-idea`, `langchain-bmad`,
  `clawteam`, or `presentation-builder` lanes unless measured failures appear.
- Keep the next implementation lane bounded to `design-system` plus
  `frontend-design-system`; do not widen it to `langextract`,
  `marketing-automation`, `remotion-video-production`, or
  `video-production` unless a shared blocker appears.
- Do not start a `skill-autoresearch` mutation loop for the next lane before a
  standards pass adds the missing packaging surface and measured failures still
  remain afterward.

## Planned edits

1. Keep the durable survey lock aligned with merged PR `#48`.
2. Re-run focused and repo-wide validation to confirm the warning cluster is
   unchanged after merge.
3. Freeze the next queue target to `design-system` plus
   `frontend-design-system`.
4. Carry explicit packaging decisions forward so the next run can open a
   bounded PR path instead of re-surveying the same cluster.

## Verification

- Re-run `bash .god-skills/skill-standardization/scripts/validate_skill.sh
  .god-skills/presentation-builder`
- Re-run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
  and confirm the repo remains at `0` errors / `20` warnings
- Recheck `gh pr view 48 --json state,mergedAt,mergeStateStatus`
- Re-run focused validation for `design-system`, `frontend-design-system`,
  `langextract`, `marketing-automation`, `remotion-video-production`, and
  `video-production` to confirm the next lane ranking is still justified
- Check `git diff --stat` and `git status --short --branch` for bounded scope
- Keep the branch survey-only without widening into a new standards edit yet
