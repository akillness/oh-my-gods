# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#32` for `technical-writing` is already merged and closed:
  https://github.com/akillness/oh-my-gods/pull/32
- Latest `origin/main` validates cleanly on hard errors, so the old
  `technical-writing` branch is no longer the active lane.
- `deployment-automation` is the strongest next packaging target because it
  still ships on `main` as a `557` line monolith with no `references/` and no
  `evals/`.
- This rebased branch reduces the repo-wide validator total to `65` warnings
  while making `deployment-automation` itself standards-clean at `0/0`.
- `state-management` is the next queued monolith at `553` lines, but it stays
  out of scope until the deployment lane is registered.
- The orchestration wrapper is degraded because the repo-level bridge target is
  missing, so this loop continues locally until that path is restored.

## Survey refresh

The current LLM-agent skill landscape still favors packaging-first work over
prompt-mutation work for this repo:

1. Agent Skills keeps the shared ecosystem centered on compact skill entrypoints
   plus optional support directories, which means oversized monoliths are still
   the main leverage bottleneck.
2. OpenAI Codex now emphasizes reusable skills and automations as durable
   workflow surfaces, so compact packaging matters more than adding another
   broad prose block.
3. Claude and Gemini continue to formalize packaged subagents, slash commands,
   extensions, and command surfaces, which reinforces explicit trigger text and
   support-file structure.
4. A2A `1.0` increases the pressure toward explicit capability disclosure and
   durable contracts.
5. `skill-autoresearch` still pays off only after the target skill is compact
   and eval-backed.

## Locked direction

Improve one workflow-critical packaging gap per run, in priority order:

1. `deployment-automation`
2. `state-management`
3. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `technical-writing` is already closed, so continuing to treat it as active
  would be duplicate work.
- `deployment-automation` is still the most obvious packaging gap left in the
  workflow-critical set.
- `state-management` remains important but does not outrank the newly reopened
  deployment lane.
- Mutation work is still lower leverage than packaging debt on the remaining
  monoliths.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `technical-writing` | Closed | No | No | No | Merged | Merged | Keep closed |
| `deployment-automation` | High | Not yet | No | No in this pass | Yes | Yes | Package it and open the next PR path |
| `state-management` | High | Not yet | No | Not yet | Likely needed | Needed | Keep next after deployment review starts |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit gate |
| `skill-autoresearch` | Medium | Already packaged | No | No | Already present | Already present | Use only on compact skills with stable eval baselines |

## Packaging decision for this run

- Target skill: `deployment-automation`
- Assets: no
- Scripts: no; this pass only needs packaged references and eval coverage
- References: yes; move long deployment examples and rollout notes out of the
  activation surface
- Evals: yes; add a baseline prompt set for future review and mutation choices
- Sections: make the main skill compact, triggerable, and aligned with the
  packaged support files

## Current state

- State: `deployment-automation` is now the active PR-open lane on PR `#33`
- Blocker: cross-agent fanout is blocked by the missing repo-level bridge
  target, so execution stays local
- Next owner: `nanoclaw_pd` to run the next PR-review pass on PR `#33`
- Stage: `PR-open`
