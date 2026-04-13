---
name: omc
description: >
  Orchestrate Claude Code with team-first multi-agent execution, keyword-driven
  workflows, smart model routing, and persistent verification loops. Use when
  the user needs Claude-native coordination, staged team execution,
  autopilot/ralph/ultrawork routing, or setup and operations guidance for
  oh-my-claudecode. Triggers on: omc, oh-my-claudecode, claude team, claude
  multi-agent, autopilot, ultrawork, ralph.
allowed-tools: Read Write Bash Grep Glob Edit
metadata:
  tags: omc, oh-my-claudecode, claude-code, multi-agent, orchestration, team, autopilot, ralph, ultrawork
  platforms: Claude Code
  keyword: omc
  version: 4.2.15
  source: Yeachan-Heo/oh-my-claudecode
---


# omc (oh-my-claudecode) — Claude Code Multi-Agent Orchestration

## When to use this skill

- You want Teams-first multi-agent orchestration inside Claude Code
- You need 32 specialized agents with smart model routing (Haiku → Opus)
- Complex tasks that benefit from parallel agent execution with verification loops
- Any Claude Code workflow that needs persistent, guaranteed-completion execution

---

## Instructions

### Step 1: Match the request to the right OMC execution mode

- Use Team mode when the work benefits from coordinated specialists and a shared staged pipeline.
- Use `autopilot` for end-to-end feature delivery when the user wants one autonomous lead instead of explicit team management.
- Use `ralph` when persistence and verifier-driven completion matter more than speed.
- Use `ulw` for batch fixes or parallelizable cleanup where maximum concurrency matters more than staged coordination.

### Step 2: Start with setup when the Claude Code environment is unclear

- Use the plugin installation flow as the default setup path inside Claude Code.
- Include `/omc:omc-setup` when the user asks how to initialize or repair the environment.
- If Team mode matters, mention the `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` setting instead of assuming native teams are already enabled.
- Keep the npm installation path as an alternative, not the primary default.

### Step 3: Keep the answer Claude-native and operationally explicit

- Use concrete OMC keywords or commands such as `team`, `autopilot`, `ralph`, `ulw`, `/omc:team`, or `/omc:omc-doctor`.
- Mention model routing, HUD visibility, or the staged team pipeline only when they help the user choose the right surface.
- Treat Codex CLI or Gemini CLI as optional companion tools, not the primary answer surface.
- When the user asks about runtime issues, include OMC utilities such as `omc wait` or stop-callback notifications instead of generic advice.

## 1. Installation (3 Steps)

**Step 1: Install plugin**
```bash
/plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode
/plugin install oh-my-claudecode
```

**Step 2: Run setup**
```bash
/omc:omc-setup
```

**Step 3: Build something**
```text
autopilot: build a REST API for managing tasks
```

> **npm alternative**: `npm install -g oh-my-claude-sisyphus`

---

## 2. Orchestration Modes

| Mode | What it is | Use For |
|------|-----------|---------|
| **Team** (recommended) | Staged pipeline: `team-plan → team-prd → team-exec → team-verify → team-fix` | Coordinated agents on shared task list |
| **Autopilot** | Autonomous single lead agent | End-to-end feature work with minimal ceremony |
| **Ultrawork** | Maximum parallelism (non-team) | Burst parallel fixes/refactors |
| **Ralph** | Persistent mode with verify/fix loops | Tasks that must complete fully |
| **Pipeline** | Sequential staged processing | Multi-step transformations |
| **Swarm/Ultrapilot** | Legacy facades → route to Team | Existing workflows |

Enable Claude Code native teams in `~/.claude/settings.json`:
```json
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}
```

---

## 3. Magic Keywords

| Keyword | Effect | Example |
|---------|--------|---------|
| `team` | Canonical Team orchestration | `/omc:team 3:executor "fix all TypeScript errors"` |
| `autopilot` | Full autonomous execution | `autopilot: build a todo app` |
| `ralph` | Persistence mode | `ralph: refactor auth` |
| `ulw` | Maximum parallelism | `ulw fix all errors` |
| `plan` | Planning interview | `plan the API` |
| `ralplan` | Iterative planning consensus | `ralplan this feature` |
| `swarm` | Legacy (routes to Team) | `swarm 5 agents: fix lint errors` |
| `ultrapilot` | Legacy (routes to Team) | `ultrapilot: build a fullstack app` |

