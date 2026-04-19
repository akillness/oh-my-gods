---
name: code-review
description: >
  Review diffs, pull requests, merge requests, and patch stacks for
  correctness, maintainability, security, performance risk, and missing test
  coverage. Use when the user wants to approve, block, or comment on a code
  change, assess review findings by severity, or decide whether a change needs
  deeper testing, debugging, or follow-up from a specialist skill. Triggers
  on: review this PR, inspect this diff, request changes, approve or block,
  code review checklist, what would you comment on, and pre-merge risk review.
allowed-tools: Read Grep Glob
metadata:
  tags: code-review, PR-review, diff-review, bug-finding, regression-risk, security-review, testing-adequacy
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Code Review

Code review is a judgment surface, not a generic style pass. Optimize for the
highest-signal findings: correctness bugs, behavioral regressions, trust-boundary
mistakes, performance risks, and missing verification.

## When to use this skill

- Review a pull request, diff, merge request, or patch stack before merge
- Decide whether a change should be approved, blocked, or sent back for fixes
- Identify the most important bugs, regressions, or missing tests in a change
- Turn vague "please review this" requests into a risk-ranked findings list
- Check whether the stated intent of a change matches what the diff actually does

Prefer a neighboring skill when the main job is not reviewing a concrete code change:

- `testing-strategies` for deciding validation policy before tests exist
- `debugging` for reproducing and isolating a known failure
- `security-best-practices` for broader hardening guidance without a concrete diff
- `performance-optimization` for measurement-led tuning work rather than review judgment

## Instructions

### Step 1: Establish review context

Start by pinning down:

- change intent: feature, bug fix, refactor, migration, dependency update, or rollout change
- blast radius: how many files or subsystems changed and whether critical paths moved
- verification evidence: tests, typecheck, lint, screenshots, or manual checks already provided
- risk class: auth, data integrity, billing, API compatibility, performance, or operational safety

If the request has no diff, patch, or code artifact to inspect, do not fake a review.
Route to a better-fit planning or analysis skill instead.

### Step 2: Look for findings before style comments

Prioritize this order:

1. correctness and regression risk
2. security and trust-boundary mistakes
3. data-loss or compatibility risk
4. missing or weak verification
5. maintainability issues that are likely to cause future bugs

Do not lead with formatting or naming unless the change is otherwise clean.

Read `references/review-priorities.md` when the diff is large or the important
findings are hard to rank.

### Step 3: Inspect the diff by failure mode

Check the change against these questions:

- Does the implementation actually satisfy the stated intent?
- Did control flow, error handling, or cleanup behavior change in a risky way?
- Are there hidden behavior changes at boundaries such as auth, persistence, API schemas, caching, concurrency, or background jobs?
- Did the change add new assumptions without validation, fallback handling, or migration support?
- Does the test evidence prove the risky paths, or only the happy path?

Prefer concrete evidence over generic checklists. A small focused finding beats
ten broad reminders.

### Step 4: Treat missing verification as a review issue

Review is not complete just because the code "looks fine."

- If the risky behavior is untested, say so explicitly
- Distinguish missing merge-blocking evidence from nice-to-have follow-up coverage
- Tie the missing test request to a concrete failure mode
- Route policy questions to `testing-strategies` and implementation work to the relevant testing skill

Read `references/findings-format-and-severity.md` when deciding whether to block
on missing tests or weaker evidence.

### Step 5: Produce a findings-first review

Expected response order:

1. `Findings` — ordered by severity, each with file/line references when possible
2. `Open questions / assumptions` — only if they materially affect correctness
3. `Change summary` — brief and secondary

Each finding should include:

- severity: critical, high, medium, or low
- what is wrong or risky
- why it matters in behavior, not only in style
- what evidence is missing or what change would address it

If there are no material findings, say so explicitly and still mention any residual
risk or verification gaps.

## Output format

Expected response shape:

- `Findings`: findings first, ordered by severity, with file/line references where possible
- `Open questions / assumptions`: only unresolved issues that affect the review verdict
- `Change summary`: brief recap of what the diff does
- `Residual risk`: anything not fully proven by available verification

## Examples

### Example 1: Review a risky auth change

Input:

```text
Review this PR that changes token refresh handling and session invalidation.
```

Expected shape:

- focuses on auth and session-boundary regressions before style
- checks whether failure and expiry paths are actually covered
- calls out merge-blocking findings before summaries

### Example 2: Review a broad refactor

Input:

```text
Please review this refactor before I merge it. I mostly want to know if there are regression risks or missing tests.
```

Expected shape:

- looks for behavior drift and hidden assumptions instead of naming-only feedback
- treats missing regression coverage as a real review finding when warranted
- keeps any summary short after the findings list

### Example 3: Route away when there is no diff

Input:

```text
Review this architecture direction for our checkout redesign.
```

Expected shape:

- notes that this is not a code review because no concrete change set exists
- routes to a planning, architecture, or design-analysis surface instead
- does not pretend to produce diff findings without evidence

## Best practices

- Start from the diff's real risk, not a canned checklist.
- Prefer a few concrete findings over a long list of weak comments.
- Treat missing test evidence as part of review quality.
- Keep findings behavior-focused and reference-backed.
- Add eval coverage before any `skill-autoresearch` loop on this skill.
- Move detailed heuristics into references so the entrypoint stays compact and triggerable.

## References

- Local: `references/review-priorities.md`
- Local: `references/findings-format-and-severity.md`
