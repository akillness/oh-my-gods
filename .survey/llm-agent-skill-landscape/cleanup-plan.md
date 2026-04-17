# Cleanup Plan: packaging pass (`agent-configuration`)

## Goal

Keep this run bounded to a survey refresh plus one standards-clean packaging
lane for `agent-configuration`, then open the PR path without widening into a
repo-wide warning sweep.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/agent-configuration/*`
- Do not reopen the merged `agent-workflow`, `git-workflow`, or
  `responsive-design` lanes.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch `agent-development-principles`, `agent-principles`, `bmad`, or
  other queued lanes unless a shared blocker forces it.
- Do not add scripts or assets unless repeated evaluation or review work proves
  a reusable deterministic helper or bundled template is required.

## Packaging decisions

- `agent-configuration`
  - Assets: no; this lane needs scoped guidance, not reusable media
  - Scripts: no; the audit shows no repeated deterministic helper to bundle
  - References: yes; scope, guardrails, and team-sharing details should move
    behind progressive disclosure
  - Evals: yes; trigger quality and routing should be measured before any later
    mutation loop
- `skill-autoresearch`
  - Keep at triage only in this run
  - Do not start a mutation loop until the packaged version exists and shows
    measured failures or review feedback

## Planned edits

1. Refresh the survey lock and direction files to reflect that PR `#39` is
   merged and `agent-configuration` is now the active lane.
2. Rewrite `.god-skills/agent-configuration/SKILL.md` into a compact
   standards-clean entrypoint with imperative triggering, sibling routing,
   instructions, examples, best practices, and references.
3. Add focused `references/` docs and `evals/evals.json` for
   `agent-configuration`.
4. Update `SKILL.toon` to match the new trigger surface.
5. Validate the target and repo, then open the PR path.
6. Record current state, blocker, next owner, and stage for the next scheduled
   run.

## Verification

- Confirm PR `#39` is merged and there is no still-open skill-loop PR for the
  same lane
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/agent-configuration`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Review the `agent-configuration` diff for duplicate work, missing
  progressive disclosure, and unjustified scripts or assets
- Open the PR from the new branch and record its URL
- Leave the repo in explicit `pr-open` state for the next owner
