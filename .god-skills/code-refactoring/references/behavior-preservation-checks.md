# Behavior Preservation Checks

Refactoring is only complete when the intended behavior is still proven.

## Minimum proof ladder

Choose the lightest proof that still covers the risk:

| Risk shape | Minimum useful proof |
| --- | --- |
| Pure logic or formatting boundary | unit tests, fixture output, typecheck |
| Persistence or service boundary | integration test or request/response verification |
| Public API or schema drift risk | contract check, schema validation, consumer proof |
| Browser or user-facing flow | targeted runtime or UI verification |
| High-risk auth, billing, or data path | focused regression coverage plus release-relevant checks |

## Questions to answer before cleanup

- What behavior must stay identical?
- Where is that behavior already proven?
- What evidence is missing right now?
- Which checks are merge blockers versus follow-up confidence work?

## Questions to answer after cleanup

- Did the protected path still pass?
- Did any new assumption appear without proof?
- Was any verification skipped because the task widened beyond refactoring?
- Does a sibling skill now need to own the next step?

## Warning signs

- "The refactor is obvious, so I skipped tests"
- "We can review for regressions later"
- "This cleanup also rewrites the contract, query shape, and state model"
- "The diff is huge, but each change is simple"

These are signals to shrink the slice or route the work differently.
