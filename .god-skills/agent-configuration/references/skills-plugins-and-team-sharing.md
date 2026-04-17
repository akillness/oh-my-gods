# Skills Plugins And Team Sharing

Use the packaging surface that matches the job.

## Surface selection

- Skill: reusable guidance, routing logic, decision procedures
- Plugin or extension: packaged capabilities, commands, or agent definitions
- MCP: live connection to an external tool or service
- Project instruction file: repo-wide rules that should always be active

## When not to create a new surface

- Do not create a new skill when one repo-specific rule in `AGENTS.md` is
  enough.
- Do not add an MCP server when the task is purely local and the shell already
  solves it.
- Do not check in personal-only setup that the team cannot use safely.

## Team-sharing boundaries

Safe to share:

- stable repo rules
- documented team defaults
- packaged skills that do not embed secrets
- reproducible plugin or MCP setup instructions

Keep local:

- secrets, tokens, credentials, local paths
- machine-specific editor settings
- private integrations not meant for the team

## Why this matters

Recent agent tooling keeps pushing configuration into reusable packaged
surfaces: skills, subagents, extensions, and tool-server integrations. That
raises the value of explicit routing so a team does not accumulate the same
instruction in three places with different scopes.
