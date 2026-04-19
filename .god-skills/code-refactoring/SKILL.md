---
name: code-refactoring
description: >
  Refactor code safely with a behavior-preserving workflow for decomposition,
  duplication removal, naming cleanup, module splits, and repeated API
  migrations. Use when the user wants to simplify a messy implementation,
  shrink an oversized function or component, make a diff more reviewable, or
  plan a codemod-style cleanup without changing intended behavior. Triggers on:
  refactor this, extract method, split this component, remove duplication,
  rename safely, clean up this code, behavior-preserving rewrite, and codemod
  or migration cleanup. Route root-cause diagnosis to `debugging`, review
  judgment to `code-review`, validation-program design to
  `testing-strategies`, and measurement-led tuning to
  `performance-optimization`.
allowed-tools: Read Write Edit Grep Glob
metadata:
  tags: refactoring, code-quality, duplication-removal, clean-code, naming,
    module-splits, behavior-preservation, codemod
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Code Refactoring

Refactoring is a behavior-preserving change surface, not a license to redesign
the system while cleanup is in flight. Keep the work scoped, reversible, and
backed by proof that behavior still holds.

## When to use this skill

- Simplify complex or duplicated code without changing intended behavior
- Break a large function, file, class, or component into smaller reviewable pieces
- Clean up naming, boundaries, or repeated logic before adding more features
- Plan or execute a repeated migration or codemod-style cleanup safely
- Reduce technical debt when the user wants a clearer implementation, not a new design

Prefer a neighboring skill when the main job is different:

- `debugging` for reproducing and isolating a failure or regression root cause
- `code-review` for reviewing an existing diff instead of performing the refactor
- `testing-strategies` for deciding validation policy before any test work exists
- `backend-testing` when the missing work is adding regression coverage
- `performance-optimization` for measurement-led latency, memory, or throughput tuning
- `api-design` or `database-schema-design` for contract or schema redesign
- `ui-component-patterns` or `state-management` for frontend architecture choices
- `codebase-search` when impact analysis or call-site tracing is still the first task

## Instructions

### Step 1: Triage the cleanup boundary before editing

Capture the minimum facts first:

- refactor shape: extraction, duplication removal, rename, file split, migration, or codemod
- protected behavior: tests, typecheck, lint, screenshots, logs, or user-visible invariants already in place
- blast radius: single function, module, feature slice, or cross-repo pattern
- risk class: auth, persistence, API compatibility, concurrency, performance, or operational safety
- requested outcome: simpler code, smaller diff, clearer ownership, or easier follow-on work

If the user really wants a redesign, policy decision, or defect investigation,
route before touching the code.

### Step 2: Lock behavior before structural cleanup

Do not treat "it should still work" as evidence.

- reuse existing tests and checks when they already cover the risky path
- add or request regression coverage when the behavior is not protected
- write a short cleanup plan before modifying code for larger cleanup or deslop work
- keep one smell-focused pass at a time instead of stacking unrelated rewrites

Read `references/behavior-preservation-checks.md` when the proof burden or
verification surface is unclear.

### Step 3: Choose the smallest refactor slice that changes the least behavior

Prefer the narrowest move that makes the next change easier:

- extract one helper, not three abstractions at once
- remove one duplicated branch or data shape before broad renames
- split one oversized file at a stable boundary instead of reorganizing the package
- keep old and new call paths easy to compare when doing repeated migrations

Favor deletion, reuse, and clearer boundaries over new frameworks or layers.

### Step 4: Apply the refactor in reversible steps

Use a consistent sequence:

1. isolate the target smell or repeated pattern
2. make the smallest structural change that addresses it
3. re-run the relevant checks immediately
4. stop if the next edit would widen scope into design or debugging work

Read `references/refactor-slice-playbook.md` for small-step patterns, commit
shaping, and common "do not widen the lane" guardrails.

### Step 5: Verify behavior and route follow-on work correctly

Before calling the refactor done:

- confirm the protected behavior still passes
- name any gaps that remain unproven
- separate "cleanup complete" from "system redesign still needed"
- route review, testing, debugging, or performance follow-up to the right sibling skill

Good refactoring output ends with a smaller, clearer diff plus explicit
verification, not a vague claim that the code is now "clean."

## Output format

Expected response shape:

- `Refactor target`: what smell, boundary, or duplicated logic is being changed
- `Behavior lock`: what evidence protects current behavior before and after edits
- `Refactor plan`: the smallest sequence of cleanup steps
- `Verification`: what checks prove the refactor stayed behavior-preserving
- `Follow-on work`: any sibling skill that should own the next task

## Examples

### Example 1: Shrink a large function without redesigning the feature

Input:

```text
Refactor this handler. It is 250 lines long and hard to review, but I do not
want behavior changes.
```

Expected shape:

- identifies the behavior lock before extraction work starts
- proposes a narrow sequence such as extraction, naming cleanup, and verification
- avoids turning the task into a broader architecture rewrite

### Example 2: Remove duplication before adding more features

Input:

```text
These two services duplicate the same validation and transformation logic.
Can you clean that up without changing the API behavior?
```

Expected shape:

- focuses on the duplicated logic and stable shared boundary
- keeps the refactor reversible and verification-backed
- does not drift into contract redesign unless the duplication exposes a real API design issue

### Example 3: Route away when the task is really review or debugging

Input:

```text
Review this refactor PR for regressions and tell me whether to merge it.
```

Expected shape:

- recognizes that reviewing a diff belongs in `code-review`
- preserves this skill for doing the cleanup work itself
- does not pretend refactoring and review are the same task

## Best practices

- Treat refactoring as behavior-preserving until proven otherwise.
- Keep the cleanup plan smaller than the user's frustration with the code.
- Lock behavior before changing structure when risky paths are not already protected.
- Prefer one smell-focused pass over stacked rewrites.
- Route design, testing, debugging, and performance work to sibling skills when they become the main job.
- Add eval coverage before any `skill-autoresearch` loop on this skill.
- Keep heavy examples and heuristics in references so the entrypoint stays compact and triggerable.

## References

- Local: `references/refactor-slice-playbook.md`
- Local: `references/behavior-preservation-checks.md`
- Refactoring catalog: https://refactoring.com/catalog/
