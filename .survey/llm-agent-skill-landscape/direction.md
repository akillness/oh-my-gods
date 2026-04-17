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
- PR `#43` for the `opencontext` standards lane is open:
  https://github.com/akillness/oh-my-gods/pull/43
- Repo-wide validation on `main` remains at `0` errors and `43` warnings.
- The principles pair is now closed; reopening it would be duplicate work.
- `opencontext` was the strongest bounded next lane because it carried four
  packaging warnings while covering a high-leverage persistent-memory workflow
  shared across Claude, Codex, Gemini, and Cursor.
- The open branch now clears the `opencontext` warnings with a standards-clean
  entrypoint plus progressive-disclosure references and evals.

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

1. Review and merge `opencontext` PR `#43` if the branch is clean
2. Keep the merged principles lane closed unless measured failures appear
3. Revisit `skill-autoresearch` only if measured failures appear on the
   packaged `opencontext` skill after review
4. Reconsider `bmad` or `bmad-idea` only after the narrower `opencontext` lane
   is merged

This order is locked because:

- `agent-configuration` is already packaged, reviewed cleanly, and merged, so
  reopening it immediately would be duplicate work.
- `agent-principles` plus `agent-development-principles` are already merged via
  PR `#41`, so reopening them immediately would be duplicate work.
- `opencontext` had the strongest remaining bounded warning profile while
  avoiding the much broader scope of `bmad` and `bmad-idea`.
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
| `opencontext` | High | Not yet | No | No | Added | Added | Review PR `#43`, merge if clean, and only then consider any mutation loop |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review cycle |

## Packaging decision for the current lane

- Target lane: `opencontext`
- Assets: no
- Scripts: no; a deterministic helper still is not justified
- References: yes; added for setup, retrieval, and persistence details
- Evals: yes; added trigger-quality and routing coverage before any mutation
  loop
- Sections: completed; the entrypoint now has imperative triggering,
  instructions, examples, best practices, and references

## Current state

- State: `opencontext` is standardized and open in PR `#43`
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR-review pass
- Stage: `pr-open`
