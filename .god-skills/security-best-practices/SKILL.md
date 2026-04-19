---
name: security-best-practices
description: >
  Design or review web-application and API hardening: headers/CSP/HTTPS,
  session and cookie safety, CSRF, abuse controls, validation and output
  encoding, secret handling, and verification handoffs. Use when the main job
  is deciding which security layer is missing, auditing whether current
  controls are enough, or turning vague OWASP/security requests into a
  concrete hardening brief before or alongside implementation. Not for product
  auth architecture, database schema design, or code-level vulnerability
  fixing.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: security, HTTPS, CSP, cookies, CSRF, rate-limiting, OWASP, hardening
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Security Best Practices

Security hardening is a review-and-design surface, not a generic pastebin of
middleware snippets. Keep the entrypoint focused on trust boundaries, missing
controls, rollout risk, and what should be verified next.

## When to use this skill

- Audit whether an application or API is missing core web-security controls
- Turn vague "secure this" or "OWASP review this" requests into a concrete
  hardening brief
- Review headers, cookies, CSRF, validation, rate limits, secret handling, or
  outbound-request boundaries before implementation or rollout
- Decide what security checks are merge blockers versus follow-up work
- Frame a practical web/app hardening plan without drifting into broad platform
  architecture work

Prefer a narrower sibling skill when the main problem is elsewhere:

- `authentication-setup` for login, sessions vs JWTs, OAuth, passkeys, or org
  auth design
- `database-schema-design` for storage-model and schema decisions
- `security-review` for deeper vulnerability auditing on concrete code
- `api-design` when the real job is contract/resource design, not hardening
- `backend-testing` or `testing-strategies` when the missing work is test
  implementation or validation policy rather than security design

## Instructions

### Step 1: Triage the trust boundary before naming controls

Capture the minimum facts first:

- surface: browser app, public API, internal admin tool, webhook, or mixed flow
- trust boundary: anonymous users, authenticated users, admins, third-party
  integrations, or internal operators
- failure cost: account takeover, data exposure, unauthorized actions, abuse,
  availability loss, or compliance exposure
- current controls: HTTPS, headers, auth/session model, validation,
  authorization, logging, or monitoring already in place
- deployment context: browser-only, SSR app, API gateway, reverse proxy, CDN,
  container, or serverless

Do not start from a canned OWASP checklist. Start from who can do what, where
untrusted input enters, and what a failure would cost.

### Step 2: Pick the smallest hardening lane that fits

Use the lightest lane that addresses the real gap:

- transport and browser policy lane:
  HTTPS, HSTS, CSP, framing, origin policy, cookie flags, and security headers
- input and output lane:
  validation, output encoding, file upload rules, SSRF guardrails, and safe
  outbound requests
- session and request-integrity lane:
  CSRF, session rotation, refresh handling, logout invalidation, and replay
  exposure
- abuse and operations lane:
  rate limits, brute-force resistance, secret storage, audit logging, and
  rollout checks

If multiple lanes are implicated, rank them by blast radius instead of treating
all controls as equally urgent.

### Step 3: Build a hardening brief, not a library tutorial

For each important risk, decide:

- what could go wrong
- which control or design change addresses it
- whether the fix belongs in headers/config, request handling, session logic,
  secrets/runtime, or monitoring
- what evidence would prove the control is actually in place
- what should block merge or release versus what can follow afterward

Do not answer with a giant code dump unless the user explicitly asks for
implementation examples.

### Step 4: Pull support files only when they add leverage

Load only the reference that matches the active gap:

- `references/web-hardening-checklist.md` for browser/API control families such
  as HTTPS, headers, cookies, validation, CSRF, abuse controls, and SSRF
- `references/verification-and-rollout.md` for merge blockers, release checks,
  secret handling, and evidence expectations

### Step 5: Route implementation and deeper review work correctly

After the hardening brief is clear:

- use `authentication-setup` when session, OAuth, token, or passkey architecture
  is still undecided
- use `security-review` when a concrete diff, repo, or exploit-focused audit is
  required
- use `backend-testing` or `testing-strategies` when the main gap is how to
  verify the control
- use implementation-focused skills only after the security boundary and
  acceptance criteria are explicit

## Output format

Expected response shape:

- `Risk summary`: highest-value trust boundaries and likely failures
- `Control plan`: which security layers need changes or confirmation
- `Verification`: what evidence should prove the controls before merge or release
- `Follow-on work`: which sibling skill should implement, test, or audit next
- `Deferred items`: what is intentionally not covered yet

## Examples

### Example 1: Harden a public API without drifting into auth architecture

Input:

```text
Review our public API surface. I want to know whether we are missing security
layers before we ship, especially headers, validation, CSRF, and abuse limits.
```

Expected shape:

- identifies trust boundaries and highest-risk control gaps first
- gives a prioritized hardening brief instead of a long boilerplate tutorial
- names what should be verified before release

### Example 2: Keep a vague OWASP request bounded

Input:

```text
Can you give me a security best-practices review for this web app?
```

Expected shape:

- asks for or infers the app surface and trust boundaries before prescribing
  controls
- organizes recommendations by control family and failure cost
- avoids pretending all OWASP items are equally urgent

### Example 3: Route out when the job is code-level vulnerability work

Input:

```text
Run a deep exploit-focused security audit on this repository and find concrete
vulnerabilities.
```

Expected shape:

- recognizes that a repo-level exploit hunt belongs in `security-review`
- preserves this skill for the hardening and control-selection layer
- does not pretend a generic checklist is equivalent to a code audit

## Best practices

- Start from trust boundaries and attack paths, not from a full OWASP dump.
- Prefer the smallest control set that meaningfully reduces the highest-risk
  failures.
- Treat secrets, sessions, request integrity, and abuse controls as separate
  lanes rather than one checklist item.
- Make verification explicit; "we configured it" is not the same as "we proved
  it."
- Add eval coverage before any `skill-autoresearch` loop on this skill.
- Keep dense examples and checklists in references so the entrypoint stays
  compact and triggerable.

## References

- Local: `references/web-hardening-checklist.md`
- Local: `references/verification-and-rollout.md`
- OWASP Cheat Sheet Series: https://cheatsheetseries.owasp.org/
