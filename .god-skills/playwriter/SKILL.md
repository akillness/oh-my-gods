---
name: playwriter
description: >
  Control the user's running Chrome browser via the Playwriter extension and
  MCP/CLI while preserving existing logins, cookies, extensions, and tab
  state. Use when the task needs authenticated or stateful browser automation,
  session-aware debugging, or agent control of an already-open browser, even if
  the user asks for Playwright, browser MCP, or login-dependent verification.
  Triggers on: playwriter, running browser, existing session, logged-in
  browser, browser MCP, authenticated flow, saved cookies, stateful browser
  automation.
license: MIT
compatibility: Requires Chrome browser + Playwriter Chrome extension (Web Store) + npm install -g playwriter. MCP integration works with Claude Desktop, Codex CLI, Gemini CLI. localhost:19988 WebSocket relay server.
metadata:
  version: 1.0.0
  source: remorses/playwriter
  tags: playwright, browser-automation, chrome-extension, mcp, authenticated, stateful, session
allowed-tools: Read Write Bash Grep Glob
---

# playwriter - Playwright Browser Automation for AI Agents

Playwriter connects AI agents to your **running Chrome browser** instead of spawning a new headless instance. Your existing logins, cookies, extensions, and tab state are all preserved.

## When to use this skill

- Automate sites that require login (Gmail, GitHub, internal tools) without re-authenticating
- Control your real browser tab with full Playwright API access
- Run stateful automation that spans multiple steps (shopping carts, multi-step forms)
- Use MCP integration for Claude Desktop / AI agent browser control
- Record browser sessions or debug with CDP inspection
- Remote browser automation via tunnels

**vs. agent-browser**: agent-browser spawns a fresh headless browser (isolated, CI-friendly). playwriter connects to your existing Chrome session (authenticated, stateful, with your extensions).

## Instructions

### Step 1: Confirm that playwriter is the right browser surface

- Use `playwriter` when the task depends on the user's current Chrome state: existing logins, cookies, extensions, or open tabs.
- Prefer `playwriter` over fresh-browser Playwright or headless verification when the workflow is authenticated or stateful.
- Route to `agent-browser` instead when the task needs an isolated headless session, CI-friendly verification, or disposable browser state.

### Step 2: Install and attach to the running browser

- Install the Playwriter Chrome extension, enable it on the specific tab you want to control, and confirm the icon turns green.
- Install the CLI with `npm install -g playwriter`, or use `npx playwriter@latest --help` for a no-install check.
- Expect the local relay on `localhost:19988` after the extension is active.
- Use [references/install-and-session-workflow.md](references/install-and-session-workflow.md) for the full install, session, quoting, and Observe -> Act -> Observe workflow.

### Step 3: Start with a session, then follow Observe -> Act -> Observe

Always begin with a session and re-observe after each action:

```bash
playwriter session new
playwriter -s 1 -e 'await page.goto("https://example.com")'
playwriter -s 1 -e 'await snapshot({ page })'
playwriter -s 1 -e 'await page.locator("aria-ref=e5").click()'
playwriter -s 1 -e 'await snapshot({ page })'
```

Use `snapshot({ page })` for element discovery and state checks. Prefer it over screenshot-heavy flows when text or interactive structure is what matters.

### Step 4: Use sessions, MCP, and relay mode deliberately

- Keep one session per workflow and reset it when the CDP connection gets stale.
- Use MCP when the agent client should drive the running browser directly; use the CLI `-e` surface for local scripted control.
- Treat enabled tabs, local relay exposure, and remote tokens as explicit trust boundaries rather than background implementation details.
- Use [references/mcp-security-and-recovery.md](references/mcp-security-and-recovery.md) for MCP config, built-in globals, remote relay notes, restricted pages, and failure recovery.

## Examples

### Example 1: Use the logged-in browser instead of re-authenticating

Input:
```text
Use playwriter to inspect a GitHub issue in my current Chrome session without logging in again.
```

Output shape:
- keeps the answer on `playwriter`, not headless Playwright
- uses the running Chrome session plus `playwriter session new`
- follows `snapshot({ page })` before and after an action

### Example 2: Wire playwriter into an MCP-capable agent client

Input:
```text
How do I connect playwriter to Codex CLI or Claude Desktop so the agent can drive my existing browser?
```

Output shape:
- includes the `npx -y playwriter@latest` MCP command shape
- mentions the Chrome extension and the local relay on `localhost:19988`
- notes that the tab must be explicitly enabled in Chrome
- keeps the guidance on agent control of the running browser session

### Example 3: Verify an authenticated multi-step flow

Input:
```text
I need to verify a checkout flow that depends on my saved login and cart state. Should I use playwriter or agent-browser?
```

Output shape:
- chooses `playwriter` because the flow depends on existing browser state
- explains the `Observe -> Act -> Observe` loop
- preserves the distinction between stateful browser control and isolated headless checks

### Example 4: Recover from a stale session without restarting the whole flow

Input:
```text
playwriter stopped responding after a tab reload. How should I recover without losing the current browser context?
```

Output shape:
- uses `playwriter session reset <id>` or the MCP `reset` tool
- keeps the answer on session recovery rather than generic browser restarts
- points to logs or enabled-tab checks if the reset does not recover the connection

## Best practices

- **Observe → Act → Observe**: always call `snapshot({ page })` before and after each action
- **Prefer `snapshot()` over screenshots** for text inspection (fewer tokens, faster)
- **Never chain actions blindly** — verify state between steps
- **Use stable selectors**: prefer `aria-ref`, `data-testid`, or accessible roles
- **Store context in `state`**: avoid repeated navigation by persisting page references
- **Use `reset` on failures**: CDP disconnects recover cleanly with `playwriter session reset`
- **Keep tab consent explicit**: only enabled tabs are controllable, so say when the user needs to turn the extension green
- **Treat remote relay tokens as secrets**: keep them in env vars or a secret manager, never inline in committed configs

## References

- [Install and session workflow](references/install-and-session-workflow.md)
- [MCP, security, and recovery](references/mcp-security-and-recovery.md)
- [GitHub: remorses/playwriter](https://github.com/remorses/playwriter)
- [Chrome Extension Web Store](https://chromewebstore.google.com/detail/playwriter-mcp/jfeammnjpkecdekppnclgkkffahnhfhe)
- `playwriter skill` — print full usage guide from CLI
- `playwriter logfile` — view relay server + CDP log paths
