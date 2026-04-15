# Release Safety Checklist

Use this reference when the request needs a deployment checklist or production
safety review.

## Pre-deployment checklist

- tests for the changed release artifact pass
- environment variables and secrets are configured outside source control
- schema or data changes are ordered and reversible
- rollback path is documented for the release lane
- on-call or responsible owner knows where to watch logs and metrics

## Deployment checklist

- one immutable artifact is selected for rollout
- health checks are reachable before traffic shifts
- rollout command or platform action is explicit and repeatable
- deploy verification happens before old capacity is removed
- alerts or dashboards are open during the change window

## Post-deployment checklist

- service health endpoint responds as expected
- key metrics and logs look normal after rollout
- rollback window closes only after confidence is established
- deployment outcome is recorded in the team change log or release note

## Required safety rules

### Health check example

```typescript
app.get('/health', (_req, res) => {
  res.status(200).json({ status: 'ok' });
});
```

### Graceful shutdown example

```javascript
process.on('SIGTERM', async () => {
  await server.close();
  process.exit(0);
});
```

### Default rules

- do not commit secrets or private keys
- do not rely on mutable image tags alone for production rollback
- do not skip environment separation for preview, staging, and production
- do not run destructive migrations without an explicit recovery plan

## Review prompts

- What fails if the deploy half-succeeds?
- Can the previous version keep serving traffic during rollback?
- Which metrics prove the rollout is healthy?
- Which step requires manual approval because it is destructive or irreversible?
