# agentation Setup Guide

> Human-facing installation and configuration reference.
> Agent instructions live in [SKILL.md](../../../SKILL.md).

---

## Installation

### React Component (toolbar)

```bash
npm install agentation -D
# or: pnpm add agentation -D  /  yarn add agentation -D  /  bun add agentation -D
```

Requirements: React 18+, desktop browser, zero runtime deps beyond React (desktop only — no mobile).

### MCP Server — Universal Setup (Recommended)

Auto-detects all installed agents and configures them (Claude Code, Cursor, Codex, Windsurf, and 9+ more):

```bash
npx add-mcp "npx -y agentation-mcp server"
```

Or install manually:

```bash
npm install agentation-mcp -D
npx agentation-mcp server          # HTTP :4747 + MCP stdio
npx agentation-mcp server --port 8080   # custom port
npx agentation-mcp doctor          # verify setup
```

### Claude Code Skill (Minimal Setup)

```bash
npx skills add benjitaylor/agentation
# then in Claude Code:
/agentation
```

---

## React Component Setup

### Basic (Copy-Paste mode — no server needed)

```tsx
import { Agentation } from 'agentation';

function App() {
  return (
    <>
      <YourApp />
      {process.env.NODE_ENV === 'development' && <Agentation />}
    </>
  );
}
```

### Next.js App Router

```tsx
// app/layout.tsx
import { Agentation } from 'agentation';

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html>
      <body>
        {children}
        {process.env.NODE_ENV === 'development' && (
          <Agentation endpoint="http://localhost:4747" />
        )}
      </body>
    </html>
  );
}
```

### Next.js Pages Router

```tsx
// pages/_app.tsx
import { Agentation } from 'agentation';

export default function App({ Component, pageProps }) {
  return (
    <>
      <Component {...pageProps} />
      {process.env.NODE_ENV === 'development' && (
        <Agentation endpoint="http://localhost:4747" />
      )}
    </>
  );
}
```

### Full Props Reference

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `endpoint` | `string` | — | MCP server URL for Agent Sync mode |
| `sessionId` | `string` | — | Pre-existing session ID to join |
| `onAnnotationAdd` | `(a: Annotation) => void` | — | Callback when annotation created |
| `onAnnotationDelete` | `(a: Annotation) => void` | — | Callback when annotation deleted |
| `onAnnotationUpdate` | `(a: Annotation) => void` | — | Callback when annotation edited |
| `onAnnotationsClear` | `(a: Annotation[]) => void` | — | Callback when all cleared |
| `onCopy` | `(markdown: string) => void` | — | Callback with markdown on copy |
| `onSubmit` | `(output: string, annotations: Annotation[]) => void` | — | On "Send Annotations" click |
| `copyToClipboard` | `boolean` | `true` | Set false to suppress clipboard write |
| `onSessionCreated` | `(sessionId: string) => void` | — | Called on new session creation |
| `webhookUrl` | `string` | — | Webhook URL to receive annotation events |

---

## Platform-Specific MCP Config

### Claude Code

**Option A — CLI (recommended):**
```bash
claude mcp add agentation -- npx -y agentation-mcp server
```

**Option B — config file** (`~/.claude/claude_desktop_config.json` for global, `.claude/mcp.json` for project):
```json
{
  "mcpServers": {
    "agentation": {
      "command": "npx",
      "args": ["-y", "agentation-mcp", "server"]
    }
  }
}
```

**Interactive wizard:**
```bash
npx agentation-mcp init
```

**UserPromptSubmit hook** — auto-inject pending annotations on every message.
Add to `.claude/settings.json` (project) or `~/.claude/settings.json` (global):
```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "type": "command",
        "command": "curl -sf --connect-timeout 1 http://localhost:4747/pending 2>/dev/null | python3 -c \"import sys,json;d=json.load(sys.stdin);c=d['count'];exit(0)if c==0 else[print(f'\\n=== AGENTATION: {c} UI annotations ===\\n'),*[print(f\\\"[{i+1}] {a['element']} ({a['elementPath']})\\n    {a['comment']}\\n\\\")for i,a in enumerate(d['annotations'])],print('=== END ===\\n')]\" 2>/dev/null;exit 0"
      }
    ]
  }
}
```

---

### Codex CLI

Add to `~/.codex/config.toml`:

```toml
[[mcp_servers]]
name = "agentation"
command = "npx"
args = ["-y", "agentation-mcp", "server"]

developer_instructions = """
When user says "watch mode" or "agentation watch", call agentation_watch_annotations in a loop.
For each annotation: acknowledge it, fix the code using the elementPath CSS selector, resolve with summary.
"""
```

Restart Codex CLI after editing.

---

### Gemini CLI

**Option A — CLI:**
```bash
gemini mcp add agentation npx -y agentation-mcp server
# or with explicit scope
gemini mcp add -s user agentation npx -y agentation-mcp server
```

**Option B — config file** (`~/.gemini/settings.json` for global, `.gemini/settings.json` for project):
```json
{
  "mcpServers": {
    "agentation": {
      "command": "npx",
      "args": ["-y", "agentation-mcp", "server"]
    }
  },
  "hooks": {
    "AfterAgent": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "curl -sf --connect-timeout 1 http://localhost:4747/pending 2>/dev/null | python3 -c \"import sys,json;d=json.load(sys.stdin);c=d.get('count',0);[print(f'[agentation] {c} pending annotations'),exit(1)]if c>0 else exit(0)\" 2>/dev/null;exit 0",
            "description": "Check for pending agentation annotations"
          }
        ]
      }
    ]
  }
}
```

---

### OpenCode

Add to `~/.config/opencode/opencode.json`:

