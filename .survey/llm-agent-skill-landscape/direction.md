# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#39` through `#50` are merged, including the now-closed video lane:
  https://github.com/akillness/oh-my-gods/pull/50
- PR `#51` for the `langextract` standards lane is open:
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

1. Review PR `#51` for duplicate work, missing improvements, or standardization
   drift
2. Merge the `langextract` lane if review is clean
3. Move next to `marketing-automation` unless PR review exposes a blocker
4. Revisit `skill-autoresearch` only after a review-clean, eval-backed target
   still shows measured failures

This order is locked because:

- The active lane already has open-PR debt again, so widening now would repeat
  the same coordination failure the loop is meant to avoid.
- `langextract` already delivered the bounded package expected by the current
  skill landscape: a compact entrypoint, references, evals, and synced compact
  discovery metadata.
- `marketing-automation` remains a legitimate follow-up, but it does not
  outrank closing the active PR-review loop first.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `video-production` | Closed high-leverage lane | No | No | No | Added | Added | Keep closed unless later review feedback reopens it |
| `remotion-video-production` | Alias support lane | No | No | No | Points to canonical references | No separate package | Keep thin unless a distinct workflow appears |
| `langextract` | High | No | No | Existing script refreshed | Added | Refreshed | Review PR `#51`; do not mutate further unless review exposes a measured miss |
| `marketing-automation` | Medium-high | Not yet | No | No | Missing | Present | Hold as the next candidate after PR `#51` review/merge |
| `skill-standardization` | Medium | Not yet | No | Existing validator is enough | No | Already present | Keep as the audit surface |
| `skill-autoresearch` | Medium | Only after measured failures | No | No | Already present | Already present | Revisit after the next review-clean target still misses objective checks |

## Packaging decision for the active lane

- Active lane: `langextract`
  - Assets: no
  - Scripts: keep the helper and only bounded improvements
  - References: added via `references/grounding-and-providers.md` and
    `references/long-doc-workflows.md`
  - Evals: refreshed in `evals/evals.json`
  - Skill-autoresearch: still deferred unless review or later eval evidence
    exposes a measured gap

## Current state

- State: `langextract` standards lane is open for review
- PR: https://github.com/akillness/oh-my-gods/pull/51
- Blocker: none
- Next owner: next scheduled `nanoclaw_pd` PR-review pass for `langextract`
- Stage: `pr-open`
