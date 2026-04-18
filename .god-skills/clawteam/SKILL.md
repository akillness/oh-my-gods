---
name: clawteam
description: >
  Framework-agnostic multi-agent coordination CLI that lets AI agents self-organize into
  collaborative teams. Use when spawning multiple coding agents (Claude Code, Codex, Gemini, nanobot)
  to work in parallel on a shared task with file-based state, task queues, inboxes, and a kanban
  board. Triggers on: clawteam, multi-agent team, agent swarm, spawn agents, parallel agents,
  agent coordination, agent inbox, agent kanban, launch software-dev, clawteam spawn, clawteam board,
  let agents work together, agent team formation.
license: MIT
compatibility: >
  Requires Python >=3.10, tmux, and at least one coding agent CLI (claude, codex, gemini, nanobot).
  Install via pip install clawteam. State persists to ~/.clawteam/ as plain JSON — no database needed.
  Optional P2P transport: pip install clawteam[p2p] (ZeroMQ).
metadata:
  version: "1.0"
  source: HKUDS/ClawTeam
  tags: multi-agent, coordination, tmux, cli, agent-team, kanban, task-queue, python
allowed-tools: Bash Read Write Edit Glob Grep
---

# ClawTeam — Multi-Agent Coordination CLI

> *"Let AI Agents Form Swarms, Think & Work Together, and Ship Faster."*

ClawTeam is a framework-agnostic CLI that turns standalone AI agents into coordinated teams. A leader agent spawns workers, delegates tasks with dependency chains, communicates via inboxes, and monitors progress on a kanban board — all stored as plain JSON in `~/.clawteam/`.

## When to use this skill

- Splitting a large task across multiple coding agents running in parallel tmux panes
- Using pre-built team templates (software-dev, code-review, research-paper, hedge-fund, strategy-room)
- Coordinating agents across different CLIs (Claude Code, Codex, Gemini, nanobot) in one team
- Monitoring real-time agent progress via kanban board or web UI
- Isolating each agent's changes in a git worktree branch, merging when done

## Instructions

### Step 1: Install and validate

```bash
pip install clawteam

# Optional P2P transport (ZeroMQ for low-latency messaging):
pip install clawteam[p2p]
```

Requirements: Python ≥3.10, `tmux`, one or more coding agent CLIs.

Run setup validation:

```bash
bash scripts/setup.sh
```

### Step 2: Launch from a template

The fastest way to start a multi-agent team:

```bash
# Launch a full software-dev team (6 agents: tech-lead, backend, frontend, QA, devops)
clawteam launch software-dev --goal "Build a REST API with JWT auth and PostgreSQL"

# Other built-in templates:
clawteam launch code-review --goal "Review PR #42 for security and performance"
clawteam launch research-paper --goal "Survey LLM multi-agent coordination methods"
clawteam launch hedge-fund --goal "Analyze NVDA earnings for Q4 2025"
clawteam launch strategy-room --goal "Design a go-to-market strategy for a B2B SaaS product"

# List all available templates:
clawteam template list
```

### Step 3: Build a team manually

```bash
# 1. Create team with leader
clawteam team spawn-team my-project -d "Build OAuth service" -n tech-lead

# 2. Create tasks (with optional dependency chains)
clawteam task create my-project "Design API schema" -o backend-dev --priority high
TASK1=$(clawteam task create my-project "Implement OAuth endpoints" -o backend-dev --json | python3 -c "import sys,json; print(json.load(sys.stdin)['id'])")
clawteam task create my-project "Write integration tests" -o qa-engineer --blocked-by "$TASK1"

# 3. Spawn agents in tmux windows
clawteam spawn tmux claude --team my-project --agent-name backend-dev --task "Implement OAuth2 endpoints"
clawteam spawn tmux claude --team my-project --agent-name qa-engineer --task "Write integration tests"

# 4. Monitor progress
clawteam board attach my-project     # tiles tmux panes + attaches
clawteam board live my-project       # rich kanban, auto-refresh

# 5. Wait for all tasks to complete
clawteam task wait my-project --timeout 3600

# 6. Merge worktrees (if workspace isolation was enabled)
clawteam workspace merge my-project --agent backend-dev --target main
```

