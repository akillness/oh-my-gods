---
name: web-design-guidelines
description: >
  Run a broad web UI review for pages, flows, or component surfaces using audit
  categories such as layout hierarchy, content clarity, CTA emphasis, visual
  consistency, interaction states, responsiveness basics, performance signals,
  and accessibility basics. Use when the user asks to review a UI, audit a
  page, critique UX polish, check interface quality before launch, or turn
  vague design-feedback requests into a structured audit packet. Triggers on:
  UI audit, design review, UX review, interface critique, polish review,
  landing-page review, dashboard review, usability review, visual consistency,
  CTA clarity.
allowed-tools: Read Write Grep Glob WebFetch
metadata:
  author: vercel
  version: "2.0.0"
  argument-hint: "<file-or-pattern>"
  tags: ui, review, web-interface, guidelines, vercel, design-audit, ux
  platforms: Claude, ChatGPT, Gemini, Codex
---

# Web Design Guidelines

This skill is a broad UI audit lane. It should review code or UI surfaces
against the current Vercel Web Interface Guidelines, then report concise,
actionable findings without collapsing into an accessibility-only or
implementation-heavy workflow.

## When to use this skill

- Review a page, flow, or component surface for UI polish and guideline
  compliance
- Audit a landing page, dashboard, form, or app surface before launch
- Turn vague feedback like "check this UI" or "audit this UX" into structured
  findings
- Check a bounded file set or pattern against the current Vercel Web Interface
  Guidelines

Route out when the request is narrower than a broad UI audit:

- `web-accessibility` for accessibility-first remediation or WCAG-specific
  implementation work
- `ui-component-patterns` for reusable component API design, slots, variants,
  and primitive extraction
- `react-best-practices` for React or Next.js runtime and performance diagnosis
- `playwriter` when validation requires a real logged-in or stateful browser
  session

## Instructions

### Step 1: Confirm the audit scope

Capture the minimum review target before loading files:

- file path, glob pattern, or bounded UI surface
- whether the user wants a broad UI audit or a narrower accessibility or
  runtime/browser check
- whether the target is code, a screenshot-driven review, or a rendered app
  surface

If the task is actually accessibility-only, component-API design, or runtime
browser validation, route out before doing a broad guideline audit.

### Step 2: Fetch the current Vercel guideline command

Always fetch the latest guideline command before reviewing:

```text
https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md
```

Use WebFetch to retrieve the rules and keep the local audit scaffold aligned
with the current upstream command.

### Step 3: Read only the relevant files

Analyze only the user-provided file or pattern:

- React, Vue, or Svelte components
- HTML templates
- CSS or SCSS files
- JavaScript or TypeScript files that own UI behavior

Do not widen the review scope unless the user explicitly asks for a broader
audit.

### Step 4: Review by category, not by random rule order

Apply the fetched rules using the local category scaffold:

- layout and hierarchy
- accessibility basics and semantics
- focus and interaction states
- forms and content handling
- motion and responsiveness basics
- performance-adjacent UI signals
- navigation, state reflection, and destructive-action safety

Use the support references when they add leverage:

- `references/review-workflow-and-route-outs.md`
- `references/vercel-guideline-categories.md`

### Step 5: Report concise findings with locations

Return findings with exact file references in concise review format.

Preferred shape:

```text
path/to/file.tsx:line - issue summary; recommended fix
```

Report the highest-signal issues first. If there are no findings, say so
explicitly and note any residual risk, such as runtime-only behavior not
verified from static code.

## Examples

### Example 1: Broad UI audit

Input:

```text
Review this landing page UI and tell me what feels off before launch:
src/app/page.tsx
```

Expected behavior:

- fetches the latest Vercel guideline command
- reviews only the provided page and directly related UI code if needed
- reports concise findings across layout, content, interaction, and basics-level
  accessibility

### Example 2: Accessibility-only task

Input:

```text
Audit this modal for keyboard traps and screen-reader issues.
```

Expected behavior:

- routes the task to `web-accessibility`
- does not keep the work in `web-design-guidelines` as the main lane

### Example 3: Stateful browser validation

Input:

```text
Check this deployed dashboard in my logged-in browser and tell me which states
are visually broken.
```

Expected behavior:

- routes the browser phase to `playwriter`
- does not pretend a static code review is enough for the runtime ask

## Best practices

- Fetch the latest upstream guideline command for every real audit
- Keep the skill broad enough for general UI review but not so broad that it
  swallows accessibility-only or implementation-heavy tasks
- Read only the requested file set to avoid low-signal repo-wide audits
- Group findings by signal and severity rather than dumping guideline text
- Call out when a suspected issue needs rendered-browser validation

## References

- `references/review-workflow-and-route-outs.md`
- `references/vercel-guideline-categories.md`
