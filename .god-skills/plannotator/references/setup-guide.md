# plannotator Setup Guide

> This document contains installation, hook setup, and integration details.
> For agent-facing workflow instructions, see the main [SKILL.md](../SKILL.md).

---

## Pattern 1: Install

```bash
# Install CLI only (macOS / Linux / WSL)
bash scripts/install.sh

# Install CLI and get Claude Code plugin commands
bash scripts/install.sh --with-plugin

# Install CLI + configure Gemini CLI
bash scripts/install.sh --with-gemini

# Install CLI + configure Codex CLI
bash scripts/install.sh --with-codex

# Install CLI + register OpenCode plugin
bash scripts/install.sh --with-opencode

# Install CLI + all AI tool integrations at once
bash scripts/install.sh --all
```

What it does:
- Detects OS (macOS / Linux / WSL / Windows)
- Checks for Obsidian and shows install link if missing: https://obsidian.md/download
- Installs via `https://plannotator.ai/install.sh`
- Verifies install and PATH
- Optionally runs integration scripts for each AI tool
- On Windows: prints PowerShell / CMD commands to run manually

---

## Pattern 2: Hook Setup (Claude Code)

```bash
# Add hook to ~/.claude/settings.json
bash scripts/setup-hook.sh

# Preview what would change (no writes)
bash scripts/setup-hook.sh --dry-run
```

What it does:
- Checks plannotator CLI is installed
- Merges `ExitPlanMode` hook into `~/.claude/settings.json` safely (backs up first)
- Skips if hook already configured
- **Restart Claude Code after running this**

### Alternative: Claude Code Plugin (no manual hook needed)

Run inside Claude Code:

```bash
/plugin marketplace add backnotprop/plannotator
/plugin install plannotator@plannotator
# IMPORTANT: Restart Claude Code after plugin install
```

---

## Pattern 5: Remote / Devcontainer Mode

```bash
# Interactive setup (SSH, devcontainer, WSL)
bash scripts/configure-remote.sh

# View current configuration
bash scripts/configure-remote.sh --show

# Set port directly
bash scripts/configure-remote.sh --port 9999
```

What it does:
- Detects shell profile (`.zshrc`, `.bashrc`, `.profile`)
- Writes `PLANNOTATOR_REMOTE=1` and `PLANNOTATOR_PORT` to shell profile
- Shows SSH and VS Code port-forwarding instructions
- Optionally sets custom browser or share URL

Manual environment variables:

```bash
export PLANNOTATOR_REMOTE=1    # No auto browser open
export PLANNOTATOR_PORT=9999   # Fixed port for forwarding
```

| Variable | Description |
|----------|-------------|
| `PLANNOTATOR_REMOTE` | Remote mode (no auto browser open) |
| `PLANNOTATOR_PORT` | Fixed local/forwarded port |
| `PLANNOTATOR_BROWSER` | Custom browser path/app |
| `PLANNOTATOR_SHARE_URL` | Custom share portal URL |

---

## Pattern 6: Status Check

```bash
bash scripts/check-status.sh
```

Checks all of:
- CLI installed and version
- Claude Code hook in `~/.claude/settings.json` (or plugin detected)
- Gemini CLI hook in `~/.gemini/settings.json`
- Codex CLI `~/.codex/config.toml` developer_instructions
- OpenCode plugin in `opencode.json` + slash commands
- Obsidian installation
- Environment variables configured
- Git repo available for diff review

---

## Pattern 7: Gemini CLI Integration

```bash
# Configure Gemini CLI (hook + GEMINI.md instructions)
bash scripts/setup-gemini-hook.sh

# Preview what would change (no writes)
bash scripts/setup-gemini-hook.sh --dry-run

# Only update settings.json hook (skip GEMINI.md)
bash scripts/setup-gemini-hook.sh --hook-only

# Only update GEMINI.md (skip settings.json)
bash scripts/setup-gemini-hook.sh --md-only
```

What it does:
- Checks plannotator CLI is installed
- Merges `ExitPlanMode` hook into `~/.gemini/settings.json` (same format as Claude Code)
- Appends plannotator usage instructions to `~/.gemini/GEMINI.md`
- Backs up existing files before modifying

Usage in Gemini CLI after setup:

```bash
# Enter planning mode (hook fires when you exit)
gemini --approval-mode plan

# Manual plan review (validated format)
python3 -c "
import json
plan = open('plan.md').read()
print(json.dumps({'tool_input': {'plan': plan, 'permission_mode': 'acceptEdits'}}))
" | plannotator > /tmp/plannotator_feedback.txt 2>&1 &

# Code review after implementation
plannotator review
```

> **Note:** Gemini CLI supports `gemini hooks migrate --from-claude` to auto-migrate existing Claude Code hooks.

---

## Pattern 8: Codex CLI Integration

```bash
# Configure Codex CLI (developer_instructions + prompt file)
bash scripts/setup-codex-hook.sh

# Preview what would change (no writes)
bash scripts/setup-codex-hook.sh --dry-run
```

What it does:
- Adds plannotator instruction to `developer_instructions` in `~/.codex/config.toml`
- Creates `~/.codex/prompts/plannotator.md` (invoke with `/prompts:plannotator`)
- Backs up existing config before modifying

Usage in Codex CLI after setup:

