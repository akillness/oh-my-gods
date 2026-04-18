# Cleanup Plan: review `presentation-builder` and move to merge

## Goal

Take the active `presentation-builder` PR lane from review into merge. Keep the
scope limited to recurring survey state and only reopen skill files if review
finds a concrete duplicate, missing standards surface, or compliance gap.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, `bmad`, `bmad-idea`, `langchain-bmad`,
  or `clawteam` lanes unless measured failures appear.
- Do not widen the run into the two-warning cluster (`design-system`,
  `frontend-design-system`, `langextract`, `marketing-automation`,
  `remotion-video-production`, `video-production`) unless a shared blocker
  appears.
- Do not reopen `.god-skills/presentation-builder/*` unless review finds a
  concrete standards regression or missing support surface.
- Do not start a `skill-autoresearch` mutation loop for `presentation-builder`
  before the reviewed standards baseline is merged and later measured failures
  exist.

## Planned edits

1. Recheck live PR `#48` state, mergeability, and review status.
2. Re-run focused and repo-wide validation to confirm
   `presentation-builder` remains standards-clean.
3. Refresh the durable survey lock from `pr-open` to `merge` if review stays
   clean and bounded.
4. Keep the next queue target frozen until PR `#48` is merged.

## Verification

- Re-run `bash .god-skills/skill-standardization/scripts/validate_skill.sh
  .god-skills/presentation-builder`
- Re-run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
  and confirm the repo remains at `0` errors / `20` warnings
- Recheck `gh pr view 48 --json state,mergeStateStatus,reviewDecision,reviews`
- Check `git diff --stat` and `git status --short --branch` for bounded scope
- Keep the branch merge-ready without widening the active lane
