# Setup And Tool Surfaces

Use this reference when the user needs installation, initialization, or surface
selection.

## Minimum setup

1. Install the CLI:
   - `npm install -g @aicontextlab/cli`
   - or `npx @aicontextlab/cli <command>`
2. Run `oc init` inside the repo you want to wire up.
3. Confirm the intended agent surfaces were refreshed.

From the OpenContext usage guide:

- `oc init` prepares the global context store on first run
- it refreshes this repo's `AGENTS.md`
- it writes user-level commands, skills, and MCP config for the selected tools
- it is safe to rerun when the integration surface needs to be refreshed

## Default storage

- Context root: `~/.opencontext/contexts`
- Database: `~/.opencontext/opencontext.db`

Override only when the user explicitly needs a different location:

```bash
export OPENCONTEXT_CONTEXTS_ROOT="/path/to/contexts"
export OPENCONTEXT_DB_PATH="/path/to/opencontext.db"
```

## Surface selection

- Desktop app: best for manual browsing, editing, and citation
- `oc ui`: lightweight browser UI for manual inspection without the desktop app
- Slash commands or packaged skills: best for common agent flows like load,
  search, create, and iterate
- CLI: best for deterministic management and troubleshooting
- MCP server: best when the agent must search or read contexts autonomously

## User-level integration notes

OpenContext wiring is user-level, not repo-local only. The usage guide calls
out user config under tool-specific directories such as:

- `~/.cursor/mcp.json`
- `~/.claude/mcp.json`
- `~/.codex/mcp.json`

That means setup problems are often in the user integration layer even when the
repo-level `AGENTS.md` was refreshed successfully.

## Safe verification

- Run a simple `oc folder ls --all` or `oc doc ls <folder>` check first
- Confirm the expected commands or skills exist on the intended agent surface
- Verify the repo `AGENTS.md` was refreshed if `oc init` was part of the job

## Sources

- https://0xranx.github.io/OpenContext/en/
- https://0xranx.github.io/OpenContext/en/usage/