```bash
# Use the plannotator agent prompt
/prompts:plannotator

# Manual plan review (validated format)
python3 -c "
import json
plan = open('plan.md').read()
print(json.dumps({'tool_input': {'plan': plan, 'permission_mode': 'acceptEdits'}}))
" | plannotator > /tmp/plannotator_feedback.txt 2>&1 &

# Code review after implementation
plannotator review HEAD~1
```

> Note: `plannotator plan -` with heredoc/echo can fail with `Failed to parse hook event from stdin`. Use the python3 JSON format above.

---

## Pattern 9: Obsidian Integration Setup

Auto-save approved plans to your Obsidian vault with YAML frontmatter and tags.

### Prerequisites

1. **Install Obsidian**: https://obsidian.md/download
2. **Create a Vault**: Open Obsidian → Create new vault → Choose location
   - Example: `~/Documents/Obsidian/MyVault`
3. **Verify Vault Exists**: Obsidian creates `obsidian.json` config after first vault creation

```bash
# Check Obsidian installation (macOS)
ls /Applications/Obsidian.app

# Check Obsidian config exists (vault detection depends on this)
# macOS
cat ~/Library/Application\ Support/obsidian/obsidian.json
# Linux
cat ~/.config/obsidian/obsidian.json
# Windows
cat %APPDATA%/obsidian/obsidian.json
```

### Step-by-Step Setup

```bash
# Step 1: Verify Obsidian is installed and has at least one vault
bash scripts/check-status.sh

# Step 2: Trigger a plan review (any method)
# Claude Code: Shift+Tab×2 → plan mode → exit plan mode
# Gemini CLI: gemini --approval-mode plan
# OpenCode: Agent creates a plan

# Step 3: In the plannotator UI:
#   1. Click ⚙️ (Settings gear icon)
#   2. Go to "Saving" tab
#   3. Toggle ON "Obsidian Integration"
#   4. Select your vault from dropdown (auto-detected)
#      - Or enter custom path if vault not detected
#   5. Set folder name (default: "plannotator")

# Step 4: Approve a plan to test the integration
#   - Click "Approve" in the plannotator UI
#   - Check your vault for the saved file
```

### Obsidian Configuration Options

| Setting | Description | Default |
|---------|-------------|---------|
| **Vault** | Path to Obsidian vault | Auto-detected |
| **Folder** | Subfolder in vault for plans | `plannotator` |
| **Custom Path** | Manual path if auto-detect fails | - |

### Saved File Format

```
Filename: {Title} - {Month} {Day}, {Year} {Hour}-{Minute}{am/pm}.md
Example:  User Authentication - Feb 22, 2026 10-45pm.md
```

```yaml
---
created: 2026-02-22T22:45:30.000Z
source: plannotator
tags: [plannotator, project-name, typescript, ...]
---
```

### Folder Organization

```
vault/plannotator/
├── approved/          ← approved plans
├── denied/            ← rejected plans
└── 2026-02/           ← monthly archive
```

### Bear Notes (Alternative)

If you prefer Bear Notes over Obsidian:

1. Toggle ON "Bear Notes" in Settings → Saving tab
2. Plans are saved via `bear://x-callback-url/create`
3. Tags are appended as hashtags
4. Validate callback from terminal:

```bash
open "bear://x-callback-url/create?title=Plannotator%20Check&text=Bear%20callback%20OK"
```

---

## Pattern 10: Manual Save via Export → Notes Tab

Save the current plan to Obsidian or Bear Notes at any time — without approving or denying.

1. Click **Export** button in the plannotator UI toolbar
2. Click the **Notes** tab (not Share or Annotations)
3. Click **Save** next to Obsidian or Bear, or **Save All** for both

Requirements:
- plannotator must be running in **hook mode** (normal ExitPlanMode hook invocation)
- Obsidian/Bear must be configured in Settings → Saving tab
- Settings are stored in **cookies** (not localStorage)

---

## Troubleshooting

**Vault not detected:**
```bash
ls ~/Library/Application\ Support/obsidian/obsidian.json  # macOS
# If missing, open Obsidian and create a vault first
open /Applications/Obsidian.app
```

**Plans not saving:**
```bash
ls -la ~/path/to/vault/plannotator/
# Check browser console for errors (F12 → Console)
```

**Export → Notes tab Save buttons not working:**
- Requires plannotator running in hook mode (stdin JSON input)
- In CLI `review`/`annotate` modes, `/api/save-notes` endpoint is inactive

**Settings not visible in automated/headless browsers:**
- Settings are stored in cookies (not localStorage)
- Automated/headless profiles (Playwright, Puppeteer) use isolated cookie jars

**Bear export not working:**
- Confirm Bear app is installed and opened at least once
- Run: `open "bear://x-callback-url/create?title=Test&text=OK"`

**Settings not persisting:**
- Ensure cookies are enabled for localhost
- Settings persist across different ports

---

## References

- [GitHub: backnotprop/plannotator](https://github.com/backnotprop/plannotator)
- [Official site: plannotator.ai](https://plannotator.ai)
- [Obsidian download](https://obsidian.md/download)
- [Hook README](https://github.com/backnotprop/plannotator/blob/main/apps/hook/README.md)
- [OpenCode plugin README](https://github.com/backnotprop/plannotator/blob/main/apps/opencode-plugin/README.md)
