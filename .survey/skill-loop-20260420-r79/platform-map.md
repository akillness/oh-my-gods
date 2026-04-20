# Platform Map

## Settings

- Keep the repo focused on portable skill packaging rather than host-specific
  branching logic

## Rules

- One bounded lane per run
- Do not reopen merged lanes without new evidence
- Use `skill-autoresearch` only when a packaged lane still shows measured
  failures

## Hooks

- Re-run repo validation and per-skill validation on PR review runs
- Sync the recurring-loop lock immediately after the branch moves from `pr-open`
  to merge or merged state
