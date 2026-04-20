---
name: user-guide-writing
description: >
  Write user-facing documentation for onboarding, tutorials, how-to guides,
  FAQs, help-center articles, release-facing help updates, and task-based
  support content. Use when the main job is helping end users or admins
  complete product tasks, recover from confusion, or learn a workflow through
  clear prerequisites, screenshot placeholders, and step-by-step guidance.
  Route internal specs, runbooks, and engineering-only docs to
  `technical-writing`; API reference and integration docs to
  `api-documentation`; release notes and version histories to
  `changelog-maintenance`.
allowed-tools: Read Write Grep Glob
metadata:
  tags: user-guides, tutorials, help-center, onboarding, faq, support-docs
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# User Guide Writing

User-guide writing is a task-completion lane for end users and admins. Keep the
main skill focused on helping someone complete a product task safely and
clearly instead of drifting into internal specs, API reference, or changelog
work.

Read `references/doc-surface-selection.md` when the first problem is choosing
between a getting-started guide, how-to, tutorial, FAQ, or troubleshooting
article. Read `references/steps-screenshots-and-troubleshooting.md` when the
workflow, screenshot placeholders, success checks, or recovery steps need more
structure.

## When to use this skill

- Write onboarding, getting-started, how-to, and tutorial content for end users
- Draft help-center articles, support docs, and product walkthroughs
- Update customer-facing guidance after UI or workflow changes
- Turn a support issue into a reusable troubleshooting or FAQ article
- Help admins complete operational product tasks through clear prerequisites and steps

## When not to use this skill

- The main document is an internal spec, ADR, migration plan, or engineer-facing runbook: use `technical-writing`
- The main deliverable is API reference, SDK docs, webhook docs, or integration setup: use `api-documentation`
- The main deliverable is release notes, patch notes, or semantic-version history: use `changelog-maintenance`
- The main job is contract design, auth architecture, or implementation planning rather than end-user guidance: route to the owning specialist skill

## Instructions

### Step 1: Choose the right user-doc shape first

Identify the primary user outcome before writing:

- getting started: first successful setup or first run
- how-to: one concrete task or admin action
- tutorial: guided learning flow with explanation plus practice
- FAQ: short answers to repeated questions
- troubleshooting: recover from a known failure or confusion point

If the request is really an internal implementation guide or release summary,
route it out before drafting the body.

### Step 2: Capture the user context that affects the steps

Document the minimum context:

- audience: end user, admin, support operator, or team lead
- goal: the exact task they must finish
- prerequisites: account state, permissions, environment, or required files
- starting point: page, menu, URL, or product area
- success condition: what the user should see or have when finished

Avoid mixing multiple task flows into one article unless the user explicitly
wants a hub or overview page.

### Step 3: Write the task path in action order

Prefer a simple, scannable structure:

1. short purpose statement
2. prerequisites or before-you-start section
3. numbered steps in the order the user performs them
4. screenshot placeholders or UI callouts where a visual cue matters
5. success check so the user knows they are done

Use screenshot placeholders like `[Screenshot: Billing settings page showing Export button]` when the image is needed but not available yet.

### Step 4: Add recovery and follow-through guidance

After the main path, include only the smallest useful support layer:

- troubleshooting for likely failure points
- FAQ entries for common confusion
- related docs for the next likely task
- support escalation path if self-serve recovery is insufficient

Do not turn the article into a full product spec or marketing page.

### Step 5: Keep route-outs explicit

- Route engineer-facing implementation details to `technical-writing`
- Route endpoint schemas, authentication headers, or SDK examples to `api-documentation`
- Route release note or version-history requests to `changelog-maintenance`
- Keep this skill on user success, task completion, and support clarity

## Output format

Expected response shape:

- `Audience and goal`: who the doc is for and what task it completes
- `Prerequisites`: permissions, setup, or required inputs
- `Steps`: numbered task flow with screenshot placeholders where needed
- `Success check`: how the user confirms completion
- `Troubleshooting or FAQ`: only the likely blockers
- `Related docs`: the next likely article or support path
- `Route-out`: sibling skill if the request belongs elsewhere

## Examples

### Example 1: Getting started guide

Input:

```text
Write a getting-started guide for new workspace admins setting up SSO for the
first time.
```

Expected shape:

- keeps the work on `user-guide-writing`
- establishes admin audience, prerequisites, and first-success outcome
- writes a numbered setup flow with success checks

### Example 2: Help-center task article

Input:

```text
Create a help-center article for exporting invoices from the billing page.
```

Expected shape:

- keeps the work on `user-guide-writing`
- focuses on one task path
- includes troubleshooting and screenshot placeholders only where they help

### Example 3: Route internal docs outward

Input:

```text
Write an internal migration guide for moving our jobs service from Redis queues
to Postgres-backed workers.
```

Expected shape:

- recognizes the request as engineer-facing implementation guidance
- routes to `technical-writing`
- does not keep `user-guide-writing` as the primary owner

### Example 4: Route API docs outward

Input:

```text
Document our webhook authentication headers and provide curl examples for
integrators.
```

Expected shape:

- recognizes API-consumer documentation as the primary job
- routes to `api-documentation`
- does not treat the task as a user-guide article

## Best practices

1. One article should solve one user goal cleanly.
2. Prefer task language and UI labels over internal architecture terms.
3. State prerequisites before the first click.
4. Use screenshot placeholders only where visuals materially reduce confusion.
5. End with the smallest useful troubleshooting and next-step guidance.
6. Add references and evals before any `skill-autoresearch` loop on this skill.

## References

- Local: `references/doc-surface-selection.md`
- Local: `references/steps-screenshots-and-troubleshooting.md`
- Google developer documentation style guide: https://developers.google.com/style
