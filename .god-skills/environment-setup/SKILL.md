---
name: environment-setup
description: >
  Organize application environment configuration: `.env` files, env
  precedence, typed env validation, secret handoff, framework-specific env
  rules, and config drift between local, staging, CI, and production. Use when
  the user needs help structuring environment variables, validating required
  config, separating public and private env values, or cleaning up env-file
  sprawl. Route broader machine, Docker, devcontainer, or toolchain setup to
  `system-environment-setup`.
allowed-tools: Read Write Edit Bash
metadata:
  tags: environment-setup, env, dotenv, config, secrets, validation, ci
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Environment Setup

Environment setup is a configuration-boundary job. Keep the main skill focused
on env ownership, precedence, validation, and safe secret handoff instead of
turning it into generic machine setup or deployment automation.

Read `references/env-precedence-and-visibility.md` when env-file layering,
public/private split, or framework visibility rules are the main risk. Read
`references/validation-and-secret-handoff.md` when the problem is required
variable validation, `.env.example` discipline, CI/prod secret injection, or
rotation handoff.

## When to use this skill

- Structure `.env`, `.env.local`, `.env.example`, CI, and production config
- Separate public, private, secret, and runtime-only environment values
- Add typed env validation and fail-fast startup checks
- Clean up config drift between local, staging, preview, CI, and production
- Decide what should live in env vars versus checked-in config files

## When not to use this skill

- The main task is machine bootstrap, runtime versions, Docker Compose, or devcontainers: use `system-environment-setup`
- The main task is authentication architecture rather than env distribution: use `authentication-setup`
- The main task is provider-neutral deployment rollout or promotion rules: use `deployment-automation`
- The main task is broader secret governance, hardening, or abuse controls: use `security-best-practices`

## Instructions

### Step 1: Map the env surface before choosing files

Capture the minimum boundary first:

- runtime surface: browser, server, worker, CLI, edge, or mixed
- environments: local, preview, CI, staging, production
- config classes: public, private, secret, runtime-only, or optional
- current failure: missing var, drift, secret leak risk, broken preview, or env-file sprawl
- framework/runtime rules: Next.js, Vite, Docker, Rails, FastAPI, or generic app

If the user is really blocked on local toolchains, containers, or machine
bootstrap, route to `system-environment-setup` before designing `.env` policy.

### Step 2: Define precedence and visibility explicitly

Choose the smallest clear layering model:

- checked-in defaults: `.env.example`, typed config docs, or non-secret constants
- developer-local overrides: `.env.local`, direnv, or shell exports
- CI/preview values: pipeline or provider-managed secrets
- production values: runtime or platform secret store

For each variable, decide:

- who can read it
- where it is injected
- whether it may ship to the client
- whether it must exist at boot time

Read `references/env-precedence-and-visibility.md` if the public/private split
or file precedence is unclear.

### Step 3: Validate required config early

Prefer one typed validation boundary at startup:

- parse env once
- coerce types once
- fail fast on missing or malformed required values
- keep derived config in code, not duplicated across many env files

Read `references/validation-and-secret-handoff.md` when deciding how to pair
`.env.example`, schema validation, CI checks, and production secret handoff.

### Step 4: Keep the boundary clean

- Route machine setup, Docker Compose, devcontainers, and runtime installs to `system-environment-setup`
- Route auth/session architecture to `authentication-setup` when env vars are not the real decision
- Route deployment promotion and release rollout to `deployment-automation`
- Route secret hardening or broad app security review to `security-best-practices`

Do not turn this skill into a generic infrastructure, auth, or deployment lane.

### Step 5: End with the smallest safe next check

Before finishing, state:

- the env ownership model
- precedence order and file/platform split
- required validation gate
- which values are public vs private vs secret
- the next smallest verification step, such as startup validation, CI check, or preview smoke test

## Output format

Expected response shape:

- `Env surface`: runtimes, environments, and current pain
- `Ownership model`: what lives in repo, local overrides, CI, and production
- `Visibility rules`: public vs private vs secret values
- `Validation gate`: how required config is checked and where it fails fast
- `Drift risks`: what commonly diverges across local, CI, and production
- `Next check`: the smallest verification or handoff step
- `Route-outs`: sibling skills that should own any broader follow-up

## Examples

### Example 1: Env-file sprawl cleanup

Input:

```text
We have `.env`, `.env.local`, `.env.staging`, provider secrets, and random
shell exports. Help me clean up the config model without breaking local or CI.
```

Expected shape:

- keeps the request on `environment-setup`
- defines precedence and ownership before suggesting files
- ends with validation and drift checks

### Example 2: Public vs private split

Input:

```text
Which values should stay server-only, which can go in `NEXT_PUBLIC_*`, and how
should I document them for the team?
```

Expected shape:

- keeps the request on `environment-setup`
- distinguishes visibility rules clearly
- names the documentation and validation boundary

### Example 3: Route machine setup outward

Input:

```text
My repo fails because Docker, Node, and Postgres versions are inconsistent
across laptops. Fix the developer setup.
```

Expected shape:

- recognizes the primary problem as machine or runtime setup
- routes to `system-environment-setup`
- keeps env-file policy as secondary

### Example 4: Route rollout outward

Input:

```text
I need a staging-to-production release process with preview deploys, health
checks, and rollback steps.
```

Expected shape:

- recognizes rollout automation as the main task
- routes to `deployment-automation`
- does not keep `environment-setup` as the primary owner

## Best practices

1. Document every required variable in one place.
2. Keep secrets out of checked-in env files.
3. Validate env once at startup rather than reading raw `process.env` everywhere.
4. Minimize the number of env layers and make precedence explicit.
5. Keep public and server-only variables clearly separated.
6. Add references and evals before any `skill-autoresearch` loop on this skill.

## References

- Local: `references/env-precedence-and-visibility.md`
- Local: `references/validation-and-secret-handoff.md`
- Twelve-Factor config: https://12factor.net/config
