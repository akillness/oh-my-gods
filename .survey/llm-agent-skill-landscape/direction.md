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
- Fresh validation on `main` still sits at `0` errors and `39` warnings.
- The `bmad` and `bmad-idea` pair remains the highest-warning unresolved lane.
- Current ecosystem evidence now favors a bounded `bmad` standards pass before
  touching `bmad-idea` because `bmad` is the repo’s core structured-delivery
  surface and still carries stale trigger wording and outdated discovery links.

## Survey refresh

The landscape still favors compact, packaged, reusable instruction surfaces,
and the leverage has now shifted from the persistent-memory lane to the core
BMAD routing surface:

1. Agent Skills still pushes progressive disclosure and eval-backed iteration.
2. Agent Skills best practices still warn against overly comprehensive
   entrypoints that load too much irrelevant detail.
3. Current BMAD docs split core phase-routing from the Creative Intelligence
   Suite module, which makes the repo’s `bmad` versus `bmad-idea` boundary
   sharper than before.
4. BMAD v6 messaging now emphasizes deterministic plan-build-verify flow,
   reusable agent artifacts, and clearer workflow gates.
5. Inference for this repo: the highest-value bounded move is to standardize
   `bmad` first, keep `bmad-idea` as the ideation-first sibling, and add eval
   coverage before any mutation loop.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `opencontext` closed unless measured failures or review feedback reopen
   it
2. Standardize `bmad` as the next workflow lane
3. Review the resulting PR on the next run before deciding whether `bmad-idea`
   needs its own pass
4. Revisit `skill-autoresearch` only after `bmad` is standardized, eval-backed,
   and still shows measured failures

This order is locked because:

- `agent-configuration` is already packaged, reviewed cleanly, and merged, so
  reopening it immediately would be duplicate work.
- `agent-principles` plus `agent-development-principles` are already merged via
  PR `#41`, so reopening them immediately would be duplicate work.
- `opencontext` is now merged, so the next safe move is a bounded pass on the
  remaining core workflow leader instead of reopening a closed lane.
- `bmad` is more central than `bmad-idea` to the repo’s structured delivery
  story and is easier to standardize without widening scope.
- `bmad-idea` remains the right sibling for ideation-first work, so touching
  both in one run would blur the boundary the survey just clarified.
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
| `bmad` | High | Not yet | No | Existing scripts are enough | Existing setup/reference files are enough | Add now | Standardize the entrypoint, sync discovery links, and add evals |
| `bmad-idea` | Medium | Not yet | No | No | Existing reference is enough for now | Not yet | Revisit only after the `bmad` PR review pass |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review cycle |

## Packaging decision for the active lane

- Target lane: `bmad`
- Assets: no
- Scripts: no new scripts; existing `scripts/` already cover setup, validation,
  and phase-gate review
- References: no new reference files; existing `SETUP.md`, `REFERENCE.md`, and
  `resources/` are enough
- Evals: yes; add trigger-quality and routing coverage before any mutation loop
- Sections: standardize the entrypoint so the main file becomes a compact
  routing surface instead of a loose doc dump

## Current state

- State: `bmad` is the active standards lane on branch
  `chore/skill-loop-pr-open-20260418-r45`
- Blocker: none
- Next owner: current `nanoclaw_pd` pass to finish the bounded `bmad` package,
  then next scheduled `nanoclaw_pd` PR review pass
- Stage: `improvement`