> **Note**: `ralph` includes ultrawork — activating ralph mode automatically includes ultrawork's parallel execution.

---

## 4. Team Mode (Canonical)

```bash
/omc:team 3:executor "fix all TypeScript errors"
```

Runs as a staged pipeline:
```
team-plan → team-prd → team-exec → team-verify → team-fix (loop)
```

---

## 5. Utilities

### Rate Limit Wait
Auto-resume Claude Code sessions when rate limits reset:
```bash
omc wait          # Check status, get guidance
omc wait --start  # Enable auto-resume daemon
omc wait --stop   # Disable daemon
```

### Notifications (Telegram/Discord)
```bash
omc config-stop-callback telegram --enable --token <bot_token> --chat <chat_id>
omc config-stop-callback discord --enable --webhook <url>
```

---

## 6. Updating

```bash
# 1. Sync latest version
/plugin marketplace update omc

# 2. Re-run setup
/omc:omc-setup

# If issues after update
/omc:omc-doctor
```

---

## 7. Optional: Multi-AI Orchestration

OMC can optionally orchestrate external AI providers (not required):

| Provider | Install | What it enables |
|----------|---------|----------------|
| Gemini CLI | `npm install -g @google/gemini-cli` | Design review, UI consistency (1M token context) |
| Codex CLI | `npm install -g @openai/codex` | Architecture validation, code review cross-check |

---

## Examples

### Example 1: Route a repo-wide task into Team mode

Input:
```text
Use OMC to coordinate four Claude Code agents for a multi-file refactor with planning and verification.
```

Output shape:
- keeps the answer on Claude Code
- uses Team mode or `/omc:team`
- includes verification or the staged pipeline instead of only parallel execution

### Example 2: Set up OMC on a fresh Claude Code install

Input:
```text
How do I install oh-my-claudecode and get Team mode working?
```

Output shape:
- uses the plugin marketplace install flow
- includes `/omc:omc-setup`
- mentions the native-teams environment flag when relevant

### Example 3: Pick the right persistent mode

Input:
```text
I need Claude Code to keep iterating until the task is verified complete. Which OMC mode should I use?
```

Output shape:
- routes to `ralph`
- explains why persistence matters
- stays on OMC terminology instead of switching to other frameworks

## Why OMC?

- **Zero configuration** — works out of the box with intelligent defaults
- **Team-first orchestration** — Team is the canonical multi-agent surface
- **Natural language interface** — no commands to memorize
- **Automatic parallelization** — complex tasks distributed across 32 specialized agents
- **Persistent execution** — won't stop until the job is verified complete
- **Cost optimization** — smart model routing saves 30–50% on tokens
- **Real-time visibility** — HUD statusline shows what's happening under the hood

---

## Best practices

1. Treat `omc` as the Claude Code answer surface first, and only mention Codex or Gemini as optional companion lanes.
2. Prefer Team mode for coordinated multi-agent delivery; use `autopilot`, `ralph`, or `ulw` only when the request clearly matches those shapes.
3. Keep setup explicit when the environment is unknown by including `/omc:omc-setup`, `/omc:omc-doctor`, or the native-teams flag.
4. Keep operational follow-through concrete with built-in OMC utilities instead of generic tmux or notification advice.

## References

- https://yeachan-heo.github.io/oh-my-claudecode-website/
- https://yeachan-heo.github.io/oh-my-claudecode-website/docs.html
- https://github.com/Yeachan-Heo/oh-my-claudecode
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/hooks

## Quick Reference

| Action | Command |
|--------|---------|
| Install | `/plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode` |
| Setup | `/omc:omc-setup` |
| Team mode | `/omc:team N:executor "task"` |
| Autopilot | `autopilot: <task>` |
| Ralph loop | `ralph: <task>` |
| Ultrawork | `ulw <task>` |
| Update | `/plugin marketplace update omc && /omc:omc-setup` |
| Debug | `/omc:omc-doctor` |

→ [Full documentation](https://yeachan-heo.github.io/oh-my-claudecode-website) · [GitHub](https://github.com/Yeachan-Heo/oh-my-claudecode)
