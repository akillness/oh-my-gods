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
- Repo-wide validation after merging PR `#47` now sits at `0` errors and
  `23` warnings.
- `clawteam` has left the leaderboard after merge; the highest-warning
  remaining skill is now `presentation-builder` at `3` warnings.

## Survey refresh

The landscape signal remains stable after the review pass:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. LangChain and Deep Agents still reinforce packaged skills with deferred
   detail, which keeps bridge skills valuable only when they route cleanly and
   stay compact.
3. GitHub's new `gh skill` workflow further raises the value of portable,
   standards-clean skill directories.
4. Inference for this repo: `clawteam` is now closed, so the highest-value
   move is to advance the next highest-leverage unresolved standards gap.
5. `presentation-builder` is now the clearest next bounded survey target
   because it leads the warning cluster alone at `3` and still lacks the
   standard section shape that would justify a later optimization loop.

## Locked direction

Advance one bounded lane per run, in this order:

1. Standardize `clawteam` on branch `chore/skill-loop-pr-open-20260418-r49`
2. Open or review the `clawteam` PR once the validator delta is clean
3. Reset the loop to survey on `presentation-builder`
4. Revisit `skill-autoresearch` only after a review-clean, eval-backed target
   still shows measured failures

This order is locked because:

- `clawteam` is already merged, so reopening it would widen scope without new
  evidence.
- `presentation-builder` now sits alone at the top of the warning leaderboard,
  which makes it the clearest next bounded lane.
- The remaining two-warning surfaces are still legitimate follow-ups, but they
  no longer outrank `presentation-builder` on boundedness plus urgency.

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
| `presentation-builder` | High | Not yet | No | No | Probably yes | Probably yes | Start the next bounded standards lane here |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review-clean target still misses objective checks |

## Packaging decision for the next queued lane

- Target skill: `presentation-builder`
- Assets: no
- Scripts: no by default; only add one if a reusable deterministic helper is
  missing
- References: probably yes; package deck-authoring and review detail behind
  progressive disclosure if the standards pass exposes repeated inline setup
- Evals: probably yes; add trigger-quality and stage-order coverage before any
  later mutation loop
- Sections: standardize the entrypoint around `Instructions`, `Examples`, and
  `Best practices` before considering any optimization loop

## Current state

- State: `clawteam` is closed after merged PR `#47`; the next bounded lane
  resets to `presentation-builder`
- PR: https://github.com/akillness/oh-my-gods/pull/47
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` survey pass
- Stage: `survey`
