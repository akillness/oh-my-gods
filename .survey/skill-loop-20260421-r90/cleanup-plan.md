# Cleanup Plan

## Target

- `web-design-guidelines`

## Why this lane is active now

- PR `#79` for `vercel-deploy` is already merged, so the recurring loop needs a
  fresh active lane rather than more work on a closed branch.
- `web-design-guidelines` is the highest-value remaining review skill with no
  packaged references or evals and an older broad-trigger entrypoint.

## Behavior to preserve

- Keep the skill as a broad UI audit surface based on the live Vercel guideline
  command.
- Keep the review output tied to concrete file locations.
- Keep the fetched guideline refresh as part of the workflow when doing actual
  audits.

## Bounded edits

1. Tighten the description and route-outs so the skill stops swallowing
   accessibility-only and implementation-heavy requests.
2. Add references that capture the durable review workflow, categories, and
   route decisions around the upstream Vercel command.
3. Add evals that protect the intended audit boundary and support-surface
   behavior.
4. Sync `SKILL.toon` to the new packaged lane.
5. Update the recurring survey lock to close `vercel-deploy` and mark
   `web-design-guidelines` as the active PR-open lane once registration is done.

## Explicit non-goals

- No new dependencies
- No new scripts unless the packaging work proves a script is necessary
- No assets unless a durable template is clearly needed
- No `skill-autoresearch` mutation loop on this run
- No browser automation unless later review specifically requires runtime
  validation
