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
- PR `#56` for the React guidance lane is merged:
  https://github.com/akillness/oh-my-gods/pull/56
- Repo-wide validation currently sits at `0` errors and `8` warnings before the
  new lane edits.
- The React guidance lane is now closed: the alias no longer ships duplicate
  support content, and the public catalog matches the canonical/alias split.

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
   automation or approval behavior can drift away from current platform docs.
6. `ralphmode` is therefore the right next lane after the React guidance merge,
   because it sits directly on the current approval, sandbox, and checkpoint
   surface for long-running agent loops and still lacks eval coverage.

## Locked direction

Advance one bounded lane per run, in this order:

1. Keep `playwriter` closed after PR `#55` merged
2. Keep the React guidance duplicate closed after PR `#56` merged
3. Standardize `ralphmode` so its trigger wording and safety guidance are
   measurable
4. Open a bounded PR for `ralphmode`
5. Revisit `skill-autoresearch` only after a merged, eval-backed target still
   shows measured failures

This order is locked because:

- `playwriter` and the React guidance lane are already merged, so keeping the
  loop on those lanes would just repeat closed work.
- The remaining highest-leverage warning now sits on `ralphmode`, which is
  tightly coupled to the ecosystem's current focus on repo-scoped autonomy,
  approvals, and checkpoint rules.
- Starting a mutation loop before `ralphmode` has explicit eval coverage would
  optimize the wrong layer.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `langextract` | Closed high-leverage lane | No | No | Existing script refreshed | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `marketing-automation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `agent-evaluation` | Medium-high | Not yet | No | No | Added | Added | Closed after PR `#53`; reopen only on review feedback or new measured failures |
| `survey` | Closed high-leverage lane | No | No | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `playwriter` | Closed high-leverage lane | No | No | Added install/session and MCP/security recovery references | Refreshed | Keep closed unless review feedback or measured failures reopen it |
| `react-best-practices` | Closed high-leverage lane | No | No | Reuse bundled `AGENTS.md` | Added | Keep closed unless review feedback or measured failures reopen it |
| `vercel-react-best-practices` | Closed high-leverage lane | No | No | Point to canonical skill only | Added | Keep closed unless review feedback or measured failures reopen it |
| `ralphmode` | High | Not yet | No | No | Existing permission profile reference is enough | Add now | Tighten trigger wording and add evals before any mutation loop |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Active lane: `ralphmode`
  - Assets: no
  - Scripts: no
  - References: keep the existing `references/permission-profiles.md`
  - Evals: yes, add trigger and safety-boundary coverage for repo mode,
    sandbox-only YOLO mode, and Codex checkpoint behavior
  - Skill-autoresearch: still deferred until `ralphmode` is standardized and a
    measured failure baseline exists

## Current state

- State: React guidance is closed after PR `#56` merged; `ralphmode` is the
  active bounded lane and is in PR review after a bounded follow-up synced the
  compact `SKILL.toon` discovery surface with the new trigger and checkpoint
  wording
- PR: https://github.com/akillness/oh-my-gods/pull/57
- Blocker: none
- Next owner: PR review path
- Stage: `pr-review`
