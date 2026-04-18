# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#51` for `langextract` is merged:
  https://github.com/akillness/oh-my-gods/pull/51
- PR `#52` for `marketing-automation` is merged:
  https://github.com/akillness/oh-my-gods/pull/52
- PR `#53` for `agent-evaluation` is merged:
  https://github.com/akillness/oh-my-gods/pull/53
- Repo-wide validation currently sits at `0` errors and `8` warnings before the
  new lane edits.
- `survey` is now the next bounded lane because it drives this recurring loop,
  still has no `references/` package, and lacks an explicit evidence-recovery
  surface despite a landscape that increasingly rewards provenance-friendly
  skill packaging.

## Survey refresh

The landscape signal remains stable as of April 19, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. Anthropic, OpenAI Codex, LangChain, and GitHub continue to treat subagents,
   skills, hooks, and reusable automation as first-class workflow surfaces.
3. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, standards-clean skill directories with clearer provenance and
   update paths.
4. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills, especially where
   provenance, evidence quality, and reusable survey outputs shape downstream
   planning.
5. `survey` is therefore the right next lane after `agent-evaluation` merged,
   because it is used at the start of future lanes and still lacks the
   reference material needed to handle stale, weak, or blocked evidence cleanly.

## Locked direction

Advance one bounded lane per run, in this order:

1. Package `survey` into a compact standards lane with an evidence-recovery
   reference, refreshed evals, and refreshed compact discovery
2. Open a bounded PR for that lane once validation is clean
3. After the first review-clean pass, either make one bounded follow-up update
   or advance directly to merge
4. Revisit `skill-autoresearch` only after a merged, eval-backed target still
   shows measured failures

This order is locked because:

- PR `#52` is already merged, so keeping the loop on that lane would just
  repeat closed work.
- `survey` has a clear standards gap that is still narrow enough to fix in one
  reviewable PR: a compact entrypoint missing its evidence-recovery support
  file and the matching eval refresh.
- Starting a mutation loop before the support package exists would optimize the
  wrong layer.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `langextract` | Closed high-leverage lane | No | No | Existing script refreshed | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `marketing-automation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `agent-evaluation` | Medium-high | Not yet | No | No | Added | Added | Closed after PR `#53`; reopen only on review feedback or new measured failures |
| `survey` | High | Not yet | No | No | Add evidence-recovery reference | Refresh existing evals | Open the next bounded PR once validation is clean |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Active lane: `survey`
  - Assets: no
  - Scripts: no
  - References: yes, add an evidence-recovery ladder outside the main
    entrypoint
  - Evals: yes, refresh the existing suite to check evidence labeling and
    thin-evidence handling
  - Skill-autoresearch: still deferred until the merged skill shows measured
    failures after the support package lands

## Current state

- State: `survey` standards lane is in bounded improvement
- PR: pending this run
- Blocker: none
- Next owner: maintainer opening the next PR path
- Stage: `improvement`
