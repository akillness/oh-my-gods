# Review Workflow And Route-Outs

Use this reference when the skill is active and you need the durable review
workflow that sits around the live Vercel guideline command.

## Broad UI audit workflow

1. Confirm the exact file, pattern, or UI surface to review.
2. Fetch the latest Vercel Web Interface Guidelines command.
3. Read only the requested code or assets that directly control the target UI.
4. Apply the guidelines through category-level review rather than rule-dump
   order.
5. Return concise, location-specific findings with recommended fixes.
6. Note residual risk when a finding depends on rendered or logged-in behavior.

## When to keep the work here

Stay in `web-design-guidelines` when the user wants:

- a broad UI audit across hierarchy, copy clarity, responsiveness basics,
  interaction states, or general polish
- a landing page, dashboard, or app-surface review before launch
- a code-oriented guideline pass tied to specific files or a bounded pattern

## When to route out

- `web-accessibility`
  - use for WCAG-focused remediation, keyboard support, labels, ARIA, focus
    management, or screen-reader correctness as the primary task
- `ui-component-patterns`
  - use for reusable component APIs, variants, slots, controlled versus
    uncontrolled decisions, or design-system primitive extraction
- `react-best-practices`
  - use for React or Next.js runtime performance, bundle cost, hydration, or
    rerender diagnosis
- `playwriter`
  - use when the user needs rendered browser validation in an existing logged-in
    or stateful session

## Reporting shape

Preferred finding format:

```text
path/to/file.tsx:line - issue summary; recommended fix
```

If no findings are present, say that explicitly and mention whether the review
was static-only or whether runtime/browser behavior remains unverified.
