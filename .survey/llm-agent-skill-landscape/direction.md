# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#50` for `video-production` is merged:
  https://github.com/akillness/oh-my-gods/pull/50
- PR `#51` for `langextract` is merged:
  https://github.com/akillness/oh-my-gods/pull/51
- PR `#52` for `marketing-automation` is now open:
  https://github.com/akillness/oh-my-gods/pull/52
- Repo-wide validation still sits at `80/80` passing skills.
- `marketing-automation` was the next bounded lane because it was still a broad
  catalog-style router with no `references/` package and no `evals/`.

## Survey refresh

The landscape signal remains stable as of April 18, 2026:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. Anthropic, OpenAI Codex, and GitHub continue to treat skills, subagents,
   hooks, and reusable automation as first-class surfaces rather than
   one-off prompt hacks.
3. GitHub's April 16, 2026 `gh skill` launch further raises the value of
   portable, standards-clean skill directories with clearer provenance and
   update paths.
4. Inference for this repo: the highest-leverage remaining work is still
   packaging and boundary repair on workflow-critical skills, not starting
   mutation loops before the support files and eval surface exist.
5. `marketing-automation` therefore became the right next lane after
   `langextract` merged, because it had a weak trigger boundary and missing
   progressive-disclosure support files but could still be fixed in one
   reviewable change set.

## Locked direction

Advance one bounded lane per run, in this order:

1. Review PR `#52` for `marketing-automation` and apply only review-driven,
   bounded fixes if needed
2. If PR `#52` is clean and merged, refresh the warning leaders and pick the
   next packaged standards lane
3. Revisit `skill-autoresearch` only after a review-clean, eval-backed target
   still shows measured failures

This order is locked because:

- PR `#52` now contains the packaging work needed to make
  `marketing-automation` reviewable.
- The lane now has the core support package that the current ecosystem rewards:
  a compact router entrypoint, focused references, evals, and refreshed compact
  discovery text.
- Starting another standards lane before the `marketing-automation` review pass
  would reintroduce parallel PR debt without improving decision quality.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `video-production` | Closed high-leverage lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `langextract` | Closed high-leverage lane | No | No | Existing script refreshed | Added | Refreshed | Keep closed unless later review feedback reopens it |
| `marketing-automation` | Medium-high | Not yet | No | No | Added on branch | Added on branch | Review PR `#52`, then merge or apply bounded review fixes |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review-clean target still misses objective checks |

## Packaging decision for the active lane

- Active lane: `marketing-automation`
  - Assets: no
  - Scripts: no
  - References: yes, added on branch for lane selection and measurement handoff
  - Evals: yes, added on branch for routing and boundary checks
  - Skill-autoresearch: deferred until the packaged skill survives PR review and
    still shows measured failures

## Current state

- State: `marketing-automation` standards lane packaged and awaiting review
- PR: https://github.com/akillness/oh-my-gods/pull/52
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR review pass
- Stage: `PR-open`
