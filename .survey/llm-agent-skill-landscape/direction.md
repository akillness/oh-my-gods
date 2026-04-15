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
- PR `#33` for `deployment-automation` is open, mergeable, and still bounded to
  the packaged skill surface plus survey lock files:
  https://github.com/akillness/oh-my-gods/pull/33

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

Advance one workflow-critical packaging gap per run, in priority order:

1. Merge `deployment-automation`
2. `state-management`
3. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `technical-writing` is already closed, so continuing to treat it as active
  would be duplicate work.
- `deployment-automation` has cleared the packaging and review gates, so the
  only remaining work in this lane is the merge step.
- `state-management` remains the strongest next packaging gap once the current
  deployment lane lands.
- Mutation work is still lower leverage than packaging debt on the remaining
  monoliths.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `technical-writing` | Closed | No | No | No | Merged | Merged | Keep closed |
| `deployment-automation` | High | Not yet | No | No in this pass | Yes | Yes | Merge PR `#33` and close the lane |
| `state-management` | High | Not yet | No | Not yet | Likely needed | Needed | Keep next after deployment review starts |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit gate |
| `skill-autoresearch` | Medium | Already packaged | No | No | Already present | Already present | Use only on compact skills with stable eval baselines |

## Packaging decision for this run

- Target lane: `deployment-automation` review-to-merge
- Assets: no additional assets needed
- Scripts: still no; the skill remains reference-backed rather than
  script-backed
- References: already added and validated
- Evals: already added and validated
- Sections: keep the packaged skill surface unchanged unless review finds a
  bounded defect

## Current state

- State: `deployment-automation` passed review cleanly and is ready to merge on
  PR `#33`
- Blocker: cross-agent fanout is still blocked by the missing repo-level
  bridge target, but it does not block the merge step
- Next owner: `nanoclaw_pd` to reopen the queue at `state-management` after
  PR `#33` lands
- Stage: `merge`
