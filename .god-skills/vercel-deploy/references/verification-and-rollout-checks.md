# Verification And Rollout Checks

Use this reference when the request is about promotion, rollback, or deployment
verification on Vercel.

## Preview verification before promotion

Before promoting a preview deployment:

- confirm the exact preview deployment URL or deployment ID
- inspect deployment details
- check logs for recent errors
- run a minimal health or smoke check against the preview deployment
- verify env-sensitive behavior if preview and production variables differ

Useful command surface:

```bash
vercel inspect <deployment-url-or-id>
vercel logs <deployment-url-or-id> --limit 50
# Optional beta helpers when Vercel CLI and local tooling are available:
# - vercel curl requires Vercel CLI v48.8.0+
# - vercel httpstat requires Vercel CLI v48.9.0+ and local httpstat installed
vercel curl /api/health --deployment <deployment-url-or-id>
vercel httpstat / --deployment <deployment-url-or-id>
```

## Promote to production

Use Vercel's promote path for an already-tested preview deployment.

Typical flow:

```bash
vercel promote <deployment-url-or-id>
vercel promote status
```

For non-interactive automation, `--yes` may be appropriate, but only when the
target deployment is already verified.

Relevant docs:

- promote preview to production:
  https://vercel.com/docs/deployments/promote-preview-to-production
- CLI promote:
  https://vercel.com/docs/cli/promote

## Rollback

If the promoted deployment is unhealthy, use Vercel rollback instead of
inventing an ad hoc redeploy flow.

Typical commands:

```bash
# Fastest restore path: roll back to the previous production deployment
vercel rollback

# Explicit target path when you need a specific eligible deployment
vercel rollback <deployment-url-or-id>
vercel rollback status
```

After rollback:

- re-check recent production logs
- verify the production URL responds as expected
- note any env or domain drift that may have contributed to the issue

## Browser validation

If deployment verification depends on a logged-in browser, existing cookies, or
real rendered-state inspection, hand the browser phase to `playwriter` instead
of relying only on CLI output.