### Step 4: Operate the team

Use the CLI reference below to monitor the board, exchange inbox messages,
track costs, and manage workspaces once the team is running.

## CLI Reference

### Team management

```bash
clawteam team spawn-team <team> -d "description" -n <leader-name>
clawteam team status <team>
clawteam team discover
clawteam team cleanup <team>
clawteam team snapshot <team> [--tag label]
clawteam team restore <team> <snapshot-id>
```

### Task management

```bash
# Create with priority and dependency
clawteam task create <team> "Subject" -o <owner> \
  --priority low|medium|high|urgent \
  --blocked-by <task-id1>,<task-id2>

clawteam task list <team> [--status pending|in_progress|completed|blocked] [--owner <name>]
clawteam task update <team> <task-id> --status in_progress
clawteam task stats <team>
clawteam task wait <team> [--timeout 300] [--poll 5]
```

### Agent inbox (messaging)

```bash
clawteam inbox send <team> <recipient> "message"
clawteam inbox broadcast <team> "alert all agents"
clawteam inbox receive <team> [--agent <name>] [--limit 10]
clawteam inbox peek <team> [--agent <name>]
# Watch + auto-run a command when message arrives:
clawteam inbox watch <team> --agent <name> --exec "clawteam task list {team}"
```

### Board & monitoring

```bash
clawteam board show <team>                   # Rich kanban snapshot
clawteam board live <team> [--interval 2]    # Auto-refresh
clawteam board attach <team>                 # Tile tmux panes + attach
clawteam board serve [--port 8080]           # HTTP + SSE dashboard
# API endpoints: GET /api/overview, /api/team/{team}, /api/events/{team} (SSE)
```

### Workspace (git worktree isolation)

```bash
clawteam workspace list <team>
clawteam workspace checkpoint <team> --agent <name>    # git commit current changes
clawteam workspace merge <team> --agent <name> --target main [--cleanup]
clawteam workspace cleanup <team> --agent <name>
```

### Spawn backends

```bash
# tmux backend (default) — each agent gets its own tmux window
clawteam spawn tmux claude --team <team> --agent-name <name> --task "..."
clawteam spawn tmux codex  --team <team> --agent-name <name> --task "..."
clawteam spawn tmux gemini --team <team> --agent-name <name> --task "..."
clawteam spawn tmux nanobot --team <team> --agent-name <name> --task "..."

# Options:
#   --workspace         enable git worktree isolation
#   --skip-permissions  auto-confirm agent trust dialogs
#   --leader            mark this agent as team leader
```

### Lifecycle

```bash
clawteam lifecycle request-shutdown <team> --from <agent> --to <agent>
clawteam lifecycle approve-shutdown <team> --agent <name> --request-id <id> --requester <name>
clawteam lifecycle idle <team> --agent <name> --agent-id <id> --leader <name>
clawteam lifecycle on-exit --team <name> --agent <name>   # call on agent exit
```

### Cost tracking

```bash
clawteam cost report <team> --input-tokens 1000 --output-tokens 500 --cost-cents 15
clawteam cost show <team>
clawteam cost budget <team> --cents 5000
```

## Configuration

**Config file**: `~/.clawteam/config.json`

```bash
clawteam config show
clawteam config set backend tmux          # tmux (default) or subprocess
clawteam config set transport file        # file (default) or p2p
clawteam config set workspace true        # enable git worktree isolation
clawteam config set skip_permissions true # auto-confirm trust dialogs
clawteam config health
```

**Environment variables** (override config file):

