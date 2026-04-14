# Vibe Kanban operations guide

Use this file when the user needs deployment, troubleshooting, or cleanup detail.

## Start commands

```bash
npx vibe-kanban
PORT=3001 npx vibe-kanban --port 3001
bash scripts/start.sh --port 3001
bash scripts/health-check.sh
bash scripts/health-check.sh --json
```

## MCP setup commands

```bash
bash scripts/mcp-setup.sh --claude
bash scripts/mcp-setup.sh --codex
bash scripts/mcp-setup.sh --all
```

## Remote or self-hosted guidance

- Set `VK_ALLOWED_ORIGINS` before exposing the board behind Caddy, nginx,
  Traefik, or a custom domain.
- If the board is remote, also plan the editor handoff path so users can open
  workspaces through SSH or the supported editor integration.
- Treat remote mode as a trusted-network feature, not a default local setting.

## Troubleshooting

### Port conflict

```bash
PORT=3001 npx vibe-kanban --port 3001
```

### Worktree cleanup

```bash
git worktree list
git worktree prune
bash scripts/cleanup.sh --dry-run
bash scripts/cleanup.sh --all
```

### Board health check

```bash
bash scripts/health-check.sh --json
```

### Agent auth problems

```bash
claude --version
codex --version
gemini --version
```

Re-check the relevant auth environment variables or in-app agent configuration.

### Reverse proxy or CORS errors

```bash
VK_ALLOWED_ORIGINS=https://vk.example.com npx vibe-kanban
```

## Quick decision guide

| Situation | Recommended path |
|---|---|
| Shared board plus human review | Start the UI and work through workspaces |
| Need board control from an agent | Add MCP with `scripts/mcp-setup.sh` |
| Need authenticated browser validation | Pair with `playwriter` |
| Need only one quick terminal task | Skip Vibe Kanban and use a lighter orchestration skill |
