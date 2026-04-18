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
- PR `#49` for the `design-system` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/49
- PR `#50` for the duplicate video lane is now open:
  https://github.com/akillness/oh-my-gods/pull/50
- Repo-wide validation still sits at `80/80` passing skills, and total repo
  warnings dropped from `16` to `12` after the video-lane cleanup.
- `design-system` and `frontend-design-system` are now closed, and the
  duplicate video pair has been removed from the warning leaders. The
  remaining leading warnings are `langextract` and
  `marketing-automation`.

## Survey refresh

The landscape signal remains stable after the latest merge pass:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. LangChain and Deep Agents still reinforce packaged skills with deferred
   detail, which keeps bridge skills valuable only when they route cleanly and
   stay compact.
3. GitHub's `gh skill` workflow still raises the value of portable,
   standards-clean skill directories.
4. Inference for this repo: the bounded canonicalization pass on
   `video-production` plus `remotion-video-production` was the right next
   move, because the duplicate peer surface is now gone and the repo warning
   count dropped immediately.
5. `langextract` remains the strongest follow-up after PR `#50` review because
   it still leads the remaining warning queue and already ships scripts/evals
   that can support a bounded standards pass.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `presentation-builder`, `design-system`, and
   `frontend-design-system` closed after merged PRs `#48` and `#49`
2. Review PR `#50` for duplicate work, missing improvements, or alias drift
3. Merge the video lane if the review is clean
4. Move next to `langextract` unless PR review exposes a blocker
5. Revisit `skill-autoresearch` only after a review-clean, eval-backed target
   still shows measured failures

This order is locked because:

- PR `#49` is merged, so the queue can move without leaving open-PR debt
  behind.
- `video-production` and `remotion-video-production` still duplicate the same
  job-to-be-done, while neither has the progressive-disclosure support package
  now favored by the external landscape signal.
- `langextract` and `marketing-automation` remain legitimate follow-ups, but
  they do not outrank closing the duplicate-video pair first.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agent-workflow` | High | Not yet | No | No | Added | Added | Keep closed unless failures or review feedback reopen it |
| `agent-configuration` | High | Not yet | No | No | Yes | Yes, including conflict-set coverage | Keep closed unless failures appear |
| `agent-principles` | High | Not yet | No | No | Yes | Yes | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | High | Not yet | No | No | No | Yes | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | High | Not yet | No | No | Added | Added | Keep closed unless failing evals or review feedback reopen it |
| `bmad` | High | Not yet | No | Existing scripts were enough | Existing setup/reference files were enough | Added | Keep closed unless failures or review feedback reopen it |
| `bmad-idea` | High | Not yet | No | No | Added | Added | Keep closed unless new evidence appears |
| `langchain-bmad` | High | No | No | No | Added | Added | Keep closed after merged PR `#46`; do not reopen without new evidence |
| `clawteam` | High | No | No | Existing script is enough | Existing references are enough | Existing evals are enough | Keep closed after merged PR `#47`; do not reopen without new evidence |
| `presentation-builder` | High | No | No | No | Added | Added | Keep closed after merged PR `#48`; only reopen if review feedback or failing evals appear |
| `design-system` | High | No | No | No | Added | Added | Keep closed after merged PR `#49`; only reopen if review feedback or failing evals appear |
| `frontend-design-system` | High as alias support | No | No | No | Points to canonical references | No separate eval package | Keep closed as a thin alias unless routing drift appears |
| `video-production` | High | No; standards pass resolved the measured warnings | No | No | Added | Added | Review PR `#50` and merge if no duplicate work remains |
| `remotion-video-production` | High as alias candidate | No | No | No | Points to canonical references | No separate package while alias stays thin | Keep as a compatibility alias unless review proves distinct behavior |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review-clean target still misses objective checks |

## Packaging decision for the next lane

- Just-merged lane: `design-system` + `frontend-design-system`
  - `design-system`
    - Assets: no
    - Scripts: no
    - References: added via `references/system-direction.md`
    - Evals: added via `evals/evals.json`
    - Skill-autoresearch: still deferred until later measured misses appear
  - `frontend-design-system`
    - Assets: no
    - Scripts: no
    - References: no separate package; point at the canonical skill
    - Evals: no separate package while it remains an alias
    - Skill-autoresearch: still deferred unless alias-specific routing drift appears
- Current open lane: `video-production` + `remotion-video-production`
  - `video-production`
    - Assets: no
    - Scripts: no
    - References: added via `references/video-direction.md`
    - Evals: added via `evals/evals.json`
  - `remotion-video-production`
    - Assets: no
    - Scripts: no
    - References: no separate package while it stays an alias; point to the
      canonical skill
    - Evals: no separate package unless review proves a distinct workflow
  - Skill-autoresearch: not justified; the standards pass resolved the measured
    warning pattern without leaving objective misses

## Current state

- State: duplicate video lane merged after review and bounded follow-up
- PR: https://github.com/akillness/oh-my-gods/pull/50
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` survey/improvement pass for `langextract`
- Stage: `merge`
