# Cleanup Plan: review-to-merge pass (`responsive-design`)

## Goal

Keep this run bounded to a survey refresh plus the review-to-merge checkpoint
for `responsive-design`, then queue the next packaging lane without reopening
the packaged skill surface.

## Behavior lock

- Keep this run limited to `.survey/llm-agent-skill-landscape/*`.
- Do not reopen the merged `git-workflow`, `codebase-search`,
  `ui-component-patterns`, `state-management`, `deployment-automation`,
  `technical-writing`, `prompt-repetition`, `genkit`, or
  `database-schema-design` lanes.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not reopen `.god-skills/responsive-design/*` unless review evidence shows
  a real gap.
- Do not add scripts or assets unless repeated eval or review work proves a
  reusable deterministic helper or bundled template is required.

## Packaging decisions

- `responsive-design`
  - Assets: no; review found no bundled template or media artifact the skill
    needs
  - Scripts: no; the validator is enough and there is still no repeated helper
    workflow to bundle
  - References: already added; keep them as the progressive-disclosure surface
  - Evals: already added; use them for future mutation triage instead of adding
    broader prose
- `agent-workflow`
  - Assets: no; the likely follow-up gap is structural, not template-driven
  - Scripts: no; warning cleanup should stay instructional first
  - References: likely yes; the current body mixes several command families and
    workflow concerns
  - Evals: likely yes; trigger wording and workflow coverage should be measured
- `skill-autoresearch`
  - Keep at triage only in this run
  - Do not start a mutation loop until a compact eval-backed target shows
    failing measured checks or attracts review feedback

## Planned edits

1. Re-check PR `#38` for duplicate work, missing improvements, and remaining
   standardization gaps.
2. Refresh the survey lock and direction files to move `responsive-design`
   from `pr-open` to `merge`.
3. Keep `agent-workflow` locked as the next packaging candidate once
   `responsive-design` closes.
4. Validate the target skill and the full skill inventory.
5. Leave the repo in explicit `merge` state for the next owner.

## Verification

- Confirm PR `#37` is merged and there is no newer open lane ahead of
  `responsive-design`
- Confirm PR `#38` remains open, non-draft, review-clean, and merge-clean
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/responsive-design`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm the diff stays bounded to survey lock files only
- Record current state, blocker, next owner, and stage for the next scheduled
  improvement run
