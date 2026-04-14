# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Repo-wide validator snapshot on this run: `80/80` skills pass the current
  frontmatter validator.
- `vibe-kanban` now passes the `skill-standardization` validator with `0` errors
  and `0` warnings after shrinking the main entrypoint from `620` lines to
  `186`.
- Eval coverage on this branch is now `19` of `80` shipped skills with
  `evals/evals.json`.
- Among workflow-critical skills that already ship scripts or references but
  still lack evals, `omg` is now the clearest next bounded packaging gap after
  the current `vibe-kanban` slice.
- `plannotator` remains a real backlog item because the validator now reports
  `5` warnings, but it is still a broader cleanup than the next bounded `omg`
  packaging pass.

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `vibe-kanban`
2. `omg`
3. `plannotator`
4. `ohmg` follow-up only if a new measured mutation can beat the kept experiment state

This order is locked because it balances leverage and boundedness after the
previous `agentation` slice landed:

- `vibe-kanban` was the cleanest immediate packaging gap because it already
  shipped scripts plus references, but still lacked eval coverage and had a
  drift-prone monolithic entrypoint.
- `omg` is the next highest-leverage packaging target because it remains a core
  orchestration surface and still lacks eval coverage.
- `plannotator` remains valuable, but it is less central than `omg` for the
  repo-wide workflow spine.
- `ohmg` stays on the later mutation lane because it already has evals and
  support artifacts; the bigger payoff is still packaging-first work elsewhere.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `vibe-kanban` | High | Not yet | No | Existing scripts are enough | Yes, to keep the entrypoint compact | Added on this branch | Review PR `#23`, merge the packaging slice, then watch for repeated measured failures before any mutation loop |
| `omg` | High | No | No | Existing scripts are already enough | Existing references are already enough | Yes | Make `omg` the next packaging candidate after `vibe-kanban` lands |
| `plannotator` | Medium | No | No | Existing scripts are already enough | No | Yes | Re-rank after `omg` |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until a stronger mutation target or harness change exists |
| `skill-standardization` | Medium | No | No | Existing validator script is already enough | No | Already present | Use as an audit surface, not an edit target, in this run |
| `skill-autoresearch` | Medium | No | No | No | Existing reference guide is already enough | Already present | Use as the decision gate for whether a scored loop is worth starting |

## Packaging decision for this run

- Target skill: `vibe-kanban`
- Assets: no new assets needed
- Scripts: no new runtime scripts needed; only helper-script comment/path fixes
- References: add `workspace-playbook.md` and `operations-guide.md`, and refresh
  the environment variable reference
- Evals: add `evals/evals.json`
- Sections: add explicit `Instructions`, `Examples`, and `Best practices`, then
  keep the main file compact enough to stay standards-clean
- Post-open review result: clean; no follow-up patch is justified before merge

## Current state

- State: PR `#23` has passed the post-open review gate and is ready to merge for
  the bounded `vibe-kanban` packaging slice on
  `chore/skill-loop-pr-open-20260414-r24`
- Blocker: no hard blocker remains for the packaging slice itself; the only
  deferred work is `skill-autoresearch`, which still waits on a merged baseline
  plus repeated measured failures
- Next owner: `nanoclaw_pd` to merge PR `#23` in this run, then
  `nanoclaw_engine` for the next bounded `omg` packaging pass after merge
- Stage: `merge`
