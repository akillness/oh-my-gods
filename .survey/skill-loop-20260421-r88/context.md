# Context

## Workflow Context

- The recurring loop has already closed recent planning and observability lanes,
  so the next pass should target a skill that still over-claims capability or
  lacks modern support packaging.
- `vercel-deploy` still presents itself as an instant no-auth deployment skill,
  even though current Vercel flows distinguish between linked-project CLI
  operations and claimable deployments for AI-generated projects.
- The repo already has a broader `deployment-automation` skill, so the Vercel
  lane should stay vendor-specific instead of drifting into generic CI/CD or
  platform-selection advice.

## Affected Users

- Maintainers who rely on the catalog description to know which skill should
  trigger for a Vercel-specific request
- Users asking for preview deploys, promotion, rollback, env sync, or domain
  assignment on an existing Vercel project
- Scheduler runs that need a bounded, reviewable lane instead of another
  generic deployment rewrite

## Current Workarounds

- Read the Vercel skill, then manually correct for the stale "no
  authentication required" framing
- Fall back to `deployment-automation` for requests that are actually
  Vercel-specific because the current boundary is weak
- Infer missing promote, rollback, and linked-project verification steps from
  Vercel docs rather than from the skill itself

## Adjacent Problems

- A deployment skill that over-promises a claimable one-shot flow can trigger
  in the wrong situations and hide the difference between preview deploy,
  production promote, and rollback
- Missing evals make it easy for future edits to collapse back into a generic
  "deploy my app" surface that competes with `deployment-automation`
- Missing references force Vercel-specific operating details back into the main
  `SKILL.md`, which hurts triggerability and progressive disclosure

## User Voices

- Claude Code docs emphasize keeping `SKILL.md` compact and loading detailed
  references only when needed: https://code.claude.com/docs/en/skills
- OpenAI's skill packaging guidance emphasizes bundled references, scripts, and
  progressive disclosure instead of oversized entrypoints:
  https://github.com/openai/skills/blob/main/skills/.system/skill-creator/SKILL.md
- Vercel docs now document separate claim-deployment, deploy-hook, preview
  promotion, and rollback paths:
  https://vercel.com/docs/deployments/claim-deployments
  https://vercel.com/docs/cli/deploy
  https://vercel.com/docs/deployments/promote-preview-to-production
