# API Documentation Publishing And Examples Guide

Use this guide when the docs need a repeatable structure, publishable examples,
or migration-ready notes.

## Minimal docs packet

For most API documentation tasks, produce:

1. overview or audience statement
2. auth prerequisites
3. first successful request
4. request and response examples
5. error behavior
6. operational notes
7. links or handoffs to deeper references

## Example quality checklist

Examples should be:

- runnable or nearly runnable
- consistent with the documented contract
- explicit about headers, params, and payload shape
- free of real secrets
- paired with at least one meaningful failure example when risk is high

Prefer `curl` as the default universal example. Add one SDK or language example
only when the audience clearly benefits.

## Operational notes to include

Document the behaviors developers depend on operationally:

- authentication headers and token placement
- pagination or cursor format
- rate limits and relevant headers
- retry rules and idempotency expectations
- webhook retries, signatures, and replay behavior
- timeout guidance when relevant
- deprecation windows and migration deadlines

## Publishing surfaces

### Docs portal or reference site

Use when the request mentions Swagger UI, Redoc, or a docs portal. Structure
the output so quickstart, reference, auth, webhook, and migration pages are
separate entrypoints instead of one monolithic page.

### Inline repo docs

Use when the repo needs markdown docs or README sections tied to a local source
of truth. Keep the examples current with the contract artifact.

### Release-linked updates

When the docs update is part of a release:

- call out what changed
- identify breakage risk
- link migration notes from the reference page when needed

## Common failure modes

- shipping docs without a quickstart
- examples that contradict the contract
- hiding breaking changes inside generic changelog copy
- documenting auth vaguely
- turning migration guidance into a full redesign discussion
