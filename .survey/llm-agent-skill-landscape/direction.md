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
- Repo-wide validation on the active branch now sits at `0` errors and `29`
  warnings.
- `bmad-idea` is no longer in the warning leaderboard after the standards
  merge; the remaining leaders are the three-warning cluster:
  `clawteam`, `langchain-bmad`, and `presentation-builder`.
- Current ecosystem evidence now favors packaging `langchain-bmad` before the
  other two because it still lacks both progressive-disclosure support files
  and trigger-quality evals while sitting at the BMAD × LangChain bridge where
  current docs emphasize reusable skills most strongly.

## Survey refresh

The landscape still favors compact, packaged, reusable instruction surfaces,
and the leverage has shifted from the merged `bmad-idea` lane to the next
bridge skill that still has packaging debt:

1. Agent Skills still pushes progressive disclosure and eval-backed iteration.
2. Agent Skills best practices still warn against overly comprehensive
   entrypoints that load too much irrelevant detail.
3. LangChain's skill launch and Deep Agents docs both keep rewarding concise
   reusable packaging, which raises the payoff from cleaning up bridge skills
   that still inline everything.
4. GitHub's new `gh skill` command raises the importance of portable,
   standards-clean, provenance-friendly skill directories.
5. Current BMAD docs keep CIS as a distinct ideation and facilitation module,
   not a fallback for phase-routing work.
6. Inference for this repo: the highest-value bounded move is packaging
   `langchain-bmad` into a compact routed surface with references and evals
   before opening a new PR lane.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `opencontext` closed unless measured failures or review feedback reopen
   it
2. Keep `bmad` closed unless measured failures or review feedback reopen it
3. Keep `bmad-idea` closed unless measured failures or review feedback reopen
   it
4. Package `langchain-bmad` into a standards-clean PR-open lane
5. Only after that PR registration, review the branch for duplicate work,
   missing improvements, or standardization gaps
6. Revisit `skill-autoresearch` only after `langchain-bmad` is packaged,
   eval-backed, review-tested, and still shows measured failures

This order is locked because:

- `agent-configuration` is already packaged, reviewed cleanly, and merged, so
  reopening it immediately would be duplicate work.
- `agent-principles` plus `agent-development-principles` are already merged via
  PR `#41`, so reopening them immediately would be duplicate work.
- `opencontext`, `bmad`, and `bmad-idea` are now merged, so the next safe move
  is a bounded pass on the remaining highest-leverage sibling rather than
  reopening closed lanes.
- `langchain-bmad` sits at the intersection of BMAD routing and the newly
  emphasized LangChain skill ecosystem, but still ships as an inline monolith
  with no support files.
- `clawteam` already has references, evals, and a setup script, so its next
  pass is lower leverage than `langchain-bmad`.
- `presentation-builder` still needs packaging work too, but it is narrower
  and less central to the repo's current agent-skill landscape than the BMAD ×
  LangChain bridge.
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
| `bmad-idea` | High | Not yet | No | No | Added | Added | Keep closed after merge unless new evidence appears |
| `langchain-bmad` | High | Not yet | No | No | Yes | Yes | Package it into the next PR-open lane |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review cycle |

## Packaging decision for the active lane

- Target lane: `langchain-bmad`
- Assets: no
- Scripts: no new scripts by default; add only if a reusable deterministic
  helper is clearly missing
- References: yes; keep BMAD phase maps, setup, and framework routing behind
  progressive disclosure
- Evals: yes; add trigger-quality, route-selection, and boundary coverage
  before any mutation loop
- Sections: standardize the entrypoint around `When to use this skill`,
  `Instructions`, `Examples`, and `Best practices`

## Current state

- State: `langchain-bmad` is the selected next bounded lane after the
  `bmad-idea` merge and is being standardized on branch
  `chore/skill-loop-pr-open-20260418-r48`
- PR: not opened yet
- Blocker: none
- Next owner: current improvement owner, then PR-review owner after registration
- Stage: `improvement`
