# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#51` for `langextract` is merged:
  https://github.com/akillness/oh-my-gods/pull/51
- PR `#52` for `marketing-automation` is merged:
  https://github.com/akillness/oh-my-gods/pull/52
- PR `#53` for `agent-evaluation` is merged:
  https://github.com/akillness/oh-my-gods/pull/53
- PR `#54` for `survey` is merged:
  https://github.com/akillness/oh-my-gods/pull/54
- PR `#55` for `playwriter` is merged:
  https://github.com/akillness/oh-my-gods/pull/55
- PR `#56` for the React guidance lane is open:
  https://github.com/akillness/oh-my-gods/pull/56
- Repo-wide validation currently sits at `0` errors and `8` warnings before the
  new lane edits.
- The active bounded lane remains the React guidance duplicate, but the review
  follow-up is now applied: the alias no longer ships duplicate support
  content, and the public catalog matches the canonical/alias split.

## Survey refresh

The landscape signal remains stable as of April 19, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. Anthropic, OpenAI Codex, LangChain, and GitHub continue to treat subagents,
   skills, hooks, and reusable automation as first-class workflow surfaces.
3. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, standards-clean skill directories with clearer provenance and
   update paths.
4. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, standards-clean skill directories with clearer provenance and
   update paths.
5. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills, especially where
   duplicated near-peer skills can split triggers and drift out of sync.
6. `react-best-practices` is therefore the right next lane after `playwriter`
   merged, because it should own the default React/Next.js performance job
   while `vercel-react-best-practices` becomes a migration-safe alias instead
   of a second full copy.

## Locked direction

Advance one bounded lane per run, in this order:

1. Close `playwriter` after PR `#55` merged
2. Standardize the React guidance duplicate into a canonical skill plus a thin
   compatibility alias
3. Review PR `#56`; apply a bounded follow-up only if duplicate work or a
   standards gap remains
4. Merge PR `#56` if the review stays clean
5. Revisit `skill-autoresearch` only after a merged, eval-backed target still
   shows measured failures

This order is locked because:

- `playwriter` is already merged, so keeping the loop on that lane would just
  repeat closed work.
- The React guidance lane needed one review follow-up because the alias still
  carried duplicate support content and the README catalog still described it
  as a full methodology.
- Starting a mutation loop before the reviewed canonical/alias split lands
  would
  optimize the wrong layer.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `langextract` | Closed high-leverage lane | No | No | Existing script refreshed | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `marketing-automation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `agent-evaluation` | Medium-high | Not yet | No | No | Added | Added | Closed after PR `#53`; reopen only on review feedback or new measured failures |
| `survey` | Closed high-leverage lane | No | No | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `playwriter` | Closed high-leverage lane | No | No | Added install/session and MCP/security recovery references | Refreshed | Keep closed unless review feedback or measured failures reopen it |
| `react-best-practices` | High | Not yet | No | No | Reuse bundled `AGENTS.md` | Added | Merge PR `#56`, then keep closed unless feedback or measured failures reopen it |
| `vercel-react-best-practices` | High | Not yet | No | No | Point to canonical skill only | Added | Merge PR `#56`, then keep closed unless feedback or measured failures reopen it |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Active lane: `react-best-practices` / `vercel-react-best-practices`
  - Assets: no
  - Scripts: no
  - References: no alias-local support files; keep the detailed compiled
    guidance only in the canonical skill's bundled `AGENTS.md`
  - Evals: yes, add trigger-quality coverage for both the canonical skill and
    the compatibility alias
  - Skill-autoresearch: still deferred until the merged canonical/alias split
    shows measured failures after review

## Current state

- State: React guidance duplicate reviewed clean after a bounded follow-up; PR
  `#56` is merge-ready
- PR: https://github.com/akillness/oh-my-gods/pull/56
- Blocker: none
- Next owner: nanoclaw_pd merge path
- Stage: `merge`