| Variable | Default | Description |
|----------|---------|-------------|
| `CLAWTEAM_DATA_DIR` | `~/.clawteam` | State storage root |
| `CLAWTEAM_TRANSPORT` | `file` | `file` or `p2p` |
| `CLAWTEAM_BACKEND` | `tmux` | `tmux` or `subprocess` |
| `CLAWTEAM_USER` | `""` | Multi-user namespace |
| `CLAWTEAM_AGENT_NAME` | — | Agent's own name (injected automatically) |
| `CLAWTEAM_TEAM_NAME` | — | Team agent belongs to (injected automatically) |
| `CLAWTEAM_AGENT_LEADER` | — | `"true"` if this agent is the leader |

## Built-in Templates

| Template | Agents | Use Case |
|----------|--------|----------|
| `software-dev` | tech-lead, backend-dev, frontend-dev, qa-engineer, devops | Full-stack development |
| `code-review` | lead-reviewer, security-reviewer, perf-reviewer, arch-reviewer | Multi-perspective PR review |
| `research-paper` | principal-investigator, literature-surveyor, methodology-designer, data-analyst | Academic research |
| `hedge-fund` | portfolio-manager, 5 analysts, risk-manager | Investment analysis |
| `strategy-room` | strategy-lead, systems-analyst, delivery-planner, risk-mapper, decision-editor | Strategic planning |

Custom templates: create `~/.clawteam/templates/my-template.toml` (TOML format, variables: `{goal}`, `{team_name}`, `{agent_name}`).

## State Layout

```
~/.clawteam/
├── config.json                      # Global config
├── teams/{team}/
│   ├── config.json                  # TeamConfig (members, leader)
│   ├── inboxes/{agent}/msg-*.json   # Per-agent message inbox
│   ├── events/evt-*.json            # Immutable event log
│   └── snapshots/                   # Team state checkpoints
├── tasks/{team}/task-{id}.json      # Per-task files (fcntl-locked)
├── costs/{team}/cost-*.json         # Token/cost tracking
├── sessions/{team}/{agent}.json     # Agent resume state
└── plans/{team}/{agent}-{id}.md     # Plan approval files
```

## Cross-Machine Setup

No special config — mount shared filesystem via SSHFS and point `CLAWTEAM_DATA_DIR` to the mount:

```bash
sshfs user@host:/path/to/shared ~/.clawteam-shared
export CLAWTEAM_DATA_DIR=~/.clawteam-shared
```

## Examples

### Example 1: Launch a mixed-agent implementation swarm

Input:

```text
Use clawteam to split a full-stack feature across Codex, Claude Code, and Gemini agents with isolated workspaces and a live kanban board.
```

Output shape:

- installs or validates `clawteam` and required agent CLIs
- chooses a template or creates a bounded manual team
- enables workspace isolation when file conflicts are likely
- reports how to monitor progress and merge agent work safely

### Example 2: Run a review-focused team

Input:

```text
Start a code-review swarm for this PR with separate security, performance, and architecture reviewers.
```

Output shape:

- launches the `code-review` template or an equivalent manual team
- assigns reviewer roles clearly
- uses inbox or task dependencies for reviewer coordination
- reports the board or monitoring command for follow-up

## Best practices

1. **Start with templates** — `clawteam launch software-dev` is faster than manual team creation
2. **Enable workspace isolation** — `--workspace` prevents file conflicts between agents on the same repo
3. **Use `--blocked-by`** — model real task dependencies to prevent race conditions
4. **Watch the board** — `clawteam board live <team>` or `board attach` for real-time progress
5. **Set cost budgets** — `clawteam cost budget <team> --cents 5000` to cap spend
6. **Use `inbox watch`** — trigger shell commands reactively on message arrival
7. **Snapshot before risky ops** — `clawteam team snapshot <team>` before major merges
8. **Call `on-exit`** — always include `clawteam lifecycle on-exit` in agent shutdown scripts

## References

- [GitHub: HKUDS/ClawTeam](https://github.com/HKUDS/ClawTeam)
- [PyPI: clawteam](https://pypi.org/project/clawteam/)
- [README Korean](https://github.com/HKUDS/ClawTeam/blob/main/README_KR.md)
- [Roadmap](https://github.com/HKUDS/ClawTeam/blob/main/ROADMAP.md)
- See `references/clawteam-cli.md` for full CLI command reference
