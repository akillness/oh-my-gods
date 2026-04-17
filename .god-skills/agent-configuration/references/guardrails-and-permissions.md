# Guardrails And Permissions

Treat safety configuration as a least-privilege exercise, not a convenience
shortcut.

## Default posture

- Allow common read, test, and lint flows narrowly
- Warn or block destructive commands explicitly
- Keep secrets and host-level privileges outside repo-shared defaults
- Review wildcard approvals carefully before recommending them

## High-risk patterns

Do not recommend these as normal defaults:

- unrestricted host execution
- blanket `sudo` approval
- destructive deletion patterns such as `rm -rf /`
- piped remote execution such as `curl ... | sh`
- trusting unknown MCP servers by default

## Safer approval patterns

- approve bounded read-only commands
- approve test or lint commands with narrow command shapes
- require a human checkpoint for publish, deploy, secret, or destructive flows
- keep secret-bearing config local rather than checked into the repo

## Verification checklist

- Does the approval pattern match the exact command family?
- Is the risky path denied or clearly escalated?
- Would a teammate inherit unsafe defaults by pulling the repo?
- Are there any secrets, personal paths, or host-only assumptions in the file?
