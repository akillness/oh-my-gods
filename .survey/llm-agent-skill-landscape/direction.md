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
- Repo-wide validation on `main` remains at `0` errors and `39` warnings.
- The principles pair is now closed; reopening it would be duplicate work.
- `opencontext` was the strongest bounded next lane because it carried four
  packaging warnings while covering a high-leverage persistent-memory workflow
  shared across Claude, Codex, Gemini, and Cursor.
- The merged lane clears the `opencontext` warnings with a standards-clean
  entrypoint plus progressive-disclosure references and evals.

## Survey refresh

The landscape still favors compact, packaged, reusable instruction surfaces,
and the leverage has now shifted from the persistent-memory lane back to
bounded orchestration-skill triage:

1. Agent Skills still pushes progressive disclosure and eval-backed iteration.
2. Agent Skills best practices still warn against overly comprehensive
   entrypoints that load too much irrelevant detail.
3. Claude, Codex, Gemini, and Copilot continue to reward concise, specialized
   reusable agent packages rather than overlapping peer defaults.
4. Inference for this repo: after the `opencontext` merge, the next bounded
   improvement should start with a fresh survey between `bmad` and
   `bmad-idea` before touching either broader surface.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `opencontext` closed unless measured failures or review feedback reopen
   it
2. Run a bounded survey pass on `bmad` versus `bmad-idea` before editing
3. Prefer standards cleanup and trigger-quality repair over mutation loops
4. Revisit `skill-autoresearch` only after the next target is standardized,
   eval-backed, and still shows measured failures

This order is locked because:

- `agent-configuration` is already packaged, reviewed cleanly, and merged, so
  reopening it immediately would be duplicate work.
- `agent-principles` plus `agent-development-principles` are already merged via
  PR `#41`, so reopening them immediately would be duplicate work.
- `opencontext` is now merged, so the next safe move is to survey the remaining
  broad warning leaders instead of reopening a closed lane.
- `bmad` and `bmad-idea` remain broad enough that the next run should choose
  one before editing, not touch both.
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
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review cycle |

## Packaging decision for the completed lane

- Target lane: `opencontext`
- Assets: no
- Scripts: no; a deterministic helper still is not justified
- References: yes; added for setup, retrieval, and persistence details
- Evals: yes; added trigger-quality and routing coverage before any mutation
  loop
- Sections: completed; the entrypoint now has imperative triggering,
  instructions, examples, best practices, and references

## Current state

- State: `opencontext` is standardized and merged on `main` via PR `#43`
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` survey pass
- Stage: `merge`
