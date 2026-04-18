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
- PR `#46` for the `langchain-bmad` standards lane is now open and ready for
  review. The review pass confirms the branch is bounded, the target skill
  validates cleanly, and the PR is mergeable with `mergeStateStatus: CLEAN`:
  https://github.com/akillness/oh-my-gods/pull/46
- Repo-wide validation on the current review branch sits at `0` errors and
  `26` warnings.
- `langchain-bmad` no longer belongs in the three-warning leaderboard; the
  remaining highest-warning skills are now `clawteam` and
  `presentation-builder`, each at `3` warnings.

## Survey refresh

The landscape signal remains stable after the review pass:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. LangChain and Deep Agents still reinforce packaged skills with deferred
   detail, which keeps bridge skills valuable only when they route cleanly and
   stay compact.
3. GitHub's new `gh skill` workflow further raises the value of portable,
   standards-clean skill directories.
4. Inference for this repo: `langchain-bmad` no longer needs another bounded
   content pass on this branch, so the correct move is to close the live lane
   and queue the next highest-leverage standards gap.
5. Among the remaining warning-cluster candidates, `clawteam` is the stronger
   post-merge survey target because it is central to multi-agent coordination
   and already has `references/`, `scripts/`, and `evals/`, which keeps the
   next pass smaller than reopening `presentation-builder`.

## Locked direction

Advance one bounded lane per run, in this order:

1. Merge PR `#46` for `langchain-bmad`
2. Start the next run with survey triage on `clawteam`
3. Keep `presentation-builder` queued behind `clawteam`
4. Revisit `skill-autoresearch` only after a review-clean, eval-backed target
   still shows measured failures

This order is locked because:

- `langchain-bmad` now has the intended compact entrypoint, references, and
  evals, and the review pass found no duplicate work or missing
  standardization gap worth another edit.
- Reopening `langchain-bmad` before merge would widen scope without new
  evidence.
- `clawteam` already has the supporting surfaces that make a small standards
  cleanup realistic in one bounded lane.
- `presentation-builder` is still a legitimate follow-up, but it lacks the
  same orchestration leverage in the current agent-skill landscape and does
  not yet beat `clawteam` on boundedness plus impact.

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
| `langchain-bmad` | High | No | No | No | Added | Added | Merge PR `#46`; do not reopen without new evidence |
| `clawteam` | High | Not yet | No | Existing script is enough | Existing references are enough | Existing evals are enough | Start the next run with survey triage and standards cleanup planning |
| `presentation-builder` | Medium | Not yet | No | No | Probably yes | Probably yes | Keep queued behind `clawteam` unless the survey changes priority |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review-clean target still misses objective checks |

## Packaging decision for the next queued lane

- Target skill after merge: `clawteam`
- Assets: no
- Scripts: no new scripts by default; existing `scripts/setup.sh` is already
  present
- References: no new references by default; existing reference coverage is
  already present
- Evals: no new evals by default; existing evals are already present
- Sections: standardize the entrypoint around `Instructions`, `Examples`, and
  `Best practices` before considering any optimization loop

## Current state

- State: `langchain-bmad` is review-clean and merge-ready on branch
  `chore/skill-loop-pr-open-20260418-r48`
- PR: https://github.com/akillness/oh-my-gods/pull/46
- Blocker: none
- Next owner: merge owner for PR `#46`, then survey owner for `clawteam`
- Stage: `merge`
