---
name: vercel-deploy
description: >
  Handle Vercel-specific deployment operations for linked web or fullstack
  projects: preview deploys, production deploys, preview-to-production
  promotion, stable preview aliases, domain assignment, environment-variable
  sync, rollback checks, and claim-deployment handoff. Use when the request is
  specifically about deploying on Vercel, promoting a Vercel preview build,
  fixing Vercel env or domain workflow problems, or rolling back a Vercel
  deployment. Triggers on: Vercel deploy, Vercel preview URL, Vercel alias,
  vercel promote, Vercel domain, Vercel env, Vercel rollback, Vercel claim
  deployment.
allowed-tools: Bash Read Write Grep Glob
metadata:
  author: vercel
  version: "2.0.0"
  tags: deployment, vercel, preview, production, domains, rollback
  platforms: Claude, ChatGPT, Gemini, Codex
---

# Vercel Deploy

This skill owns Vercel-specific deployment execution. Keep it focused on the
hosting lane, not generic CI/CD design or provider-neutral rollout strategy.

## When to use this skill

- Create or inspect a Vercel preview deployment for a linked project
- Promote a tested preview deployment to production
- Diagnose Vercel environment-variable, domain, alias, or rollback workflow
  issues
- Use a claim-deployment flow for an AI-generated deployment that should be
  handed to a user's Vercel account
- Review whether a request is actually Vercel-specific before running commands

Prefer a narrower neighboring skill when the main job is not direct Vercel
operations:

- `deployment-automation` for provider-neutral CI/CD, container, Kubernetes, or
  rollout-strategy design
- `system-environment-setup` for broader machine or local environment setup
- `playwriter` or `agent-browser` for browser validation of a deployed site

## Instructions

### Step 1: Triage the Vercel lane before proposing commands

Confirm which Vercel path the user actually needs:

- linked-project CLI flow: deploy, inspect, env sync, domains, logs, promote,
  rollback
- claim-deployment flow: AI-generated deployment that will be transferred to a
  user's Vercel account
- broader release-design question: route out to `deployment-automation`

Capture the minimum facts first:

- project path or linked project name
- desired environment: preview or production
- whether the project is already linked to Vercel
- whether the ask is a fresh deploy, a promote, a rollback, or an env/domain
  fix
- whether browser verification is needed after deployment

### Step 2: Choose the smallest Vercel flow that fits

Use the correct execution surface instead of forcing every request into one
path:

- linked project deploys: use the Vercel CLI flow from
  `references/vercel-cli-and-claim-flows.md`
- preview-to-production promotion: use the promote and verification lane from
  `references/verification-and-rollout-checks.md`
- claimable deployment handoff: use the bundled `scripts/deploy.sh` helper when
  a runtime exposes the skill directory locally and the goal is to generate a
  preview plus claim URL
- deploy hooks: use only when the project already has an existing hook and the
  user wants hook-based triggering

Do not describe claim deployments as the default Vercel path. They are one
specific handoff flow.

### Step 3: Run Vercel operations with explicit verification

Keep the execution sequence reviewable:

- inspect or deploy the target environment explicitly
- check the resulting deployment URL or deployment ID
- verify logs or health before calling a preview ready
- promote only after the preview deployment is known good
- verify production again after promote or rollback

If the user needs browser/runtime verification, route to `playwriter` for
stateful browser checks rather than trying to fake that inside the skill.

### Step 4: Handle common operational gaps

When the request is not just "deploy":

- environment variables: sync or inspect preview vs production differences
- domains or aliases: confirm the target deployment and assigned domain before
  changing traffic
- rollback: use the Vercel rollback path instead of improvising a generic redeploy
- claim handoff: return the preview URL and claim URL clearly, and note that
  claim codes expire

### Step 5: Pull supporting files only when they add leverage

Load only the reference that matches the current ask:

- `references/vercel-cli-and-claim-flows.md` for linked-project deploys, claim
  handoff, domains, env sync, and deploy hooks
- `references/verification-and-rollout-checks.md` for preview verification,
  promotion, rollback, and post-deploy checks

Use the bundled script only when the claim-deployment lane is actually needed:

- `scripts/deploy.sh`

## Examples

### Example 1: Preview deployment

Input:

```text
Deploy this Next.js app to Vercel and give me the preview URL.
```

Expected behavior:

- confirms the project path and whether the repo is already linked
- uses the linked-project deploy lane or the claim-deployment helper
- returns the preview URL and the exact verification follow-up

### Example 2: Promote after testing

Input:

```text
This preview deployment looks good. Promote it to production on Vercel.
```

Expected behavior:

- treats this as a preview-to-production operation, not a fresh generic deploy
- verifies the preview target first
- promotes and then re-checks production health or logs

### Example 3: Generic deployment design question

Input:

```text
Help me design a CI/CD deployment pipeline for our app.
```

Expected behavior:

- routes out to `deployment-automation`
- does not keep the work in `vercel-deploy` unless the user makes Vercel the
  actual hosting target

## Best practices

- Choose linked-project CLI, claim-deployment, or promote lane before writing
  commands
- Keep Vercel-specific operations separate from general deployment strategy
- Verify preview state before promotion and verify production after promotion or
  rollback
- Treat domain, alias, and env changes as deployment-scope actions that need
  explicit confirmation of the target deployment
- Keep detailed command examples in references so the main entrypoint stays
  triggerable

## References

- `references/vercel-cli-and-claim-flows.md`
- `references/verification-and-rollout-checks.md`
