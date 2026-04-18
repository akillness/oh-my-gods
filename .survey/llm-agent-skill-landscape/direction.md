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
- `playwriter` is now the merge target because the recurring loop's preferred
  live-browser verification surface has already been repackaged into a compact
  standards lane with the missing support files and refreshed eval coverage.

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

1. Merge `playwriter` via PR `#55` if no new review feedback appears
2. Keep the lane closed after merge unless review feedback or measured failures
   reopen it
3. Select the next bounded lane from the survey lock on the next run
4. Revisit `skill-autoresearch` only after a merged, eval-backed target still
   shows measured failures

This order is locked because:

- PR `#54` is already merged, so keeping the loop on the `survey` lane would
  just repeat closed work.
- `playwriter` already received the narrow support-package repair that this run
  family locked in: compact entrypoint, explicit references, and refreshed
  evals.
- Starting a mutation loop before the merged package shows a measured failure
  would optimize the wrong layer.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `langextract` | Closed high-leverage lane | No | No | Existing script refreshed | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `marketing-automation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `agent-evaluation` | Medium-high | Not yet | No | No | Added | Added | Closed after PR `#53`; reopen only on review feedback or new measured failures |
| `survey` | Closed high-leverage lane | No | No | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `playwriter` | High | Not yet | No | No | Added install/session and MCP/security recovery references | Refreshed | Merge PR `#55`, then keep closed unless review feedback or measured failures reopen it |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Active lane: `playwriter`
  - Assets: no
  - Scripts: no
  - References: yes, install/session and MCP/security/recovery support files
    are now packaged outside the main entrypoint
  - Evals: yes, refreshed to check enabled-tab consent and recovery guidance
  - Skill-autoresearch: still deferred until the merged skill shows measured
    failures after the support package lands

## Current state

- State: `playwriter` standards lane reviewed clean and ready to merge
- PR: https://github.com/akillness/oh-my-gods/pull/55
- Blocker: none
- Next owner: nanoclaw_pd
- Stage: `merge`
