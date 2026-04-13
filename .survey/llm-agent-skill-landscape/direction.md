# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- Branch baseline: `main` after PR `#19` merged and with no open follow-up PRs
- Repo-wide validator snapshot before this run: `0` errors, `103` warnings across `.god-skills/`
- Highest-value bounded gaps now sit in the browser and orchestration surface area, not in `ohmg`, because the earlier `playwriter` and `omg` cleanup lanes have already landed

## Locked direction

Improve one workflow-critical skill per run, in priority order:

1. `agent-browser`
2. `agent-manager`
3. `agentation`

This order is locked because it balances leverage and boundedness:

- `agent-browser` is now the cleanest high-value packaging gap: it already has references and templates, but it still lacked `Instructions`, `Examples`, `Best practices`, and evals.
- `agent-manager` is central to multi-agent runtime control and already has scripts plus references, making it the next compact hardening lane after `agent-browser`.
- `agentation` remains important, but it still needs both structural cleanup and stronger support material, so it is a larger follow-up slice.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agent-browser` | High | No | No | No | Existing references and templates are already enough | Yes, in this run | Standardize `SKILL.md`, add evals, then keep stable until real scoring data exists |
| `agent-manager` | High | No | No | Existing scripts are already enough | Existing references are already enough | Yes | Add evals and the missing recommended sections in a later bounded pass |
| `agentation` | High | No | No | Existing scripts are already enough | Likely yes | Yes | Add `When to use`, `Instructions`, `Examples`, `Best practices`, and evals before considering optimization |
| `ohmg` | High | Later | No | Existing capture and scoring scripts are already enough | Existing baseline note is enough | Already present | Keep frozen until the browser-surface packaging backlog is reduced and the next experiment can be measured honestly |

## Packaging decision for this run

- Target skill: `agent-browser`
- Assets: no new assets needed
- Scripts: no new scripts needed
- References: no new references needed; the existing `references/` directory already covers commands, auth, sessions, and snapshot refs
- Evals: needed; add `evals/evals.json` now

## Current state

- State: `agent-browser` is the active bounded improvement lane for this run
- Blocker: no hard blocker for the packaging slice itself; the only reason not to start `skill-autoresearch` yet is the lack of repeated scored runs for this specific skill
- Next owner: `nanoclaw_engine` for the next review pass after the PR is opened
- Intended next stage after this run: `PR-open`