```json
{
  "mcp": {
    "agentation": {
      "type": "local",
      "command": ["npx", "-y", "agentation-mcp", "server"],
      "environment": {
        "AGENTATION_STORE": "sqlite",
        "AGENTATION_EVENT_RETENTION_DAYS": "7"
      }
    }
  }
}
```

Restart OpenCode after editing.

---

## Quick-Setup Script

Save and run `bash setup-agentation-mcp.sh [--all | --claude | --codex | --gemini | --opencode]`:

```bash
#!/usr/bin/env bash
# setup-agentation-mcp.sh — Register agentation MCP for all agent platforms

set -euo pipefail
SETUP_CLAUDE=false; SETUP_CODEX=false; SETUP_GEMINI=false; SETUP_OPENCODE=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --claude) SETUP_CLAUDE=true ;;
    --codex) SETUP_CODEX=true ;;
    --gemini) SETUP_GEMINI=true ;;
    --opencode) SETUP_OPENCODE=true ;;
    --all) SETUP_CLAUDE=true; SETUP_CODEX=true; SETUP_GEMINI=true; SETUP_OPENCODE=true ;;
  esac
  shift
done
[[ "$SETUP_CLAUDE$SETUP_CODEX$SETUP_GEMINI$SETUP_OPENCODE" == "falsefalsefalsefalse" ]] && \
  SETUP_CLAUDE=true && SETUP_CODEX=true && SETUP_GEMINI=true && SETUP_OPENCODE=true

MCP_JSON='"agentation": {"command": "npx", "args": ["-y", "agentation-mcp", "server"]}'

if [[ "$SETUP_CLAUDE" == "true" ]]; then
  mkdir -p ~/.claude
  CFG=~/.claude/claude_desktop_config.json
  if [[ -f "$CFG" ]] && command -v jq &>/dev/null; then
    jq ".mcpServers += {$MCP_JSON}" "$CFG" > "$CFG.tmp" && mv "$CFG.tmp" "$CFG"
  else
    echo "{\"mcpServers\": {$MCP_JSON}}" > "$CFG"
  fi
  echo "Claude Code: $CFG"
fi

if [[ "$SETUP_CODEX" == "true" ]]; then
  mkdir -p ~/.codex
  CFG=~/.codex/config.toml
  if ! grep -q "agentation" "$CFG" 2>/dev/null; then
    printf '\n[[mcp_servers]]\nname = "agentation"\ncommand = "npx"\nargs = ["-y", "agentation-mcp", "server"]\n' >> "$CFG"
  fi
  echo "Codex CLI: $CFG"
fi

if [[ "$SETUP_GEMINI" == "true" ]]; then
  mkdir -p ~/.gemini
  CFG=~/.gemini/settings.json
  if [[ -f "$CFG" ]] && command -v jq &>/dev/null; then
    jq ".mcpServers += {$MCP_JSON}" "$CFG" > "$CFG.tmp" && mv "$CFG.tmp" "$CFG"
  else
    echo "{\"mcpServers\": {$MCP_JSON}}" > "$CFG"
  fi
  echo "Gemini CLI: $CFG"
fi

if [[ "$SETUP_OPENCODE" == "true" ]]; then
  mkdir -p ~/.config/opencode
  CFG=~/.config/opencode/opencode.json
  ENTRY='"agentation": {"type": "local", "command": ["npx", "-y", "agentation-mcp", "server"]}'
  if [[ -f "$CFG" ]] && command -v jq &>/dev/null; then
    jq ".mcp += {$ENTRY}" "$CFG" > "$CFG.tmp" && mv "$CFG.tmp" "$CFG"
  else
    echo "{\"mcp\": {$ENTRY}}" > "$CFG"
  fi
  echo "OpenCode: $CFG"
fi

echo ""
echo "Done. Restart your agent(s) and run: npx agentation-mcp server"
```

---

## HTTP REST API (port 4747)

```bash
# Sessions
POST   /sessions                     # Create session
GET    /sessions                     # List all sessions
GET    /sessions/:id                 # Get session + annotations

# Annotations
POST   /sessions/:id/annotations     # Add annotation
GET    /annotations/:id              # Get annotation
PATCH  /annotations/:id              # Update annotation
DELETE /annotations/:id              # Delete annotation
GET    /sessions/:id/pending         # Pending for session
GET    /pending                      # ALL pending across sessions

# Events (SSE streaming)
GET    /sessions/:id/events          # Session stream
GET    /events                       # Global stream (?domain=filter)

# Health
GET    /health
GET    /status
```

---

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `AGENTATION_STORE` | `memory` or `sqlite` | `sqlite` |
| `AGENTATION_WEBHOOK_URL` | Single webhook URL | — |
| `AGENTATION_WEBHOOKS` | Comma-separated webhook URLs | — |
| `AGENTATION_EVENT_RETENTION_DAYS` | Days to keep events | `7` |

SQLite storage: `~/.agentation/store.db`

---

## Programmatic Utilities

```typescript
import {
  identifyElement, identifyAnimationElement,
  getElementPath, getNearbyText, getElementClasses,
  isInShadowDOM, getShadowHost, closestCrossingShadow,
  loadAnnotations, saveAnnotations, getStorageKey,
  type Annotation, type Session, type ThreadMessage,
} from 'agentation';
```

---

## References

- [agentation repo](https://github.com/benjitaylor/agentation)
- [agentation npm](https://www.npmjs.com/package/agentation)
- [agentation-mcp npm](https://www.npmjs.com/package/agentation-mcp)
- [Gemini CLI MCP docs](https://github.com/google-gemini/gemini-cli/blob/main/docs/tools/mcp-server.md)
- [add-mcp](https://github.com/neondatabase/add-mcp)
