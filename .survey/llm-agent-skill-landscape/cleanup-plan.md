# Cleanup Plan: packaging pass (`agent-workflow`)

## Goal

Keep this run bounded to a survey refresh plus one standards-clean packaging
lane for `agent-workflow`, then open the PR path without widening into a
repo-wide warning sweep.

## Behavior lock

- Keep this run focused on:
  - `.survey/llm-agent-skill-landscape/*`
  - `.god-skills/agent-workflow/*`
- Do not reopen the merged `git-workflow` or `responsive-design` lanes.
- Do not widen this run into a repo-wide warning cleanup pass.
- Do not touch `.god-skills/agent-configuration/*` unless `agent-workflow`
  validation reveals a shared blocker that cannot stay local.
- Do not add scripts or assets unless repeated evaluation or review work proves
  a reusable deterministic helper or bundled template is required.

## Packaging decisions

- `agent-workflow`
  - Assets: no; the current gap is workflow structure, not reusable media or
    templates
  - Scripts: no; there is no repeated deterministic helper to bundle yet
  - References: yes; the current entrypoint mixes commands, shortcuts, Git,
    MCP, and orchestration detail that should move behind progressive
    disclosure
  - Evals: yes; trigger quality and workflow coverage should be measured before
    any later mutation loop
- `agent-configuration`
  - Assets: no
  - Scripts: no
  - References: likely yes, but keep deferred behind `agent-workflow`
  - Evals: maybe later, after its structural cleanup becomes the active lane
- `skill-autoresearch`
  - Keep at triage only in this run
  - Do not start a mutation loop until a compact eval-backed target shows
    measured failures or attracts review feedback

## Planned edits

1. Refresh the survey lock and direction files to reflect that PR `#38`
   merged and `agent-workflow` is now the top queued lane.
2. Rewrite `.god-skills/agent-workflow/SKILL.md` into a compact standards-clean
   entrypoint with imperative triggering, sibling routing, instructions,
   examples, and references.
3. Add focused `references/` docs and `evals/evals.json` for
   `agent-workflow`.
4. Update `SKILL.toon` to match the new trigger surface.
5. Validate the target and repo, then open the PR path.
6. Record current state, blocker, next owner, and stage for the next scheduled
   run.

## Verification

- Confirm PR `#38` is merged and no other skill-loop PR is currently open
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh .god-skills/agent-workflow`
- Run
  `bash .god-skills/skill-standardization/scripts/validate_skill.sh --all .god-skills`
- Review the `agent-workflow` diff for duplicate work, missing progressive
  disclosure, and unnecessary scripts or assets
- Open the PR from the new branch and record its URL
- Leave the repo in explicit `pr-open` state for the next owner
