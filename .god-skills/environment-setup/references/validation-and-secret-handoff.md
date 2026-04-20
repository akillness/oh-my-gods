# Validation and Secret Handoff

Use this reference when the user is blocked by missing variables, unsafe secret
sharing, or unclear startup validation.

## Validate once at startup

A strong env boundary usually has:

- one parser or settings object
- required-versus-optional fields declared in one place
- type coercion for numbers, booleans, URLs, lists, and enums
- a fail-fast startup error when required config is missing or malformed

Avoid reading raw env vars throughout the app with ad hoc defaults.

## Treat `.env.example` as the contract

`.env.example` should:

- document every required variable name
- include safe placeholders, not real secrets
- note which values are public, private, or runtime-only
- stay aligned with the validation schema

If a value is required at startup, it should appear in both the schema and the
example contract.

## Secret handoff model

Prefer this split:

- local development: fake or low-risk credentials in ignored local files
- CI and preview: platform-managed secrets or encrypted variables
- staging and production: runtime secret store or deployment platform config

Never recommend committing production secrets, passing them in docs chat logs,
or duplicating them across many checked-in files.

## Verification checks

Small useful checks:

- startup fails clearly when one required variable is removed
- CI validates the env contract before deployment
- preview and production use platform-managed secret injection
- `.env.example` matches the current validation schema

## External references

- Agent Skills specification: https://agentskills.io/specification
- Doppler env best practices: https://docs.doppler.com/docs/environment-variables
- Pydantic settings: https://docs.pydantic.dev/latest/concepts/pydantic_settings/
