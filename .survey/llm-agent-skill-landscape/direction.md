# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#39` through `#50` are merged, including the now-closed video lane:
  https://github.com/akillness/oh-my-gods/pull/50
- PR `#51` for the `langextract` standards lane is merged:
  https://github.com/akillness/oh-my-gods/pull/51
- Repo-wide validation still sits at `80/80` passing skills.
- Total repo warnings dropped from `12` to `10` after the `langextract`
  standards pass.
- `langextract` is no longer one of the warning leaders; the remaining top
  unresolved warning count belongs to `marketing-automation` (`2`).

## Survey refresh

The landscape signal remains stable:

1. Agent Skills still rewards compact, discoverable, progressive-disclosure
   packaging over oversized inline entrypoints.
2. Deep Agents and adjacent skill systems still reinforce packaged skills with
   deferred detail, which keeps reference-backed cleanup higher leverage than
   broad rewrites.
3. GitHub's `gh skill` workflow still increases the value of portable,
   standards-clean skill directories.
4. Inference for this repo: moving from the closed video lane to the bounded
   `langextract` standards lane was the right next step because `langextract`
   had existing evals and a helper script, lacked a `references/` package, and
   could be cleared without widening scope.
5. `skill-autoresearch` still is not justified for `langextract`; the
   standards pass removed the objective validator failures first.

## Locked direction

Advance one bounded lane per run, in this order:

1. Start the `marketing-automation` standards lane as the next highest-warning
   bounded target
2. Keep the merged `langextract` lane closed unless later review feedback
   exposes a concrete miss
3. Revisit `skill-autoresearch` only after a review-clean, eval-backed target
   still shows measured failures

This order is locked because:

- PR `#51` is now merged, so keeping the loop parked on `langextract` would
  create stale work instead of closing risk.
- `langextract` already delivered the bounded package expected by the current
  skill landscape: a compact entrypoint, references, evals, synced compact
  discovery metadata, and a post-open review fix for provider guidance drift.
- `marketing-automation` now becomes the highest-value remaining warning leader
  that can be advanced as one bounded lane.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `video-production` | Closed high-leverage lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `remotion-video-production` | Alias support lane | No | No | No | Points to canonical references | No separate package | Keep thin unless a distinct workflow appears |
| `langextract` | High | No | No | Existing script refreshed | Added | Refreshed | Keep closed after PR `#51` merged; do not mutate further unless later review exposes a measured miss |
| `marketing-automation` | Medium-high | Not yet | No | No | Missing | Present | Start as the next candidate now that PR `#51` is merged |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review-clean target still misses objective checks |

## Packaging decision for the active lane

- Closed lane: `langextract`
  - Assets: no
  - Scripts: helper kept with review-aligned override wording
  - References: added via `references/grounding-and-providers.md` and
    `references/long-doc-workflows.md`
  - Evals: refreshed in `evals/evals.json`, including plugin-surface alignment
  - Skill-autoresearch: still deferred unless later eval evidence exposes a
    measured gap

## Current state

- State: `langextract` standards lane is merged and closed
- PR: https://github.com/akillness/oh-my-gods/pull/51
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` standards pass for
  `marketing-automation`
- Stage: `merge`
