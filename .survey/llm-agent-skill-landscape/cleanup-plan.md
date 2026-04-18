# Cleanup Plan: close the `design-system` lane and reset the queue

## Goal

Record the merged `design-system` lane, keep the recurring loop aligned with
live GitHub state, and freeze the next bounded lane on the canonical
`video-production` skill plus the `remotion-video-production` compatibility
surface.

## Behavior lock

- Keep this run focused on `.survey/llm-agent-skill-landscape/*`.
- Do not edit `video-production` or `remotion-video-production` yet; this pass
  only re-locks the queue after merge.
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, `bmad`, `bmad-idea`, `langchain-bmad`,
  `clawteam`, `presentation-builder`, `design-system`, or
  `frontend-design-system` lanes unless measured failures appear.
- Keep the next implementation lane bounded to `video-production` plus
  `remotion-video-production`; do not widen it to `langextract` or
  `marketing-automation` unless a shared blocker appears.
- Do not start a `skill-autoresearch` mutation loop for the next lane before
  the standards pass adds the missing support surface and measured failures
  still remain afterward.

## Planned edits

1. Record PR `#49` as merged and close the `design-system` lane.
2. Refresh the survey lock against live ecosystem and GitHub state.
3. Freeze the next bounded lane on `video-production` plus
   `remotion-video-production`.
4. Keep `skill-autoresearch` deferred until the next lane has eval-backed
   measured misses.

## Verification

- Confirm PR `#49` is merged on GitHub and record the merge timestamp.
- Re-run repo-wide validation and confirm it still reports `80/80 passed`.
- Check `git diff --stat` and `git status --short --branch` for bounded scope.
- Keep the resulting state-only branch bounded to survey-lock updates without
  widening into a new implementation lane.
