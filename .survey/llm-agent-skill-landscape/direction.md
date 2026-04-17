# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#39` for `agent-workflow` is merged:
  https://github.com/akillness/oh-my-gods/pull/39
- PR `#40` for `agent-configuration` is open:
  https://github.com/akillness/oh-my-gods/pull/40
- Repo-wide validation remains at `0` errors and `51` warnings.
- `agent-configuration` is now the highest-leverage bounded next lane:
  `368` lines, `4` warnings, no `references/`, and no `evals/`.
- The next warning-heavy peers (`agent-development-principles`,
  `agent-principles`, `opencontext`) are lower leverage or less central to
  cross-platform day-to-day setup than `agent-configuration`.
- Review found and fixed one bounded follow-up gap on PR `#40`: overlap with
  `agent-workflow` at the discovery layer and missing conflict-set coverage for
  configuration-vs-workflow prompts.

## Survey refresh

The landscape still favors compact, packaged, reusable instruction surfaces,
but the leverage has shifted from workflow guidance to configuration guidance:

1. Agent Skills still pushes progressive disclosure and eval-backed iteration.
2. Claude Code still differentiates reusable instructions from isolated
   subagent execution.
3. Gemini CLI extensions still package prompts, MCP servers, and custom
   commands together.
4. OpenAI Codex still frames skills and team workflows as reusable learning
   surfaces.
5. Inference for this repo: the next improvement should help users choose
   between always-on project instructions, safety hooks/permissions, packaged
   skills, and shared team configuration.

## Locked direction

Advance one bounded lane per run, in this order:

1. Merge PR `#40`
2. Start the next queued standards lane on the next run
3. Revisit `skill-autoresearch` only if measured failures appear

This order is locked because:

- `agent-workflow` is already merged, so reopening it now would be duplicate
  work.
- `agent-configuration` is already packaged and now reviewed cleanly after one
  bounded follow-up fix, so the correct next step is merge rather than opening
  another lane from this branch.
- `skill-autoresearch` remains lower priority than packaging and review until
  the target is compact, eval-backed, and showing measured failures.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `agent-workflow` | High | Not yet | No | No | Added | Added | Keep closed unless failures or review feedback reopen it |
| `agent-configuration` | High | Not yet | No | No | Yes | Yes, including conflict-set coverage | Merge PR `#40` |
| `agent-development-principles` | Medium | Not yet | No | No | Likely | Maybe later | Keep queued |
| `agent-principles` | Medium | Not yet | No | No | Likely | Maybe later | Keep queued |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review cycle |

## Packaging decision for this run

- Target lane: `agent-configuration`
- Assets: no
- Scripts: no
- References: yes; package scope selection, guardrails, and team sharing behind
  progressive disclosure
- Evals: yes; add trigger and routing checks for the review pass
- Sections: rewrite the entrypoint with imperative triggering, missing standard
  sections, and explicit sibling routing

## Current state

- State: `agent-configuration` is packaged, reviewed, and merge-ready on `#40`
- Blocker: none
- Next owner: current `nanoclaw_pd` merge pass
- Stage: `merge`
