# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#39` for `agent-workflow` is merged:
  https://github.com/akillness/oh-my-gods/pull/39
- PR `#40` for `agent-configuration` is merged:
  https://github.com/akillness/oh-my-gods/pull/40
- Repo-wide validation remains at `0` errors and `51` warnings.
- `agent-development-principles` and `agent-principles` are now the
  highest-leverage bounded next lane because they duplicate the same
  collaboration-principles job while both carrying packaging warnings.
- Review is clean on the merged configuration lane, so reopening it would be
  duplicate work.

## Survey refresh

The landscape still favors compact, packaged, reusable instruction surfaces,
and the leverage has now shifted from configuration packaging to duplicate-skill
consolidation:

1. Agent Skills still pushes progressive disclosure and eval-backed iteration.
2. Agent Skills best practices still warn against overly comprehensive
   entrypoints that load too much irrelevant detail.
3. Claude, Codex, Gemini, and Copilot all continue to reward concise,
   specialized reusable agent packages rather than overlapping peer defaults.
4. Inference for this repo: the next improvement should reduce catalog
   competition by canonicalizing the duplicate principles pair.

## Locked direction

Advance one bounded lane per run, in this order:

1. Canonicalize `agent-principles` plus `agent-development-principles`
2. Keep `agent-configuration` closed unless measured failures appear
3. Revisit `skill-autoresearch` only if measured failures appear on the
   packaged canonical skill

This order is locked because:

- `agent-workflow` is already merged, so reopening it now would be duplicate
  work.
- `agent-configuration` is already packaged, reviewed cleanly, and merged, so
  reopening it immediately would be duplicate work.
- `agent-development-principles` and `agent-principles` currently compete for
  the same trigger space, making canonicalization higher leverage than starting
  a fresh unrelated lane.
- `skill-autoresearch` remains lower priority than canonicalization and review
  until the target is compact, eval-backed, and showing measured failures.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agent-workflow` | High | Not yet | No | No | Added | Added | Keep closed unless failures or review feedback reopen it |
| `agent-configuration` | High | Not yet | No | No | Yes | Yes, including conflict-set coverage | Keep closed unless failures appear |
| `agent-principles` | High | Not yet | No | No | Yes | Yes | Make canonical and package references/evals |
| `agent-development-principles` | High | Not yet | No | No | No | Yes | Convert to compatibility alias |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review cycle |

## Packaging decision for this run

- Target lane: `agent-principles` plus `agent-development-principles`
- Assets: no
- Scripts: no
- References: yes for the canonical skill; move detailed principles guidance
  behind progressive disclosure
- Evals: yes for both skills; add canonical and alias-routing checks
- Sections: rewrite the canonical entrypoint with imperative triggering and
  standard sections, then narrow the duplicate into a compatibility alias

## Current state

- State: bounded principles canonicalization lane selected and in progress
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` improvement pass
- Stage: `improvement`
