# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Repo-wide validator snapshot on this run: `81/81` skill directories pass the
  current frontmatter validator with `0` errors.
- Eval coverage rises to `21/81` shipped skills after adding
  `.god-skills/plannotator/evals/evals.json`.
- `omg` is already merged on `origin/main` via PR `#24`, so that lane stays
  closed in this run.
- `vibe-kanban` remains merged on `origin/main` via PR `#23`, so that lane also
  stays closed.
- `plannotator` moved from a five-warning packaging backlog item to a
  standards-clean PR-open slice by shrinking the entrypoint and bundling the
  missing references.

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `plannotator`
2. `ralph`
3. `ohmg` follow-up only if a new measured mutation can beat the kept
   experiment state
4. other script-heavy skills without evals only after the above queue changes

This order is locked because:

- `plannotator` sits directly on the human review gate for shared orchestration
  workflows and now has a bounded PR-open branch ready for review.
- `ralph` remains the next highest-leverage packaging target once the
  `plannotator` branch is either merged or receives one bounded follow-up pass.
- `ohmg` already has evals and measured mutation artifacts, so it still loses
  to packaging-first work elsewhere unless a stronger experiment target appears.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `plannotator` | High | No | No | Existing scripts are already enough | Added on this branch to split deep setup and troubleshooting out of the entrypoint | Added on this branch | Review PR `#25`, then decide if one bounded follow-up patch is needed |
| `ralph` | Medium | No | No | Existing scripts are already enough | Existing references are already enough | Yes | Keep behind `plannotator` unless the review finds the lane clean and merged |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a stronger mutation target or harness change exists |
| `skill-standardization` | Medium | No | No | Existing validator script is already enough | No | Already present | Keep as an audit surface, not an edit target, in this run |
| `skill-autoresearch` | Medium | No | No | No | Existing reference guide is already enough | Already present | Keep as the decision gate for whether a scored loop is worth starting |

## Packaging decision for this run

- Target skill: `plannotator`
- Assets: no new assets needed
- Scripts: no new runtime scripts needed
- References: yes; added `platform-setup.md` and
  `notes-and-troubleshooting.md`
- Evals: yes; added `evals/evals.json`
- Sections: yes; rewrote the entrypoint into a compact standards-oriented
  surface with `Instructions`, `Examples`, `Best practices`, and `References`
- Post-open result: PR `#25` is open; the next run should review for duplicate
  work, missing improvements, or any remaining standardization gaps after
  GitHub finishes recalculating mergeability

## Current state

- State: PR `#25` is open for the bounded `plannotator` packaging slice on
  `chore/skill-loop-pr-open-20260414-r26`
- Blocker: no hard blocker remains for the packaging slice itself, but GitHub
  is still recalculating mergeability immediately after the latest push, so the
  next meaningful gate is post-open review plus a fresh PR status check
- Next owner: `nanoclaw_pd` for the next PR-review run, with
  `nanoclaw_engine` only if that review finds a bounded follow-up patch
- Stage: `pr-open`
