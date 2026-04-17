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
- PR `#45` for the `bmad-idea` standards lane is open as a draft:
  https://github.com/akillness/oh-my-gods/pull/45
- Repo-wide validation on the active branch now sits at `0` errors and `29`
  warnings.
- `bmad-idea` is no longer in the warning leaderboard after the standards pass;
  the remaining leaders are the three-warning cluster.
- Current ecosystem evidence still favors reviewing the bounded `bmad-idea`
  branch before touching the lower-leverage cluster because the BMAD routing
  and ideation boundary is now explicit but still needs one clean PR review
  pass.

## Survey refresh

The landscape still favors compact, packaged, reusable instruction surfaces,
and the leverage has shifted from packaging `bmad-idea` to reviewing that
bounded lane before opening the next one:

1. Agent Skills still pushes progressive disclosure and eval-backed iteration.
2. Agent Skills best practices still warn against overly comprehensive
   entrypoints that load too much irrelevant detail.
3. LangChain Deep Agents and GitHub Copilot both keep rewarding concise
   reusable skill packaging, which increases the payoff from cleaning up the
   remaining broad entrypoints.
4. Current BMAD docs keep CIS as a distinct ideation and facilitation module,
   not a fallback for phase-routing work.
5. Inference for this repo: the highest-value bounded move is now to review
   PR `#45` for duplicate work, missing standardization, or packaging drift
   before deciding whether the three-warning cluster needs the next lane.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `opencontext` closed unless measured failures or review feedback reopen
   it
2. Keep `bmad` closed unless measured failures or review feedback reopen it
3. Review draft PR `#45` for `bmad-idea` on the next run before opening the
   next workflow lane
4. Only after that review, choose whether the remaining three-warning cluster
   needs its own bounded pass
5. Revisit `skill-autoresearch` only after `bmad-idea` is review-clean,
   eval-backed, and still shows measured failures

This order is locked because:

- `agent-configuration` is already packaged, reviewed cleanly, and merged, so
  reopening it immediately would be duplicate work.
- `agent-principles` plus `agent-development-principles` are already merged via
  PR `#41`, so reopening them immediately would be duplicate work.
- `opencontext` and `bmad` are now merged, so the next safe move is a bounded
  pass on the remaining highest-warning sibling rather than reopening closed
  lanes.
- `bmad-idea` was the right ideation-first sibling to the standardized
  `bmad`, so PR `#45` now needs review instead of another fresh survey lane.
- The remaining three-warning skills are still lower leverage than completing
  the `bmad-idea` review cycle because widening now would leave the current
  branch unresolved.
- `skill-autoresearch` remains lower priority than standards cleanup and review
  until the target is compact, eval-backed, review-tested, and showing measured
  failures.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agent-workflow` | High | Not yet | No | No | Added | Added | Keep closed unless failures or review feedback reopen it |
| `agent-configuration` | High | Not yet | No | No | Yes | Yes, including conflict-set coverage | Keep closed unless failures appear |
| `agent-principles` | High | Not yet | No | No | Yes | Yes | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | High | Not yet | No | No | No | Yes | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | High | Not yet | No | No | Added | Added | Keep closed unless failing evals or review feedback reopen it |
| `bmad` | High | Not yet | No | Existing scripts were enough | Existing setup/reference files were enough | Added | Keep closed unless failures or review feedback reopen it |
| `bmad-idea` | High | Not yet | No | No | Added | Added | Review draft PR `#45` before choosing the next lane |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review cycle |

## Packaging decision for the next lane

- Target lane: PR review for `bmad-idea`
- Assets: no
- Scripts: no new scripts by default; add only if a reusable deterministic
  helper is clearly missing
- References: added; keep CIS workflow detail and routing guidance behind
  progressive disclosure
- Evals: added; keep trigger-quality and routing coverage before any mutation
  loop
- Sections: standardized; review for duplicate work or missing gaps before
  moving on

## Current state

- State: `bmad-idea` is standardized on branch
  `chore/skill-loop-pr-open-20260418-r47` and registered as draft PR `#45`
- PR: https://github.com/akillness/oh-my-gods/pull/45
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR-review pass
- Stage: `pr-open`
