# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#51` for `langextract` is merged:
  https://github.com/akillness/oh-my-gods/pull/51
- PR `#52` for `marketing-automation` is merged:
  https://github.com/akillness/oh-my-gods/pull/52
- Repo-wide validation still sits at `80/80` passing skills before the new lane
  edits.
- `agent-evaluation` is now the next bounded lane because it is still a large
  inline skill with no `references/` package and no self-eval surface, even
  though current agent ecosystems increasingly reward compact main entrypoints
  plus reusable support files.

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
   packaging and boundary repair on workflow-critical skills, especially for
   evaluation and benchmark guidance, not starting mutation loops before the
   support files and eval surface exist.
5. `agent-evaluation` is therefore the right next lane after
   `marketing-automation` merged, because it is important to the current
   agent-quality landscape but still hides too much operational detail inline.

## Locked direction

Advance one bounded lane per run, in this order:

1. Package `agent-evaluation` into a compact standards lane with references,
   evals, and refreshed compact discovery
2. Open a bounded PR for that lane once validation is clean
3. Revisit `skill-autoresearch` only after a review-clean, eval-backed target
   still shows measured failures

This order is locked because:

- PR `#52` is already merged, so keeping the loop on that lane would just
  repeat closed work.
- `agent-evaluation` has a clear standards gap that is still narrow enough to
  fix in one reviewable PR: a compact entrypoint missing progressive-disclosure
  support files.
- Starting a mutation loop before the support package exists would optimize the
  wrong layer.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `langextract` | Closed high-leverage lane | No | No | Existing script refreshed | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `marketing-automation` | Closed medium-high lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `agent-evaluation` | Medium-high | Not yet | No | No | Needed | Needed | Package the standards surface, then open the PR |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit only after a review-clean target still misses objective checks |

## Packaging decision for the active lane

- Active lane: `agent-evaluation`
  - Assets: no
  - Scripts: no
  - References: yes, grader-selection and eval-ops detail should move out of
    the main entrypoint
  - Evals: yes, trigger and boundary checks are needed before any later
    mutation loop
  - Skill-autoresearch: deferred until the packaged skill survives PR review
    and still shows measured failures

## Current state

- State: `agent-evaluation` standards lane packaged and awaiting review
- PR: https://github.com/akillness/oh-my-gods/pull/53
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR review pass
- Stage: `PR-open`
