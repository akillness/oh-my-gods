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
- Repo-wide validation currently sits at `0` errors and `8` warnings before the
  new lane edits.
- `playwriter` is now the next bounded lane because the recurring loop now
  explicitly prefers it for browser/runtime verification, but the skill still
  lacks a `references/` package for install, MCP, and recovery detail.

## Survey refresh

The landscape signal remains stable as of April 19, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. Anthropic, OpenAI Codex, LangChain, and GitHub continue to treat subagents,
   skills, hooks, and reusable automation as first-class workflow surfaces.
3. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, standards-clean skill directories with clearer provenance and
   update paths.
4. Playwriter's own primary docs now make enabled-tab consent, local relay
   boundaries, and session isolation more explicit than this repo's current
   skill packaging:
   https://github.com/remorses/playwriter
   https://www.mintlify.com/remorses/playwriter/resources/security
5. Competing existing-session browser surfaces keep making the same tradeoff
   legible: extension-backed reuse of the live browser state is valuable, but
   only if the trust boundary and recovery path stay explicit:
   https://github.com/microsoft/playwright-mcp
6. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills, especially where
   browser verification is now an explicit part of the recurring loop.
7. `playwriter` is therefore the right next lane after `survey` merged,
   because it is reused as the preferred live-browser verification surface but
   still has no support files for install, consent, MCP, and failure recovery.

## Locked direction

Advance one bounded lane per run, in this order:

1. Package `playwriter` into a compact standards lane with install/MCP/recovery
   references, refreshed evals, and refreshed compact discovery
2. Open a bounded PR for that lane once validation is clean
3. After the first review-clean pass, either make one bounded follow-up update
   or advance directly to merge
4. Revisit `skill-autoresearch` only after a merged, eval-backed target still
   shows measured failures

This order is locked because:

- PR `#54` is already merged, so keeping the loop on the `survey` lane would
  just repeat closed work.
- `playwriter` has a clear standards gap that is still narrow enough to fix in
  one reviewable PR: a workflow-critical entrypoint missing the support files
  that should carry install, consent, MCP, and recovery detail.
- Starting a mutation loop before the support package exists would optimize the
  wrong layer.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `langextract` | Closed high-leverage lane | No | No | Existing script refreshed | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `marketing-automation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `agent-evaluation` | Medium-high | Not yet | No | No | Added | Added | Closed after PR `#53`; reopen only on review feedback or new measured failures |
| `survey` | Closed high-leverage lane | No | No | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `playwriter` | High | Not yet | No | No | Add install/MCP/recovery references | Refresh existing evals | Open the next bounded PR once validation is clean |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Active lane: `playwriter`
  - Assets: no
  - Scripts: no
  - References: yes, add install/session and MCP/security/recovery support
    files outside the main entrypoint
  - Evals: yes, refresh the existing suite to check enabled-tab consent and
    recovery guidance
  - Skill-autoresearch: still deferred until the merged skill shows measured
    failures after the support package lands

## Current state

- State: `playwriter` standards lane in bounded improvement work
- PR: not opened yet
- Blocker: none
- Next owner: nanoclaw_pd
- Stage: `improvement`
