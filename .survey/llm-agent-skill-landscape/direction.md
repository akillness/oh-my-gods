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
- PR `#47` for the `clawteam` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/47
- PR `#48` for the `presentation-builder` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/48
- Repo-wide validation now sits at `0` errors and `16` warnings after the
  `design-system` standards pass.
- `design-system` and `frontend-design-system` have left the warning
  leaderboard after PR `#49` opened; the remaining leaders are the four
  two-warning skills.

## Survey refresh

The landscape signal remains stable after the latest review pass:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. LangChain and Deep Agents still reinforce packaged skills with deferred
   detail, which keeps bridge skills valuable only when they route cleanly and
   stay compact.
3. GitHub's new `gh skill` workflow further raises the value of portable,
   standards-clean skill directories.
4. Inference for this repo: the next highest-value move is still a bounded
   standards pass on the canonical `design-system` skill plus its
   `frontend-design-system` compatibility alias.
5. `langextract` remains a credible follow-up, but it already has scripts and
   evals, so the support-surface gap is less severe than the design-system pair.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `presentation-builder` closed after merged PR `#48`
2. Review PR `#49` for duplicate work, missing improvements, or
   standardization gaps on `design-system`
3. If the review is clean and scope remains satisfied, proceed to merge path
4. Only after merge, reset the queue to the next bounded warning leader
5. Revisit `skill-autoresearch` only after a review-clean, eval-backed target
   still shows measured failures

This order is locked because:

- `presentation-builder` is now merged, so the loop can safely advance without
  leaving open-PR debt behind.
- PR `#49` is already open, so skipping straight to another target would
  create duplicate work and break the recurring loop contract.
- `design-system` now has the support surface it was missing, so the next
  uncertainty is review quality, not local packaging debt.
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
| `presentation-builder` | High | Not yet | No | No | Added | Added | Keep closed after merged PR `#48`; only reopen if review feedback or failing evals appear |
| `design-system` | High | Not yet | No | No | Added | Added | Review PR `#49`; merge if clean, otherwise apply one bounded follow-up |
| `frontend-design-system` | High as alias support | Not yet | No | No | Points to canonical references | No separate eval package | Keep thin in PR `#49`; only reopen if review finds alias-specific drift |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review-clean target still misses objective checks |

## Packaging decision for the active lane

- Just-merged lane: `presentation-builder`
  - Assets: no
  - Scripts: no; the lane stayed bounded without them
  - References: added via `references/slides-grab-workflow.md`
  - Evals: added via `evals/evals.json`
  - Skill-autoresearch: still deferred until later measured misses appear
- Active lane: `design-system` + `frontend-design-system`
  - `design-system`
    - Assets: no
    - Scripts: no
    - References: added via `references/system-direction.md`
    - Evals: added via `evals/evals.json`
  - `frontend-design-system`
    - Assets: no
    - Scripts: no
    - References: no separate package; point at the canonical skill
    - Evals: no separate package while it remains an alias
  - Skill-autoresearch: not justified before the standards pass adds the
    missing packaging surface and a later review still shows measured misses

## Current state

- State: `design-system` standards lane is open for review
- PR: https://github.com/akillness/oh-my-gods/pull/49
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR review pass
- Stage: `pr-open`
