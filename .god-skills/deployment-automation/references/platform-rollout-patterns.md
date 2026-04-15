# Platform Rollout Patterns

Use this reference when the request is mostly about choosing a hosting surface
or rollout style.

## Platform chooser

| Situation | Default lane | Why |
| --- | --- | --- |
| Static site or standard Next.js app with previews | Vercel or Netlify | Fastest path to previews, env management, and production releases |
| One API or worker that fits a single image | Container service such as Cloud Run, ECS, or a managed VM path | Keeps runtime explicit without scheduler overhead |
| Multi-service system with scaling, service discovery, or per-service rollout needs | Kubernetes | Justifies orchestration complexity |
| Legacy app locked to existing servers | SSH or VM deploy | Respect infra constraints, but harden with health checks and rollback |

## Kubernetes baseline

Use Kubernetes only when scaling or operational boundaries justify it.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: myapp
          image: ghcr.io/org/myapp:sha-abc123
          ports:
            - containerPort: 3000
          readinessProbe:
            httpGet:
              path: /ready
              port: 3000
          livenessProbe:
            httpGet:
              path: /health
              port: 3000
```

Pair Kubernetes rollouts with:

- image tags that point to one reviewed artifact
- explicit readiness and liveness checks
- rollout status verification and rollback command paths
- monitoring during and after rollout

## Vercel Or Netlify lane

For frontend-heavy deployments:

- prefer built-in preview environments for branch validation
- keep framework secrets in platform env management
- use custom infrastructure only when the app needs network, runtime, or
  compliance controls the platform cannot meet
- route direct execution requests to `vercel-deploy` when the task is simply
  shipping the app rather than designing the release system

## Zero-downtime strategy chooser

| Strategy | Use when | Avoid when |
| --- | --- | --- |
| Rolling update | One service with healthy backward-compatible versions | The new version cannot run alongside the old one |
| Blue-green | You need a fast cutover and rollback window | Infra cost or config duplication is too high |
| Canary | You need controlled risk for high-traffic systems | Team lacks metrics or traffic-shaping discipline |

Choose the simplest rollout that protects the actual blast radius.
