# Cleanup Plan

## Target

- `vercel-deploy`

## Why this review pass exists

- PR `#79` is already open, so this run must perform the first post-PR review
  instead of starting a new packaging lane.
- Review found two bounded documentation issues in the new verification
  reference plus one condensed-surface drift in `SKILL.toon`.

## Behavior to preserve

- Keep `vercel-deploy` focused on Vercel-specific deployment operations.
- Keep the bundled claim-deployment helper as an optional lane, not the default
  deploy path.
- Keep `deployment-automation` as the route-out for provider-neutral CI/CD
  design.

## Bounded edits

1. Clarify preview verification so stable commands remain the default and beta
   helpers are clearly optional.
2. Clarify rollback guidance so both the fast previous-production rollback path
   and explicit targeted rollback path are documented correctly.
3. Sync `SKILL.toon` with the browser-verification route-outs already present
   in `SKILL.md`.
4. Update recurring survey state to mark this run as a PR-review follow-up.

## Explicit non-goals

- No new dependencies
- No new assets
- No new scripts
- No new eval lane or `skill-autoresearch` loop
- No merge until the bounded review fixes validate cleanly
