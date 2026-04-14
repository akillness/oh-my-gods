# agentation setup guide

Use this guide when `agentation` is the right workflow but the runtime is not
fully wired yet.

## Prerequisites

- React 18+ application where the toolbar can be mounted
- Node.js 18+
- A local browser-based development flow
- MCP-capable agent runtime if you want live watch mode

## 1. Install or start the local pieces

The skill already ships helper scripts:

```bash
bash scripts/setup-agentation-mcp.sh
bash scripts/verify-loop.sh
```

If you are configuring the server manually, the canonical server command is:

```bash
npx -y agentation-mcp server
```

## 2. Mount the React toolbar

Mount the `<Agentation />` component only in development. Keep production builds
clean.

Recommended rule:

```tsx
if (process.env.NODE_ENV === "development") {
  // mount <Agentation endpoint="http://localhost:4747" />
}
```

## 3. Verify the server before starting a watch loop

Run the pre-flight checks from the skill:

```bash
curl -sf http://localhost:4747/health
curl -sf http://localhost:4747/sessions
curl -sf http://localhost:4747/pending
```

Use MCP watch mode only if those checks pass and the toolbar session is visible.

## 4. Pick the runtime mode

- MCP watch loop:
  Use when the server is healthy and a mounted session is active.
- Copy-paste fallback:
  Use when the human pasted annotation markdown into chat and the MCP server is
  unavailable.
- Hook-injected mode:
  Use when the platform already injects pending annotations into prompt context.

## 5. Platform notes

- Claude Code:
  Register the MCP server in Claude settings and use the watch loop directly.
- Codex:
  Keep the MCP server available and drive the loop from developer instructions
  or surrounding orchestration.
- Gemini CLI:
  Use the same health checks, then rely on the Gemini hook pattern documented in
  the skill.
- OpenCode:
  Register the MCP server and use `/omg-annotate` or the equivalent instruction
  surface.

## 6. What success looks like

- The toolbar is visible only in development
- Health, sessions, and pending endpoints respond
- New annotations can be acknowledged and resolved
- `elementPath` or `reactComponents` is enough to locate the source code
- The agent can finish one end-to-end loop without falling back to manual REST
  polling when MCP is available

## 7. Common failure patterns

- `plan` phase:
  Stop and route back to `plannotator`; `agentation` belongs in `verify`.
- Missing session:
  The React toolbar is not mounted or not pointed at the correct endpoint.
- Empty pending queue:
  Keep the watch loop open or use copy-paste mode for one-off feedback.
- Production build contamination:
  Re-check the development-only gate for the toolbar mount.
