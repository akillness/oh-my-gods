# Local CI Parity and Hooks

Use this reference when the user needs repeatable quality checks, local guardrails,
or lightweight maintenance automation.

## Local parity pattern

Aim for one local command that mirrors the repo's main CI quality lane:

```text
check -> lint -> test -> typecheck -> build
```

Adjust the sequence to match the repo, but keep the mapping explicit.

## What belongs local vs CI

| Surface | Good local candidate | Keep in CI by default |
|---|---|---|
| Formatting / lint | Yes | Also in CI if the repo enforces it |
| Unit tests | Yes | Yes |
| Type checks / static analysis | Yes | Yes |
| Long integration tests | Sometimes | Usually yes |
| E2E / browser suites | Rarely | Usually yes |
| Publish / deploy | No | Explicit release path only |

## Hook policy

Use hooks for fast, deterministic checks:

- formatting or lint on changed files
- lightweight tests when they finish quickly
- generated-file consistency if the command is stable and cheap

Avoid heavy or risky defaults:

- full integration suites in pre-commit
- cleanup commands that delete caches or build output implicitly
- publish, deploy, or migration commands
- commands that depend on secrets, VPN access, or production credentials

## Maintenance routines

Good candidates for explicit automation:

- dependency update dry-runs
- stale artifact cleanup
- local docs or schema generation
- release-prep summaries

Keep them named and opt-in, for example:

```text
deps-check
clean-artifacts
generate-schema
release-prep
```

## GitHub Actions parity note

If the repo uses GitHub Actions, keep the local automation aligned with the main
workflow checks instead of inventing a different quality lane. GitHub's reusable
workflow guidance is a good fit when multiple repos need the same CI contract:
https://docs.github.com/en/actions/reference/workflows-and-actions/reusable-workflows
