---
name: vibe-kanban
description: >
  Coordinate AI coding agents on a visual Kanban board with isolated worktrees,
  review panels, MCP control, and GitHub PR handoff. Use when the user wants a
  shared board for parallel coding-agent work, visual review before merge, or
  workspace-based agent orchestration. Triggers on: vibe-kanban, kanban board
  for agents, visual agent board, parallel workspaces, agent PR board.
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: vibe-kanban, kanban, multi-agent, git-worktree, github-pr, task-management, claude-code, codex, gemini, open-code, mcp
  platforms: Claude, Codex, Gemini, OpenCode
  keyword: kanbanview
  version: 1.2.1
  source: "https://github.com/BloopAI/vibe-kanban"
  verified: 2026-04-14
  verified-with: upstream-readme, local-scripts
---

# Vibe Kanban

Vibe Kanban is a board-driven workflow for planning, running, and reviewing
multiple coding-agent workspaces. Each workspace gets its own branch, worktree,
logs, diff, preview, and PR path so a human can supervise parallel work without
colliding git state.

## When to use this skill

- When one feature should be split into 2 or more independent agent lanes
- When the user wants a visual review surface for diffs, logs, and previews
- When a team wants workspace-per-task isolation instead of ad hoc worktree setup
- When an agent needs MCP access to the board for card creation or movement
- When GitHub PR creation should stay attached to the workspace lifecycle

Do not force this skill for a single quick terminal-only task or when the user
only needs background delegation without a board.

## Instructions

### Step 1: Confirm fit and pick the operating mode

- Use the local board when one person or a small team needs planning plus review.
- Use the remote or self-hosted path only when the board must be shared over a
  network and you can configure CORS plus remote editor access safely.
- Keep one workspace equal to one reviewable task or one PR-sized outcome.

### Step 2: Check prerequisites before launching

```bash
node --version
git --version
npx vibe-kanban --help
claude --version
codex --version
gemini --version
```

- Prefer Node.js 20+ based on the current upstream README.
- Ensure the selected coding agents are already authenticated before using the board.
- If PR creation matters, make sure the GitHub auth path for the runtime is ready.

### Step 3: Start the board

```bash
npx vibe-kanban
PORT=3001 npx vibe-kanban --port 3001
bash scripts/start.sh --port 3001
```

- Use `bash scripts/health-check.sh --json` when you need a machine-readable check.
- If another local app already uses port `3000`, move the board to a different port.
- If you are exposing the board remotely, set `VK_ALLOWED_ORIGINS` first.

### Step 4: Configure MCP only when the task needs board control from an agent

```bash
bash scripts/mcp-setup.sh --claude
bash scripts/mcp-setup.sh --codex
bash scripts/mcp-setup.sh --all
```

Expected board tools:

- `vk_list_cards`
- `vk_create_card`
- `vk_move_card`
- `vk_get_logs`
- `vk_retry_card`

Treat MCP as board control, not as a replacement for human review of code,
logs, or previews.

### Step 5: Run the workspace-to-PR loop

1. Create a workspace from the UI for one narrow task.
2. Pick the coding agent and write a task brief that can land as one reviewable slice.
3. Let Vibe Kanban create the isolated branch and worktree.
4. Review the workspace diff, logs, and preview before asking for another pass.
5. Open the pull request from the workspace once the slice is ready.

### Step 6: Load supporting files instead of expanding this entrypoint

- `references/workspace-playbook.md` for the detailed workspace lifecycle, UI
  flow, supported-agent notes, and representative use cases
- `references/operations-guide.md` for self-hosting, troubleshooting, cleanup,
  and quick commands
- `references/environment-variables.md` for the env var matrix
- `references/mcp-api.md` for MCP payloads and response shapes

## Examples

### Example 1: Split a feature across multiple workspaces

Input:

```text
Use vibe-kanban to split checkout work into frontend, backend, and integration-test lanes.
```

Output:

- Recommends one workspace per lane
- Keeps the scope narrow enough for independent review
- Routes the user to the board-driven review and PR flow

### Example 2: Connect Vibe Kanban to Codex

Input:

```text
Set up vibe-kanban MCP access for Codex in this repo and tell me which tools should appear.
```

Output:

- Uses `bash scripts/mcp-setup.sh --codex`
- Names the expected `vk_*` tools
- Keeps the answer focused on board control rather than generic MCP theory

### Example 3: Prepare a remote deployment

Input:

```text
We are self-hosting Vibe Kanban behind Caddy for the team.
```

Output:

- Mentions `VK_ALLOWED_ORIGINS`
- Mentions the remote editor or SSH workflow
- Routes deeper setup to the operations guide instead of bloating the main answer

### Example 4: Inspect the live board or preview while logged in

Input:

```text
I need to validate the workspace preview in my logged-in browser session.
```

Output:

- Keeps Vibe Kanban as the planning and review surface
- Pairs authenticated browser work with `playwriter`
- Avoids switching to headless browser automation by default

## Best practices

1. Keep one workspace equal to one reviewable outcome.
2. Prefer multiple narrow workspaces over one giant agent prompt.
3. Use GitHub PRs as the approval surface even when the board drove execution.
4. Prefer `playwriter` for authenticated browser or runtime validation around the board preview.
5. Re-check upstream docs when supported agents, ports, or runtime env vars may have changed.
6. Do not start `skill-autoresearch` until the skill has landed with eval coverage and repeated measured failures justify a mutation loop.

## References

- Local: `references/workspace-playbook.md`
- Local: `references/operations-guide.md`
- Local: `references/environment-variables.md`
- Local: `references/mcp-api.md`
- Upstream README: https://github.com/BloopAI/vibe-kanban
- Upstream docs: https://vibekanban.com/docs
- Supported coding agents: https://vibekanban.com/docs/supported-coding-agents
- Self-hosting guide: https://vibekanban.com/docs/self-hosting/deploy-docker
