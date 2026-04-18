# Evidence Recovery Ladder

Use this ladder when normal search or fetch paths are weak, stale, or blocked.

## Recovery order

1. Direct primary-page retrieval
2. Stable official substitution
3. Structured feed recovery
4. Browser-rendered retrieval
5. Indexed snippet recovery
6. Thin-evidence stop

## How to apply it

### 1. Direct primary-page retrieval

- Fetch the primary page directly before trusting a search snippet.
- Recover at least the page title, canonical or redirect target, a short
  description, and whether the claimed keyword is actually present.
- Label this evidence as `direct page retrieval`.

### 2. Stable official substitution

- If a deep blog URL drifts or returns `404`, prefer a stable official product,
  docs, or changelog page over a guessed replacement.
- Use this especially for workflow-intake evidence where the exact product page
  matters more than a stale article slug.

### 3. Structured feed recovery

- If the site exposes RSS, Atom, release feeds, or machine-readable changelogs,
  use them to recover canonical links, timestamps, and short summaries.
- Label this as `structured feed recovery`.

### 4. Browser-rendered retrieval

- Escalate to a rendered browser path only when direct fetches are incomplete,
  JavaScript-heavy, or blocked by anti-bot middleware.
- If browser validation is required in this repo, prefer the `playwriter`
  workflow over headless Playwright.
- Label this as `browser-rendered retrieval`.

### 5. Indexed snippet recovery

- Use search-result snippets only when the primary page cannot be recovered.
- Treat them as lower-confidence evidence and label them as `indexed snippet`
  or `browser-rendered indexed snippet`.
- Add a confidence note such as `high`, `medium`, or `low`.

### 6. Thin-evidence stop

- If recovery still fails, record the evidence gap and continue without
  overstating certainty.
- Do not inflate a weak snippet into a strong claim.

## Evidence labels

Use one of these exact labels in survey artifacts when evidence quality matters:

- `direct page retrieval`
- `structured feed recovery`
- `browser-rendered retrieval`
- `indexed snippet`
- `browser-rendered indexed snippet`
- `unverified prior knowledge`

## Guardrails

- Prefer current official docs, repos, and changelogs for platform claims.
- Distinguish vendor claims from observed user behavior.
- When evidence stays thin, say so explicitly instead of smoothing it over.
