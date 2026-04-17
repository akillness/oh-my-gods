# Cleanup Plan: canonicalize duplicated principles skills

## Goal

Keep this run bounded to a survey refresh plus one standards-clean
canonicalization lane for `agent-principles` and its legacy duplicate
`agent-development-principles`, then open the PR path without widening into a
repo-wide warning sweep or reopening already-merged lanes.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/agent-principles/*`
  - `.god-skills/agent-development-principles/*`
  - `README.md`
  - `README.ko.md`
- Do not reopen the merged `agent-configuration`, `agent-workflow`,
  `git-workflow`, or `responsive-design` lanes.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch `opencontext`, `bmad`, `bmad-idea`, or other queued lanes
  unless a shared blocker forces it.
- Do not add scripts or assets unless repeated evaluation or review work proves
  a reusable deterministic helper or bundled template is required.

## Packaging decisions

- `agent-principles`
  - Assets: no; this lane needs reusable guidance, not bundled media
  - Scripts: no; the audit shows no repeated deterministic helper to bundle
  - References: yes; the six principles and supporting detail should move
    behind progressive disclosure instead of staying duplicated in the entrypoint
  - Evals: yes; trigger quality, routing, and canonical behavior should be
    measured before any later mutation loop
- `agent-development-principles`
  - Assets: no; a compatibility alias does not need bundled media
  - Scripts: no; alias behavior is instructional, not executable
  - References: no; the alias should route to the canonical skill instead of
    carrying duplicate detail
  - Evals: yes; add alias-routing coverage so the duplicate does not keep
    competing as a peer default
- `skill-autoresearch`
  - Keep at triage only in this run
  - Do not start a mutation loop until the canonicalized lane exists and shows
    measured failures or review feedback

## Planned edits

1. Refresh the survey lock and direction files to reflect that PR `#40` is
   merged and the next bounded lane is principles-skill canonicalization.
2. Rewrite `.god-skills/agent-principles/SKILL.md` into a compact canonical
   entrypoint with imperative triggering, sibling routing, instructions,
   examples, best practices, and references.
3. Add focused `references/` docs and `evals/evals.json` for
   `agent-principles`.
4. Convert `.god-skills/agent-development-principles/SKILL.md` into a
   compatibility alias for `agent-principles` and add alias-routing evals.
5. Update both `SKILL.toon` files plus README catalog copy to match the new
   canonical/alias split.
6. Validate the target and repo, then open the PR path.
7. Record current state, blocker, next owner, and stage for the next scheduled
   run.

## Verification

- Confirm PR `#40` is merged and there is no still-open skill-loop PR for the
  same lane
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/agent-principles`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/agent-development-principles`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Review the principles-skill diff for duplicate work, missing progressive
  disclosure, and unjustified scripts or assets
- Open the PR from the new branch and record its URL
- Leave the repo in explicit `pr-open` state for the next owner
