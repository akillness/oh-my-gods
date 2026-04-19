# Findings Format And Severity

Use this file when preparing the actual review output.

## Findings-first template

```text
Findings
- High — path/to/file.ext:123
  The change now does X under condition Y, which can cause Z.
  Missing evidence: test or proof for the failure path.

Open questions / assumptions
- Assumption about rollout or caller behavior that affects the verdict.

Change summary
- One or two lines on what the diff is trying to do.

Residual risk
- What remains uncertain even if there are no blocking findings.
```

## What makes a strong finding

A strong finding is:

- specific about the risky behavior
- tied to the changed code, not general best practice
- explicit about why the issue matters
- honest about the level of certainty

## When missing tests should block

Treat missing verification as blocking when:

- the diff changes auth, money, data integrity, or migration behavior
- the change alters control flow around retries, failures, or cleanup
- the PR claims a refactor but actually changes behavior
- the only evidence is manual confidence on a high-risk path

Treat missing verification as non-blocking follow-up when:

- the path is low-risk and easy to observe later
- existing tests already cover the important behavior indirectly
- the missing coverage is nice-to-have rather than disproving the review verdict

## Writing residual-risk notes

Residual risk is where you record what is still unknown after review, such as:

- no performance measurement for a potentially hotter query path
- no staging evidence for a deployment-only code path
- no browser verification on a UI-only behavior change

Residual risk is not a substitute for a real blocking finding.
