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
- Repo-wide validation on `main` now sits at `0` errors and `34` warnings.
- `bmad-idea` is now the highest-warning unresolved lane at `5`, followed by a
  smaller three-warning cluster.
- Current ecosystem evidence now favors a bounded `bmad-idea` standards pass
  before touching the lower-leverage cluster because the `bmad` merge sharpened
  the routing boundary between core BMAD delivery and CIS-style ideation.

## Survey refresh

The landscape still favors compact, packaged, reusable instruction surfaces,
and the leverage has now shifted from the core BMAD routing surface to its
creative sibling:

1. Agent Skills still pushes progressive disclosure and eval-backed iteration.
2. Agent Skills best practices still warn against overly comprehensive
   entrypoints that load too much irrelevant detail.
3. LangChain Deep Agents and GitHub Copilot both keep rewarding concise
   reusable skill packaging, which increases the payoff from cleaning up the
   remaining broad entrypoints.
4. Current BMAD docs keep CIS as a distinct ideation and facilitation module,
   not a fallback for phase-routing work.
5. Inference for this repo: the highest-value bounded move is now to
   standardize `bmad-idea`, keep it clearly ideation-first, and add eval
   coverage before any mutation loop.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `opencontext` closed unless measured failures or review feedback reopen
   it
2. Keep `bmad` closed unless measured failures or review feedback reopen it
3. Survey and then standardize `bmad-idea` as the next workflow lane
4. Review the resulting PR on the next run before deciding whether the
   remaining three-warning cluster needs its own pass
5. Revisit `skill-autoresearch` only after `bmad-idea` is standardized,
   eval-backed, and still shows measured failures

This order is locked because:

- `agent-configuration` is already packaged, reviewed cleanly, and merged, so
  reopening it immediately would be duplicate work.
- `agent-principles` plus `agent-development-principles` are already merged via
  PR `#41`, so reopening them immediately would be duplicate work.
- `opencontext` and `bmad` are now merged, so the next safe move is a bounded
  pass on the remaining highest-warning sibling rather than reopening closed
  lanes.
- `bmad-idea` remains the right ideation-first sibling to the standardized
  `bmad`, so cleaning it next reinforces the boundary instead of blurring it.
- The remaining three-warning skills are lower leverage than `bmad-idea`
  because they are smaller warning clusters and less central to the repo’s
  BMAD workflow story.
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
| `bmad-idea` | High | Not yet | No | No | Likely yes | Add now | Standardize the entrypoint, sharpen routing, and add evals |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review cycle |

## Packaging decision for the next lane

- Target lane: `bmad-idea`
- Assets: no
- Scripts: no new scripts by default; add only if a reusable deterministic
  helper is clearly missing
- References: likely yes; move CIS workflow detail and routing guidance behind
  progressive disclosure if the entrypoint stays too broad
- Evals: yes; add trigger-quality and routing coverage before any mutation loop
- Sections: standardize the entrypoint so the main file becomes a compact
  ideation-routing surface instead of a command catalog dump

## Current state

- State: `bmad` is standardized and merged on `main` via PR `#44`; the next
  run should start survey triage for `bmad-idea`
- PR: https://github.com/akillness/oh-my-gods/pull/44
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` survey pass
- Stage: `survey`
