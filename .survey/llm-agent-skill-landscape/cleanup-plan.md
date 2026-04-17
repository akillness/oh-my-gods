# Cleanup Plan: package `langchain-bmad` into the next bounded standards lane

## Goal

Keep this run bounded to the highest-leverage remaining three-warning skill
after the `bmad-idea` merge: `langchain-bmad`.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/langchain-bmad/*`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`,
  `responsive-design`, `opencontext`, `bmad`, or `bmad-idea` lanes unless
  measured failures appear.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch queued lanes outside `langchain-bmad` unless a shared blocker
  appears.
- Do not add scripts or assets unless review evidence proves a reusable
  deterministic helper or bundled template is required.

## Packaging decisions

- `langchain-bmad`
  - Assets: no
  - Scripts: no; existing upstream install and phase commands do not justify a
    repo-local helper yet
  - References: yes; move phase maps, framework routing, and setup detail
    behind progressive disclosure
  - Evals: yes; add trigger, routing, and boundary coverage before any later
    mutation loop
- `skill-autoresearch`
  - Keep at triage only
  - Do not start a mutation loop until post-review or later eval evidence
    shows that `langchain-bmad` still fails in measured ways

## Planned edits

1. Refresh the survey lock now that PR `#45` is merged.
2. Re-run the repo-wide validator and confirm the warning count still sits at
   `29`, with `langchain-bmad` still in the highest-warning cluster.
3. Rewrite `langchain-bmad` into a compact routed entrypoint with explicit
   `Instructions`, `Examples`, and `Best practices`.
4. Add only the missing support files: `references/` plus `evals/`.
5. Register the new PR-open lane after verification instead of widening into a
   second skill.

## Verification

- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Confirm PR `#45` is merged and `bmad-idea` stays closed
- Validate `langchain-bmad` for standards structure and support-surface fit
- Leave the repo in explicit `pr-open` state for the next owner
