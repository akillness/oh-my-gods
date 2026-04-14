# Vibe Kanban environment variables

Last refreshed: 2026-04-14 from the upstream README plus the local helper scripts.

## Runtime variables

| Variable | Default | Notes |
|---|---|---|
| `PORT` | Auto-assign in production; local skill examples use `3000` or `3001` | Primary server port |
| `BACKEND_PORT` | `0` in dev | Overrides `PORT + 1` for the backend in dev mode |
| `FRONTEND_PORT` | `3000` in dev | Overrides the frontend dev port |
| `HOST` | `127.0.0.1` | Backend bind host |
| `MCP_HOST` | Value of `HOST` | Use `127.0.0.1` when `HOST=0.0.0.0` on Windows |
| `MCP_PORT` | Value of `BACKEND_PORT` | MCP server connection port |
| `DISABLE_WORKTREE_CLEANUP` | Not set | Disables orphan and expired workspace cleanup |
| `VK_ALLOWED_ORIGINS` | Not set | Required behind a reverse proxy or custom domain |
| `VK_SHARED_API_BASE` | Not set | Base URL for remote or shared API access |
| `VK_SHARED_RELAY_API_BASE` | Not set | Base URL for relay or tunnel mode |
| `VK_TUNNEL` | Not set | Enables relay tunnel mode when configured |

## Common agent auth variables

The upstream app manages agent configuration through the UI, but these auth
variables still matter in many local setups:

| Variable | Typical use |
|---|---|
| `ANTHROPIC_API_KEY` | Claude Code lanes |
| `OPENAI_API_KEY` | Codex or GPT lanes |
| `GOOGLE_API_KEY` | Gemini lanes |
| `GITHUB_TOKEN` | PR or GitHub-linked operations when required by the runtime |

## Local helper script variables

The bundled helper scripts also read:

| Variable | Used by | Notes |
|---|---|---|
| `VIBE_KANBAN_PORT` | `scripts/start.sh`, `scripts/health-check.sh` | Local wrapper convenience alias |
| `VIBE_KANBAN_REMOTE` | `scripts/start.sh` | Local wrapper switch for remote mode |

## Example local launch

```bash
PORT=3001 \
VK_ALLOWED_ORIGINS=http://localhost:3001 \
npx vibe-kanban --port 3001
```

## Example remote deployment

```bash
HOST=0.0.0.0 \
PORT=3000 \
VK_ALLOWED_ORIGINS=https://vk.example.com \
VK_SHARED_API_BASE=https://vk.example.com \
npx vibe-kanban
```

## Notes

- Prefer the upstream docs when the exact runtime defaults matter.
- Keep local skill answers focused on the variables that change the user’s next action.
