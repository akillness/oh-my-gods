# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Repo-wide validator snapshot on this run: `80/80` shipped skills pass the
  current frontmatter validator with `0` errors; `.god-skills/__pycache__` is
  present locally but is not a shipped skill.
- Eval coverage rises to `21/80` shipped skills after adding
  `.god-skills/plannotator/evals/evals.json`.
- `omg` is already merged on `origin/main` via PR `#24`, so that lane stays
  closed in this run.
- `vibe-kanban` remains merged on `origin/main` via PR `#23`, so that lane also
  stays closed.
- `plannotator` moved from a five-warning packaging backlog item to a
  standards-clean merge-ready slice by shrinking the entrypoint, bundling the
  missing references, and passing the post-open review gate.

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `plannotator`
2. `ralph`
3. `ohmg` follow-up only if a new measured mutation can beat the kept
   experiment state
4. other script-heavy skills without evals only after the above queue changes

This order is locked because:

- `plannotator` sits directly on the human review gate for shared orchestration
  workflows and now has a bounded merge-ready branch.
- `ralph` remains the next highest-leverage packaging target once the
  `plannotator` branch is either merged or receives one bounded follow-up pass.
- `ohmg` already has evals and measured mutation artifacts, so it still loses
  to packaging-first work elsewhere unless a stronger experiment target appears.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `plannotator` | High | No | No | Existing scripts are already enough | Already added on this branch to split deep setup and troubleshooting out of the entrypoint | Already added on this branch | Merge PR `#25` in this run |
| `ralph` | Medium | No | No | Existing scripts are already enough | Existing references are already enough | Yes | Keep behind `plannotator` unless the review finds the lane clean and merged |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a stronger mutation target or harness change exists |
| `skill-standardization` | Medium | No | No | Existing validator script is already enough | No | Already present | Keep as an audit surface, not an edit target, in this run |
| `skill-autoresearch` | Medium | No | No | No | Existing reference guide is already enough | Already present | Keep as the decision gate for whether a scored loop is worth starting |

## Packaging decision for this run

- Target skill: `plannotator`
- Assets: no new assets needed
- Scripts: no new runtime scripts needed
- References: no further references needed in this run; `platform-setup.md` and
  `notes-and-troubleshooting.md` already cover the deep setup and
  troubleshooting material
- Evals: no further eval changes needed in this run; `evals/evals.json` already
  locks the main response-shape and limitation cases
- Sections: no further section rewrite needed in this run; the entrypoint is
  already compact and standards-clean
- Post-open review result: clean; no follow-up patch is justified before merge

## Current state

- State: PR `#25` has passed the post-open review gate and is ready to merge
  for the bounded `plannotator` packaging slice on
  `chore/skill-loop-pr-open-20260414-r26`
- Blocker: no hard blocker remains for the packaging slice itself; the only
  deferred work is `skill-autoresearch`, which still waits on a merged baseline
  plus repeated measured failures
- Next owner: `nanoclaw_pd` to merge PR `#25` in this run, then
  `nanoclaw_engine` for the next bounded `ralph` packaging pass after merge
- Stage: `merge`
