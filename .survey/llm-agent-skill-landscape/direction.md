# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#39` for `agent-workflow` is merged:
  https://github.com/akillness/oh-my-gods/pull/39
- PR `#40` for `agent-configuration` is merged:
  https://github.com/akillness/oh-my-gods/pull/40
- PR `#41` for the principles canonicalization lane is merged:
  https://github.com/akillness/oh-my-gods/pull/41
- Repo-wide validation remains at `0` errors and `43` warnings.
- The principles pair is now closed; reopening it would be duplicate work.
- `opencontext` is now the strongest bounded next lane because it still carries
  four packaging warnings while covering a high-leverage persistent-memory
  workflow shared across Claude, Codex, Gemini, and Cursor.

## Survey refresh

The landscape still favors compact, packaged, reusable instruction surfaces,
and the leverage has now shifted from duplicate-skill consolidation to the
persistent-memory lane:

1. Agent Skills still pushes progressive disclosure and eval-backed iteration.
2. Agent Skills best practices still warn against overly comprehensive
   entrypoints that load too much irrelevant detail.
3. Claude, Codex, Gemini, and Copilot continue to reward concise, specialized
   reusable agent packages rather than overlapping peer defaults.
4. Inference for this repo: after the principles merge, the next bounded
   improvement should package `opencontext` into a more standards-clean skill
   before touching broader BMAD surfaces.

## Locked direction

Advance one bounded lane per run, in this order:

1. Standardize `opencontext`
2. Keep the merged principles lane closed unless measured failures appear
3. Revisit `skill-autoresearch` only if measured failures appear on the
   packaged `opencontext` skill
4. Reconsider `bmad` or `bmad-idea` only after the narrower `opencontext` lane
   is complete

This order is locked because:

- `agent-configuration` is already packaged, reviewed cleanly, and merged, so
  reopening it immediately would be duplicate work.
- `agent-principles` plus `agent-development-principles` are already merged via
  PR `#41`, so reopening them immediately would be duplicate work.
- `opencontext` has the strongest remaining bounded warning profile while
  avoiding the much broader scope of `bmad` and `bmad-idea`.
- `skill-autoresearch` remains lower priority than standards cleanup and review
  until the target is compact, eval-backed, and showing measured failures.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agent-workflow` | High | Not yet | No | No | Added | Added | Keep closed unless failures or review feedback reopen it |
| `agent-configuration` | High | Not yet | No | No | Yes | Yes, including conflict-set coverage | Keep closed unless failures appear |
| `agent-principles` | High | Not yet | No | No | Yes | Yes | Keep closed unless measured failures or review feedback reopen it |
| `agent-development-principles` | High | Not yet | No | No | No | Yes | Keep closed as a compatibility alias unless routing failures appear |
| `opencontext` | High | Not yet | No | No | Likely | Yes | Standardize the entrypoint, then add support files only if they reduce ambiguity |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review cycle |

## Packaging decision for the next run

- Target lane: `opencontext`
- Assets: no
- Scripts: no by default; only add one if the same deterministic OpenContext
  helper keeps reappearing during validation
- References: likely yes; move detailed setup and provider-specific guidance
  behind progressive disclosure if the main file stays too broad
- Evals: yes; add trigger-quality and routing coverage before any mutation loop
- Sections: add the missing standards sections and tighten the description with
  imperative trigger phrasing

## Current state

- State: principles canonicalization lane merged via PR `#41`; `opencontext`
  is locked as the next bounded standards lane
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` improvement pass
- Stage: `merge`
