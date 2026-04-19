# Refactor Slice Playbook

Use this reference when the cleanup target is obvious but the safest slice is
not.

## Small-step sequence

1. Name the smell precisely
   - long function
   - duplicated branch
   - unstable parameter list
   - file with mixed responsibilities
   - repeated migration edits across many call sites
2. Protect current behavior
   - existing tests
   - typecheck or lint
   - snapshots or screenshots
   - logs or fixture output
   - manual sanity path when nothing else exists yet
3. Pick one structural move
   - extract helper
   - isolate shared logic
   - rename one boundary
   - split one module
   - introduce one adapter during a migration
4. Re-run the smallest useful proof immediately
5. Stop if the next step changes ownership of the task

## Prefer these moves first

- Delete duplication before adding abstractions
- Extract pure logic before touching side effects
- Rename boundaries only after behavior is already easier to see
- Split files at stable seams such as feature, domain, or adapter boundaries
- Keep codemod migrations mechanically consistent and easy to diff

## Scope guards

Do not widen a refactor lane into:

- architecture redesign
- query or schema redesign
- performance tuning without measurements
- root-cause debugging
- broad testing strategy debate

Route those to sibling skills when they become the main problem.

## Commit and diff guidance

- Keep each commit explainable in one sentence
- Separate behavior-lock additions from structural edits when practical
- Prefer diffs that another reviewer can compare side by side
- If a broad cleanup is unavoidable, stage it as multiple reviewable slices
