# Platform Map

## Settings

- The activation surface remains the packaged skill plus its support files.
- The recurring loop lock must reflect live PR stage accurately so future runs
  choose the right bounded action.

## Rules

- Do not reopen `api-documentation` packaging work without new measured review
  feedback.
- Keep `skill-autoresearch` deferred until a review-clean packaged lane still
  shows objective misses.
- Move from review to merge once the lock and branch state agree.

## Hooks

- Pre-run: compare live PR state to the survey lock
- Review: fix only bounded drift or missing review feedback
- Post-run: record current state, blocker, next owner, and stage for the next
  scheduler cycle
