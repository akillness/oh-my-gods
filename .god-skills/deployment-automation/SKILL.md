---
name: deployment-automation
description: >
  Build, review, or harden deployment pipelines for applications and services.
  Use when the user needs CI/CD setup, Docker or container packaging, GitHub
  Actions deployment workflows, Kubernetes or server rollout guidance, preview
  or production environment promotion, rollback planning, or zero-downtime
  release strategy. Triggers on: deploy pipeline, CI/CD, Dockerize app,
  GitHub Actions deploy, Kubernetes deploy, release workflow, rollout plan,
  rollback plan, blue-green deployment, canary release.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: deployment, ci-cd, docker, kubernetes, github-actions, rollout
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Deployment Automation

Deployment automation is a release-system skill, not just a bundle of vendor
snippets. Keep the entrypoint focused on artifact choice, environment
promotion, and rollback safety, then load the support files only when the user
actually needs implementation patterns or checklists.

## When to use this skill

- Set up a deployment pipeline for a new app, service, or monorepo
- Replace manual release steps with CI/CD and repeatable promotion paths
- Choose between platform lanes such as Vercel, containers, Kubernetes, or a
  legacy VM or SSH deploy
- Add health checks, rollout gates, rollback steps, or zero-downtime strategy
- Review a brittle deployment workflow for security, reliability, or drift risk

Prefer a narrower sibling skill when the request is more specific than general
deployment automation:

- `vercel-deploy` for direct Vercel deployment execution
- `monitoring-observability` for alerting, dashboards, or post-release telemetry
- `system-environment-setup` for deeper environment or infra bootstrapping
- `security-best-practices` when the main problem is secret handling or trust
  boundaries rather than release flow design

## Instructions

### Step 1: Triage the release lane before proposing commands

Capture the minimum facts first:

- workload: static site, SSR frontend, API, worker, or multi-service system
- build artifact: static bundle, container image, or language-specific package
- hosting target: Vercel or Netlify, VM, Cloud Run or ECS style service,
  Kubernetes, or another fixed platform
- environments: preview, staging, production, and promotion rules
- risk shape: migrations, background jobs, long-lived connections, or strict
  uptime requirements
- rollback expectation: fast rollback, automated rollback, or manual recovery

If the artifact or hosting lane is still unclear, narrow that first instead of
writing a generic deployment stack.

### Step 2: Choose the smallest deployment surface that fits

Start with the least complex release lane that can safely ship the workload:

- platform deployment for frontend or simple web apps that fit Vercel or
  Netlify style hosting
- single container service when one image plus a registry-backed rollout is
  enough
- orchestrated deployment when the system truly needs Kubernetes or another
  scheduler for scaling, service discovery, or multiple release units
- legacy SSH or VM deploys only when infrastructure constraints already lock
  the team there

Do not default to Kubernetes or blue-green rollout when a simpler deployment
surface meets the requirement.

### Step 3: Design CI/CD around one build artifact and clear promotion

Keep the pipeline reviewable:

- build and test once per artifact
- publish immutable tags or versions rather than relying on `latest` alone
- separate preview, staging, and production behavior explicitly
- keep secrets in environment or secret stores, never inline in workflow files
- gate production deploys on checks that match the system risk
- make the rollback path visible before the first production run

### Step 4: Protect rollout and recovery

Before calling the plan done:

- require health checks and graceful shutdown for services
- order schema or data changes so rollback remains possible
- add approval or extra verification around destructive migrations
- use rolling, blue-green, or canary rollout only when the traffic and blast
  radius justify the extra complexity
- verify where logs, metrics, and alerts will be checked during rollout

### Step 5: Pull support files only when they add leverage

Load the smallest supporting reference that matches the request:

- `references/container-and-pipeline-patterns.md` for Docker packaging,
  registry tagging, and GitHub Actions examples
- `references/platform-rollout-patterns.md` for Kubernetes, Vercel or Netlify,
  and zero-downtime rollout choices
- `references/release-safety-checklist.md` for deployment readiness, rollback,
  and release-safety checks

## Examples

### Example 1: Containerized API deployment

Input:

```text
Set up CI/CD for our Node API so pushes to main run tests, build a container,
push to GHCR, and deploy to production with a rollback path.
```

Expected shape:

- confirms a container-service lane instead of jumping straight to Kubernetes
- uses one build artifact with immutable tags
- includes health checks, environment separation, and rollback notes
- pulls the container and pipeline reference only if concrete examples help

### Example 2: Platform choice for a web app

Input:

```text
We have a Next.js marketing site with preview environments. Should we use
Vercel, Cloud Run, or Kubernetes?
```

Expected shape:

- compares the smallest viable hosting surface first
- explains why Vercel or another platform lane may beat custom infra
- avoids recommending Kubernetes without a workload-driven reason

### Example 3: Review a risky workflow

Input:

```text
Review this deploy workflow. It SSHes into production, uses latest tags only,
and keeps secrets in the workflow YAML.
```

Expected shape:

- flags secrets handling and mutable-tag risk
- recommends safer promotion and rollback structure
- names the minimum changes needed before production use

## Best practices

- Choose workload, artifact, and hosting target before writing release commands
- Keep the first working rollout simpler than the final idealized platform
- Use immutable versions, health checks, and rollback notes as the default bar
- Treat production database or queue changes as part of deployment design, not
  an afterthought
- Keep detailed examples in references so the entrypoint stays compact and
  triggerable
- Prefer measured safety gates over cargo-cult complexity

## References

- `references/container-and-pipeline-patterns.md`
- `references/platform-rollout-patterns.md`
- `references/release-safety-checklist.md`
