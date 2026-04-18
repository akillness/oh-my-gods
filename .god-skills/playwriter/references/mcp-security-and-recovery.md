# MCP, security, and recovery

## Minimal MCP configuration

Use the MCP server when the agent client should drive the existing browser directly:

```json
{
  "mcpServers": {
    "playwriter": {
      "command": "npx",
      "args": ["-y", "playwriter@latest"]
    }
  }
}
```

Restart the MCP client after adding the config.

## Remote relay configuration

When the browser and the agent run on different machines, configure the host, token, and session explicitly:

```json
{
  "mcpServers": {
    "playwriter": {
      "command": "npx",
      "args": ["-y", "playwriter@latest"],
      "env": {
        "PLAYWRITER_HOST": "your-relay-host",
        "PLAYWRITER_TOKEN": "your-secret-token",
        "PLAYWRITER_SESSION": "1"
      }
    }
  }
}
```

Keep tokens in env vars or a secret manager. Do not commit them to repo config.

## Security boundaries

Playwriter is explicit-consent browser control, not unrestricted Chrome access.

- Only tabs where the extension icon is green are controllable.
- Chrome security policy still blocks restricted surfaces such as `chrome://`, other `chrome-extension://` pages, Chrome Web Store pages, and `about:blank`.
- The CLI or MCP path still needs all three prerequisites:
  1. Extension installed
  2. At least one enabled tab
  3. A valid session created with `playwriter session new`

## Recovery workflow

Start with the least-destructive fix:

1. Confirm the target tab is still enabled and green.
2. Run `playwriter session reset <id>` or the MCP `reset` tool.
3. Re-run `snapshot({ page })` before attempting the next action.
4. If the relay is unavailable, inspect the log path:

```bash
playwriter logfile
```

5. For remote setups, confirm `playwriter serve --token ...` is still running and the token matches.

## Failure patterns

| Symptom | Likely cause | Next action |
|---------|--------------|-------------|
| `connection refused :19988` | Relay not active | Check Chrome, extension install, and an enabled tab |
| Clicks fail after navigation | Stale snapshot labels | Re-run `snapshot({ page })` and use fresh `aria-ref` values |
| Commands stop after reload | CDP session stale | `playwriter session reset <id>` |
| MCP starts but cannot act | No enabled tab | Turn the extension green on the target tab |
| Remote relay fails | Token or host mismatch | Re-check env vars and relay process |

## Evidence to preserve during debugging

- The session id
- Whether the icon is green on the target tab
- The last successful snapshot or command
- `playwriter logfile` output path
- Whether the failure is local relay, tab consent, stale session, or restricted page
