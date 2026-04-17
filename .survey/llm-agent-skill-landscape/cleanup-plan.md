# Cleanup Plan: standardize the next bounded skill lane after the principles merge

## Goal

Keep the next run bounded to a survey refresh plus one standards-clean lane for
`opencontext`, without widening into a repo-wide warning sweep or reopening the
already-merged principles or configuration lanes.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/opencontext/*`
  - `README.md`
  - `README.ko.md`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `agent-principles`, `agent-development-principles`, `git-workflow`, or
  `responsive-design` lanes.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch `bmad`, `bmad-idea`, or other queued lanes unless a shared
  blocker forces it.
- Do not add scripts or assets unless repeated evaluation or review work proves
  a reusable deterministic helper or bundled template is required.

## Packaging decisions

- `opencontext`
  - Assets: no; this lane needs reusable guidance, not bundled media
  - Scripts: no by default; only add one if repeated deterministic helper work
    appears during validation
  - References: likely yes; detailed setup and provider-specific guidance
    should move behind progressive disclosure if the main entrypoint stays too
    broad
  - Evals: yes; trigger quality, routing, and scope discipline should be
    measured before any later mutation loop
- `skill-autoresearch`
  - Keep at triage only in this run
  - Do not start a mutation loop until the standardized lane exists and shows
    measured failures or review feedback

## Planned edits

1. Refresh the survey lock and direction files to reflect that PR `#41` is
   merged and the next bounded lane is `opencontext`.
2. Rewrite `.god-skills/opencontext/SKILL.md` into a compact standards-clean
   entrypoint with imperative triggering, instructions, examples, best
   practices, and clearer routing boundaries.
3. Add focused `references/` docs and `evals/evals.json` for `opencontext` if
   they reduce ambiguity and keep the main file compact.
4. Update `SKILL.toon` and any README catalog copy that should reflect the
   refined `opencontext` positioning.
5. Validate the target and repo, then open the next PR path.
6. Record current state, blocker, next owner, and stage for the next scheduled
   run.

## Verification

- Confirm PR `#41` is merged and there is no still-open skill-loop PR for the
  same lane
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/opencontext`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Review the `opencontext` diff for duplicate work, missing progressive
  disclosure, and unjustified scripts or assets
- Open the PR from the new branch and record its URL
- Leave the repo in explicit `pr-open` state for the next owner
