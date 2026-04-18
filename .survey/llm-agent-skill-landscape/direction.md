# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#39` for `agent-workflow` is merged:
  https://github.com/akillness/oh-my-gods/pull/39
- PR `#40` for `agent-configuration` is merged:
  https://github.com/akillness/oh-my-gods/pull/40
- PR `#41` for the principles canonicalization lane is merged:
  https://github.com/akillness/oh-my-gods/pull/41
- PR `#42` for the merge-checkpoint lane is merged:
  https://github.com/akillness/oh-my-gods/pull/42
- PR `#43` for the `opencontext` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/43
- PR `#44` for the `bmad` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/44
- PR `#45` for the `bmad-idea` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/45
- PR `#46` for the `langchain-bmad` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/46
- Repo-wide validation now sits at `0` errors and `20` warnings after the
  `presentation-builder` standards pass.
- `presentation-builder` has left the warning leaderboard after PR `#48`
  opened; the remaining leaders are the six two-warning skills.

## Survey refresh

The landscape signal remains stable after the latest review pass:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. LangChain and Deep Agents still reinforce packaged skills with deferred
   detail, which keeps bridge skills valuable only when they route cleanly and
   stay compact.
3. GitHub's new `gh skill` workflow further raises the value of portable,
   standards-clean skill directories.
4. Inference for this repo: the active `presentation-builder` PR has now been
   reviewed cleanly, so the next hourly pass should merge it before advancing
   the queue.
5. The two-warning cluster matters, but it should stay queued until PR `#48`
   is merged.

## Locked direction

Advance one bounded lane per run, in this order:

1. Merge PR `#48` for `presentation-builder`
2. Only after merge, reset the queue to the next bounded warning leader in the
   two-warning cluster
3. Revisit `skill-autoresearch` only after a review-clean, eval-backed target
   still shows measured failures

This order is locked because:

- PR `#48` is already open, so skipping straight to another target would
  create duplicate work and break the recurring loop contract.
- `presentation-builder` now has the support surface it was missing and the
  review pass found no new debt, so the next uncertainty is merge completion,
  not local packaging work.
- The remaining two-warning surfaces are legitimate follow-ups, but they do
  not outrank closing the active PR lane.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agent-workflow` | High | Not yet | No | No | Added | Added | Keep closed unless failures or review feedback reopen it |
| `agent-configuration` | High | Not yet | No | No | Yes | Yes, including conflict-set coverage | Keep closed unless failures appear |
| `agent-principles` | High | Not yet | No | No | Yes | Yes | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | High | Not yet | No | No | No | Yes | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | High | Not yet | No | No | Added | Added | Keep closed unless failing evals or review feedback reopen it |
| `bmad` | High | Not yet | No | Existing scripts were enough | Existing setup/reference files were enough | Added | Keep closed unless failures or review feedback reopen it |
| `bmad-idea` | High | Not yet | No | No | Added | Added | Keep closed after merge unless new evidence appears |
| `langchain-bmad` | High | No | No | No | Added | Added | Keep closed after merged PR `#46`; do not reopen without new evidence |
| `clawteam` | High | No | No | Existing script is enough | Existing references are enough | Existing evals are enough | Keep closed after merged PR `#47`; do not reopen without new evidence |
| `presentation-builder` | High | Not yet | No | No | Added | Added | Merge PR `#48`; only reopen if review feedback or failing evals appear |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review-clean target still misses objective checks |

## Packaging decision for the active lane

- Target skill: `presentation-builder`
- Assets: no
- Scripts: no; the lane stayed bounded without them
- References: added via `references/slides-grab-workflow.md`
- Evals: added via `evals/evals.json`
- Sections: standardized around `Instructions`, `Examples`, and `Best
  practices`
- Skill-autoresearch: still deferred until post-merge review or eval evidence
  shows measured misses after the standards pass

## Current state

- State: `presentation-builder` standards lane is merge-ready after a clean
  review pass
- PR: https://github.com/akillness/oh-my-gods/pull/48
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` merge pass
- Stage: `merge`
