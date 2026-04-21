# Platform Map

## Settings

- Keep the skill narrow and Vercel-specific so it does not compete with
  provider-neutral deployment surfaces
- Prefer compact `SKILL.md` plus references for CLI, claim, and rollout checks
- Preserve the existing bundled `scripts/deploy.sh` as the claimable-deployment
  helper instead of inventing new execution code

## Rules

- Do not present claimable deployment as the only or default Vercel path
- Route generic CI/CD, Docker, Kubernetes, or rollout-strategy requests to
  `deployment-automation`
- Route provider-neutral environment bootstrap to `system-environment-setup`
- Add evals that prove the skill keeps Vercel-specific ownership and routes
  broader deployment design elsewhere

## Hooks

- Pre-run: confirm whether the request is linked-project Vercel operations,
  claimable deployment, or a broader deployment-design job
- Post-edit: validate frontmatter and repo skill compliance before opening the
  PR path
- Post-run: update the recurring lock with current state, blocker, next owner,
  and stage

## Platform Gaps

| Surface | Current gap | Bounded fix |
| --- | --- | --- |
| `vercel-deploy` | stale "no auth required" framing and weak route-outs | rewrite entrypoint around Vercel-specific operations and lane choice |
| `vercel-deploy` support files | no references and no evals | add Vercel flow references plus route and verification evals |
| recurring lock | still points at the merged retro lane | refresh lock to the new `vercel-deploy` improvement lane |
