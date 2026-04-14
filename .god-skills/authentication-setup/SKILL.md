---
name: authentication-setup
description: >
  Design and implement authentication and authorization for web apps and APIs,
  including password login, sessions, JWTs, OAuth, MFA, and role or permission
  checks. Use when the user needs a login system, token or session management,
  social sign-in, auth migration, refresh-token flow, RBAC, or SSO. Triggers
  on: JWT auth, session auth, OAuth login, SSO, refresh token, MFA, RBAC,
  permission checks.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: authentication, authorization, security, jwt, oauth, rbac, session, sso, mfa
  version: "2.0"
---

# Authentication Setup

Authentication work is mostly boundary design: identity proof, session or token
issuance, permission checks, and the operational controls that keep secrets and
privileged actions safe. Keep this entrypoint compact, then pull the support
files only when framework boilerplate or security detail is needed.

## When to use this skill

- Add login, signup, logout, refresh-token, or current-user flows
- Choose between session auth, JWT auth, OAuth, SSO, or mixed auth models
- Add RBAC, permission checks, or admin-only boundaries
- Add MFA or step-up verification to an existing auth system
- Migrate an existing service from one auth model to another
- Review an auth implementation for obvious security and lifecycle gaps

Do not use this skill as the only source of truth for highly regulated identity
requirements or custom cryptography design. In those cases, pair it with the
project's security requirements and official vendor guidance.

## Instructions

### Step 1: Triage the auth shape before choosing an implementation

Capture the minimum facts first:

- app type: API, SPA plus API, server-rendered app, mobile backend, internal tool
- auth surface: email or password, magic link, session, JWT, OAuth, SSO, MFA
- storage and runtime: framework, database, cache, reverse proxy, deployment model
- trust boundary: user roles, privileged actions, tenant model, internal vs external users
- operational needs: token revocation, account recovery, audit trail, device/session management

If the user has not chosen an auth model yet, stop and classify the product
shape before writing code.

### Step 2: Choose the auth model deliberately

Pick the smallest model that matches the product:

| Model | Prefer when | Watch for |
|------|-------------|-----------|
| Session cookies | Server-rendered apps, admin tools, same-origin web apps | CSRF, cookie flags, shared session storage |
| JWT access plus refresh | APIs, SPAs, mobile clients, distributed services | token rotation, revocation, refresh storage, secret rotation |
| OAuth or SSO | Third-party identity, enterprise login, social sign-in | redirect validation, account linking, provider outage handling |
| Hybrid | Existing password login plus social or enterprise login | duplicate identities, upgrade path, privilege consistency |

State the tradeoff briefly before implementing. If a stateless token model is
not clearly required, do not default to JWT just because it is familiar.

### Step 3: Design identity, secret, and persistence boundaries

Lock these decisions before endpoint work:

- canonical user identity and unique identifiers
- password hashing or external identity-only mode
- refresh token or session persistence and revocation strategy
- secret storage via environment or secret manager, never in source
- audit fields such as verification state, last login, or MFA enrollment only when they matter

Minimum expectations:

- passwords use bcrypt or argon2
- access tokens are short-lived
- refresh tokens or sessions can be revoked
- privileged roles are stored and checked explicitly
- secrets and provider credentials stay outside the repo

Detailed implementation recipes live in `references/framework-recipes.md`.

### Step 4: Implement the core auth flows

Build only the flows the product actually needs:

1. registration or account bootstrap
2. login or provider callback
3. logout or revocation
4. refresh or session renewal
5. current-user or claims lookup
6. password reset or account recovery when requested

For every flow, make the boundary observable:

- validate inputs
- return consistent auth errors
- avoid leaking whether an account exists unless the product explicitly requires it
- persist or revoke refresh tokens or sessions deliberately
- keep token payloads minimal

### Step 5: Enforce authorization and operational defenses

Authentication proves identity. Authorization proves the caller can perform the
action.

Always cover:

- route or handler-level permission checks
- default-deny behavior for privileged actions
- rate limits on login, reset, and MFA verification
- secure cookie settings or token transport rules
- CORS or redirect allowlists where cross-origin flows exist
- logging and monitoring that avoid passwords, tokens, or secrets

Use `references/security-checklist.md` for the hardening and common-failure
checklist.

### Step 6: Verify the risky paths, not just the happy path

Minimum auth verification should include:

- successful login
- invalid credentials
- unauthorized access
- forbidden access for the wrong role
- expired or revoked refresh token or session
- logout or revocation behavior
- one recovery path if password reset or OAuth linking is in scope

When the user wants implementation, write or update the tests instead of
stopping at advice. If the repository already has an auth system, review the
current code before rewriting the model.

### Step 7: Pull support files only when needed

Use the support files instead of bloating this entrypoint:

- `references/framework-recipes.md` for schema, endpoint, Node/Python, and environment examples
- `references/security-checklist.md` for hardening rules, rollout checks, and common auth failures

## Output format

Expected response shape:

- `Auth surface`: selected model and why
- `Plan`: identity, storage, token or session, and permission decisions
- `Implementation`: files or modules to create or modify
- `Verification`: tests, manual checks, or review points
- `Gaps`: deferred risks, compliance items, or rollout concerns

## Examples

### Example 1: Add JWT auth to a Node API

Input:

```text
Add login, refresh-token, and admin-role protection to this Express API with PostgreSQL.
```

Output shape:

- chooses JWT access plus refresh only if the client shape justifies it
- includes password hashing and revocable refresh-token storage
- adds permission checks for admin routes
- verifies login, refresh, forbidden, and logout behavior

### Example 2: Prefer sessions for a server-rendered app

Input:

```text
Build secure auth for an internal admin dashboard with server-rendered pages and Redis available.
```

Output shape:

- prefers session cookies over JWTs
- includes secure cookie flags, CSRF protection, and Redis-backed session storage
- keeps auth scoped to admin access and auditability

### Example 3: Add social login to an existing product

Input:

```text
Add Google sign-in to this app without breaking the existing email/password accounts.
```

Output shape:

- covers provider callback validation and account-linking rules
- avoids duplicate identities or accidental privilege escalation
- explains what data to store from the provider and what to keep local

## Best practices

1. Choose the auth model from product shape, not from habit.
2. Keep access tokens short-lived and revocable state explicit.
3. Separate authentication from authorization in both code and reasoning.
4. Never log secrets, passwords, raw tokens, or reset links.
5. Add eval coverage before considering any `skill-autoresearch` loop on this skill.
6. Push framework boilerplate and security detail into references so the main skill stays reviewable.

## References

- Local: `references/framework-recipes.md`
- Local: `references/security-checklist.md`
- OWASP Authentication Cheat Sheet: https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html
- OAuth 2.0 Security Best Current Practice: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics
