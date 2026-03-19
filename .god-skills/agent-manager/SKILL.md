---
name: agent-manager
description: >
  tmux + Python agent lifecycle manager — start, stop, monitor, and assign tasks
  to AI agents running in tmux sessions. Use when managing multiple AI agents
  without a server, scheduling agent jobs via cron, monitoring agent heartbeats,
  or injecting skills into agent sessions. Zero dependencies beyond tmux + Python.
  Triggers on: "start agent", "stop agent", "monitor agent", "assign task to agent",
  "agent lifecycle", "agent scheduling", "tmux agent", "manage agents", "agent-manager".
allowed-tools: Bash Read Write Edit
license: MIT
metadata:
  source: https://github.com/fractalmind-ai/agent-manager-skill
  tags: agent-management, tmux, python, lifecycle, scheduling, heartbeat
  version: "1.0"
---

# Agent Manager

Simple, installation-agnostic AI agent lifecycle management using **tmux + Python**.
Manage multiple AI agents without running a server, wiring HTTP APIs, or pulling in heavy dependencies.

## When to use this skill

- Starting/stopping/monitoring AI agents in tmux sessions
- Scheduling agent tasks via cron (daily standups, code reviews, nightly tests)
- Sending heartbeat check-ins to running agents
- Assigning tasks to agents from files or stdin
- Managing agents defined in `agents/EMP_*.md` YAML frontmatter files

## Quick Start

```bash
# Install
bash ~/.agent-skills/agent-manager/scripts/install.sh

# Setup in your project
bash ~/.agent-skills/agent-manager/scripts/setup.sh

# Define CLI alias (pick path matching your install)
CLI="python3 ~/.claude/skills/agent-manager/scripts/main.py"

# Use
$CLI list
$CLI start EMP_0001
$CLI status EMP_0001
$CLI monitor EMP_0001 --follow
$CLI stop EMP_0001
```

## Core Concepts

### Agent Configuration

Agents are defined as `agents/EMP_*.md` files with YAML frontmatter:

```yaml
---
name: dev
description: Dev Agent
working_directory: ${REPO_ROOT}
launcher: claude
launcher_args:
  - --dangerously-skip-permissions
skills:
  - review-pr
schedules:
  - name: daily-standup
    cron: "0 9 * * 1-5"
    task: |
      Review GitHub issues, prioritize today's work
    max_runtime: 30m
heartbeat:
  cron: "*/30 * * * *"
  max_runtime: 5m
  session_mode: auto
---

# DEV AGENT

## Role
You are the Dev Agent...
```

**Key fields:** `name`, `description`, `enabled` (default: true), `working_directory` (supports `${REPO_ROOT}`), `launcher`, `launcher_args`, `launcher_config`, `skills`, `schedules`, `heartbeat`, `tmux`

### Launcher Types

```yaml
# Full path (Claude Code)
launcher: ${REPO_ROOT}/path/to/launcher
launcher_args: ["--dangerously-skip-permissions"]

# Provider name (Codex CLI)
launcher: codex
launcher_args: [--model=gpt-4.7]
launcher_config:
  model_instructions_file: ${REPO_ROOT}/agents/prompt.md
```

## Commands

```bash
$CLI list                    # All agents (running/stopped/disabled)
$CLI list --running          # Only running agents
$CLI start dev               # Start agent in tmux session agent-dev
$CLI start dev --working-dir /path  # Override working dir
$CLI stop dev                # Kill agent tmux session
$CLI status dev              # Runtime snapshot + last heartbeat
$CLI monitor dev             # Last 100 lines of output
$CLI monitor dev -n 500      # Last 500 lines
$CLI monitor dev --follow    # Live tail (Ctrl+C to stop)
$CLI send dev "message"      # Send message (auto-submits)
$CLI send dev --no-enter "draft"  # Type without submitting
$CLI assign dev <<EOF        # Assign task from stdin
Task: Fix login bug
1. Reproduce, 2. Fix, 3. Test
EOF
$CLI assign dev --task-file task.md  # Assign from file
$CLI doctor                  # Sanity check setup
```

## Scheduling

```yaml
schedules:
  - name: daily-standup
    cron: "0 9 * * 1-5"
    task: |
      Review issues and prioritize work
    max_runtime: 30m
    enabled: true
```

```bash
$CLI schedule list           # Show all scheduled jobs
$CLI schedule sync           # Write to system crontab
$CLI schedule sync --dry-run # Preview changes
$CLI schedule run dev --job daily-standup  # Manual trigger
```

## Heartbeat

Each agent can have one heartbeat for periodic check-ins:

```yaml
heartbeat:
  cron: "*/30 * * * *"
  max_runtime: 5m
  session_mode: auto   # restore | auto | fresh
```

```bash
$CLI heartbeat list          # Show all heartbeat configs
$CLI heartbeat sync          # Sync to crontab
$CLI heartbeat run EMP_0001  # Manual trigger
$CLI heartbeat trace --agent EMP_0001 --since 2026-01-01T00:00:00Z
$CLI heartbeat slo           # Daily SLO summary (target: ≥99% success)
$CLI heartbeat slo --window weekly --agent EMP_0001
```

**Heartbeat message sent to agent:**
> "Read HEARTBEAT.md if it exists. Follow it strictly. If nothing needs attention, reply HEARTBEAT_OK."

## Disabling Agents

```yaml
---
name: dev
enabled: false   # ← prevents start; running sessions not stopped
---
```

## Skills Integration

Skills listed in agent frontmatter are injected as system prompt on `start`:

```yaml
skills:
  - review-pr
  - bsc-contract-development
```

Skills resolved from (first match wins):
1. `<repo>/.agent/skills/<skill>/SKILL.md`
2. `~/.agent/skills/<skill>/SKILL.md`
3. `<repo>/.claude/skills/<skill>/SKILL.md`
4. `~/.claude/skills/<skill>/SKILL.md`

## Architecture

```
agent-manager/
├── SKILL.md
├── scripts/
│   ├── main.py              # CLI entry point
│   ├── agent_config.py      # YAML frontmatter parser
│   ├── tmux_helper.py       # tmux session wrapper
│   ├── schedule_helper.py   # crontab management
│   └── heartbeat_slo.py     # SLO summary script
├── providers/
│   └── __init__.py          # CLI provider configs
├── references/
│   └── quick-reference.md   # Command cheat sheet
└── scripts/
    ├── install.sh            # Installation script
    └── setup.sh              # Project setup script
```

## Requirements

- Python 3.x
- tmux
- Agents defined under `agents/` directory
