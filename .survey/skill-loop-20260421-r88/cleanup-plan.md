# Cleanup Plan

## Target

- `vercel-deploy`

## Why this lane

- `sprint-retrospective` is already merged on `origin/main`, so the recurring
  loop must move to the next bounded post-merge survey target.
- `vercel-deploy` still uses stale one-shot deployment framing, lacks route-out
  guidance to `deployment-automation`, and has no `references/` or
  `evals/evals.json` support package.

## Behavior to preserve

- The skill must keep owning direct Vercel deployment operations.
- It must continue to support the bundled `scripts/deploy.sh` claimable
  deployment helper.
- It must stay distinct from provider-neutral deployment design, CI/CD, and
  general environment setup.

## Bounded edits

1. Rewrite the skill front door around current Vercel-specific operations and
   route-outs.
2. Add only the references needed for claim, CLI, and verification flows.
3. Add evals that prove correct routing against `deployment-automation`.
4. Sync `SKILL.toon` to the new trigger surface.
5. Update recurring survey locks to move this lane into the current run state.

## Explicit non-goals

- No new dependencies
- No assets
- No new scripts beyond the existing deploy helper
- No `skill-autoresearch` mutation loop on this run
- No repo-wide deployment-skill rewrite beyond `vercel-deploy`
