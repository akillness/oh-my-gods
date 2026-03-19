# ClawTeam — Full CLI Reference

> Source: [HKUDS/ClawTeam](https://github.com/HKUDS/ClawTeam) · Version: 0.1.2 · License: MIT

---

## Global Flags (all commands)

| Flag | Description |
|------|-------------|
| `--version / -v` | Show version and exit |
| `--json` | Machine-readable JSON output |
| `--data-dir TEXT` | Override `~/.clawteam/` state directory |
| `--transport [file\|p2p]` | Transport backend override |

---

## `clawteam launch` — Template Deployment

```bash
clawteam launch <template-name> --goal "..."
```

Deploys a complete pre-configured team. No manual task/agent setup required.

**Built-in templates:**

| Template | Agents | Purpose |
|----------|--------|---------|
| `software-dev` | tech-lead, backend-dev, frontend-dev, qa-engineer, devops | Full-stack development |
| `code-review` | lead-reviewer, security-reviewer, perf-reviewer, arch-reviewer | Multi-perspective review |
| `research-paper` | principal-investigator, literature-surveyor, methodology-designer, data-analyst | Academic research |
| `hedge-fund` | portfolio-manager, value/growth/technical/fundamentals/sentiment analysts, risk-manager | Investment analysis |
| `strategy-room` | strategy-lead, systems-analyst, delivery-planner, risk-mapper, decision-editor | Strategic planning |

```bash
clawteam template list
clawteam template show software-dev
```

---

## `clawteam spawn` — Launch an Agent

```bash
clawteam spawn <backend> <cli> \
  --team <team-name> \
  --agent-name <name> \
  --task "Task description" \
  [--workspace]           # enable git worktree isolation
  [--skip-permissions]    # auto-confirm agent trust dialogs
  [--leader]              # mark as team leader
```

**Backend**: `tmux` (default) or `subprocess`

**Supported CLIs and auto-injected flags:**

| CLI | Auto-flags | Prompt method |
|-----|-----------|---------------|
| `claude` / `claude-code` | `--dangerously-skip-permissions` (if set) | `-p "..."` |
| `codex` / `codex-cli` | `--dangerously-bypass-approvals-and-sandbox` | positional arg |
| `gemini` | `--yolo` | positional arg |
| `nanobot` | normalizes to `nanobot agent` | `-m "..."` |

---

## `clawteam team` — Team Management

```bash
clawteam team spawn-team <team> -d "description" -n <leader-name>
clawteam team discover                        # list all teams
clawteam team status <team>                   # show team members and state
clawteam team cleanup <team>                  # remove team state

# Snapshots (checkpoint/restore)
clawteam team snapshot <team> [--tag label]
clawteam team snapshots <team>
clawteam team restore <team> <snapshot-id>
clawteam team snapshot-delete <team> <snapshot-id>

# Membership
clawteam team request-join <team>
clawteam team approve-join <team> <agent>
clawteam team reject-join <team> <agent>
```

---

## `clawteam task` — Task Management

```bash
clawteam task create <team> "Subject" \
  [-o owner] \
  [--priority low|medium|high|urgent] \
  [--blocked-by id1,id2]

clawteam task get <team> <task-id>
clawteam task update <team> <task-id> \
  [--status pending|in_progress|completed|blocked] \
  [--owner <name>] \
  [--priority <level>]
clawteam task list <team> \
  [--status X] [--owner X] [--priority X]
clawteam task stats <team>

# Block until all tasks done (or timeout)
clawteam task wait <team> \
  [--agent <name>]    # wait only for tasks owned by this agent
  [--timeout 300]     # seconds (default: no timeout)
  [--poll 5]          # poll interval in seconds
```

**Task statuses:** `pending` → `in_progress` → `completed` | `blocked`

**Dead agent recovery:** `TaskWaiter` auto-resets stale `in_progress` tasks to `pending` when agent PID is dead.

---

## `clawteam inbox` — Agent Messaging

```bash
clawteam inbox send <team> <recipient> "message"
clawteam inbox broadcast <team> "message to all"
clawteam inbox receive <team> [--agent <name>] [--limit 10]
clawteam inbox peek <team> [--agent <name>]
clawteam inbox log <team>                   # full immutable event log

# Watch + trigger shell command on message arrival (blocking):
clawteam inbox watch <team> \
  [--agent <name>] \
  [--exec "shell command with {team} {agent} {message} vars"] \
  [--json]
```

---

## `clawteam board` — Monitoring & Dashboard

```bash
clawteam board show <team>                   # Rich kanban snapshot (4 columns)
clawteam board overview                      # All teams summary
clawteam board live <team> [--interval 2]    # Auto-refresh live view
clawteam board attach <team>                 # Tile tmux panes + attach session
clawteam board serve \
  [--host 127.0.0.1] [--port 8080] \
  [--team <name>]                            # optional single-team filter
```

**HTTP API (when `board serve` is running):**

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/overview` | GET | All teams summary JSON |
| `/api/team/{team}` | GET | Full team board JSON |
| `/api/events/{team}` | GET | SSE stream (real-time push) |

---

## `clawteam workspace` — Git Worktree Isolation

Each agent can operate in its own git branch via `git worktree add`.

```bash
clawteam workspace list <team>
clawteam workspace checkpoint <team> --agent <name>    # git add -A && git commit
clawteam workspace merge <team> --agent <name> \
  --target main [--cleanup]                            # git merge --no-ff
clawteam workspace cleanup <team> --agent <name>       # git worktree remove + branch -D
clawteam workspace status <team> --agent <name>
```

---

## `clawteam config` — Configuration

```bash
clawteam config show
clawteam config set <key> <value>
clawteam config get <key>
clawteam config health
```

**`ClawTeamConfig` fields:**

| Key | Env Var | Default | Description |
|-----|---------|---------|-------------|
| `data_dir` | `CLAWTEAM_DATA_DIR` | `~/.clawteam` | State root |
| `user` | `CLAWTEAM_USER` | `""` | Multi-user namespace prefix |
| `transport` | `CLAWTEAM_TRANSPORT` | `file` | `file` or `p2p` |
| `backend` | `CLAWTEAM_BACKEND` | `tmux` | `tmux` or `subprocess` |
| `workspace` | — | `false` | Git worktree isolation |
| `skip_permissions` | — | `false` | Auto-confirm agent dialogs |

**Agent identity env vars** (set automatically by `clawteam spawn`, dual-prefix):

| `CLAWTEAM_*` | `CLAUDE_CODE_*` | Description |
|-------------|-----------------|-------------|
| `CLAWTEAM_AGENT_ID` | `CLAUDE_CODE_AGENT_ID` | Unique agent UUID |
| `CLAWTEAM_AGENT_NAME` | `CLAUDE_CODE_AGENT_NAME` | Agent's display name |
| `CLAWTEAM_TEAM_NAME` | `CLAUDE_CODE_TEAM_NAME` | Team agent belongs to |
| `CLAWTEAM_AGENT_LEADER` | `CLAUDE_CODE_AGENT_LEADER` | `"true"` if leader |
| `CLAWTEAM_PLAN_MODE_REQUIRED` | `CLAUDE_CODE_PLAN_MODE_REQUIRED` | Require plan approval |

---

## `clawteam plan` — Plan Approval Workflow

```bash
clawteam plan submit <team> \
  --agent <name> --leader <leader-name> \
  --content "Plan markdown..." [--summary "..."]

clawteam plan approve <team> \
  --leader <name> --plan-id <id> --agent <name>

clawteam plan reject <team> \
  --leader <name> --plan-id <id> --agent <name> [--feedback "..."]
```

---

## `clawteam lifecycle` — Shutdown Protocol

```bash
clawteam lifecycle request-shutdown <team> \
  --from <requesting-agent> --to <target-agent>

clawteam lifecycle approve-shutdown <team> \
  --agent <name> --request-id <id> --requester <name>

clawteam lifecycle reject-shutdown <team> \
  --agent <name> --request-id <id> --requester <name>

clawteam lifecycle idle <team> \
  --agent <name> --agent-id <id> --leader <leader-name>

# Call on agent process exit (add to agent shutdown script):
clawteam lifecycle on-exit --team <name> --agent <name>
```

---

## `clawteam cost` — Token / Cost Tracking

```bash
clawteam cost report <team> \
  --input-tokens N --output-tokens N --cost-cents N [--agent <name>]

clawteam cost show <team>                    # summary per agent
clawteam cost budget <team> --cents N        # set team budget cap
```

---

## `clawteam session` — Agent Resume State

```bash
clawteam session save <team> --session-id <id> [--agent <name>]
clawteam session show <team>
clawteam session clear <team> --agent <name>
```

---

## `clawteam identity` — Agent Self-Identification

```bash
clawteam identity show     # display current identity from env vars
clawteam identity set --agent-name <name> --team <name> [--leader]
```

---

## State Directory Layout

```
~/.clawteam/
├── config.json                          # Global config (ClawTeamConfig)
├── teams/{team}/
│   ├── config.json                      # TeamConfig (members, leader, description)
│   ├── inboxes/{agent}/msg-*.json       # Per-agent message inbox (FileTransport)
│   ├── events/evt-*.json                # Immutable team event log
│   ├── spawn_registry.json              # Agent PID/tmux liveness tracking
│   ├── peers/{agent}.json               # P2P peer discovery (p2p transport only)
│   └── snapshots/                       # Team state checkpoints
├── tasks/{team}/task-{id}.json          # Per-task files (fcntl-locked)
├── costs/{team}/cost-*.json             # Token/cost tracking events
├── sessions/{team}/{agent}.json         # Agent resume state
├── plans/{team}/{agent}-{id}.md         # Plan approval documents
└── templates/                           # User-defined TOML templates
```

---

## Version Notes

- **Current**: 0.1.2 (Alpha — Development Status 3)
- **Python**: 3.10, 3.11, 3.12 supported
- **Roadmap**: v0.4 adds Redis transport, v0.5 Redis shared state, v1.0 full web UI
- Cross-machine today: SSHFS + `CLAWTEAM_DATA_DIR` pointing to mount
- `CLAUDE_CODE_*` env var prefix supported as fallback for all `CLAWTEAM_*` identity vars
