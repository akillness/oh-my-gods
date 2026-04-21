# Platform Map

## settings

- Fetch the latest Vercel guideline command on each review pass when the task is
  an actual UI audit.
- Keep the main skill concise and move durable review structure into local
  references.
- Preserve exact file or pattern scope from the user instead of widening the
  review surface automatically.

## rules

- Keep `web-design-guidelines` as a broad UI audit surface, not an
  accessibility-only or frontend-implementation catch-all.
- Route accessibility-only remediation to `web-accessibility`.
- Route reusable component API architecture to `ui-component-patterns`.
- Route React or Next.js runtime/performance diagnosis to
  `react-best-practices`.
- Route browser/runtime validation to `playwriter` when a logged-in or
  stateful browser session matters.

## hooks

- Pre-review: fetch or refresh the latest Vercel guideline command.
- During review: map findings into categories such as accessibility, focus,
  forms, content handling, performance, and state/navigation.
- Post-review: present concise findings with file locations and recommended
  route-outs when the request is actually a neighboring-skill task.
