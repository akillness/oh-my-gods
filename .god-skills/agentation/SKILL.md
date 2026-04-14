---
name: agentation
description: >
  Capture human UI feedback as structured annotations that agents can act on
  through MCP watch loops or pasted payloads. Use when reviewing or iterating on
  a web UI with precise selectors, bounding boxes, and React component context.
  Triggers on: agentation, annotate, agentation watch, UI review, visual
  feedback, fix this element, design critique.
compatibility: React 18+, Node.js 18+
allowed-tools: Read Write Bash Grep Glob
metadata:
  tags: ui-feedback, browser-annotation, visual-feedback, mcp, react, ai-agent, design-review, css-selector
  platforms: Claude Code, Codex, Gemini CLI, OpenCode, Cursor, Windsurf, ChatGPT
  keyword: agentation
  version: 1.1.0
  source: benjitaylor/agentation
---

# agentation — Visual UI Feedback Bridge for AI Agents

> **The missing link between human eyes and agent code.**
> Instead of describing "the blue button in the sidebar," you hand the agent `.sidebar > button.primary`. It can `grep` for that directly.

---

## When to use this skill

- When a human wants to mark exact UI elements and send structured feedback to an agent
- When MCP watch mode is available and the agent should stay in a live annotation loop
- When a copied annotation payload includes `elementPath`, `reactComponents`, or bounding box data
- When `omg` enters `verify` or `verify_ui` and UI feedback should drive the next fix

## Instructions

### Step 1: Respect phase and lifecycle guardrails

1. **NEVER run agentation outside `verify` or `verify_ui` phase** — when used with omg, check `omg-state.json` phase before starting. Never run during `plan` phase.
2. **ALWAYS call `agentation_watch_annotations` as the primary entry point** — do not poll REST endpoints or wait for copy-paste when MCP is available.
3. **ALWAYS use `elementPath` as the grep/search target** — it is a valid CSS selector pointing to the exact element. Use it with `Grep` or `Glob` to find the corresponding source code.
4. **ALWAYS call `agentation_acknowledge` before making any code changes** — signals the human that the agent is working on the annotation.
5. **ALWAYS call `agentation_resolve` with a summary when done** — or `agentation_dismiss` with a required reason if the annotation cannot be acted on.

---

### Step 2: Choose the operating mode

Choose the operating mode before proceeding:

| Mode | When to use | Entry point |
|------|-------------|-------------|
| **MCP Watch Loop** | MCP server is running (`npx agentation-mcp server`), `<Agentation endpoint="...">` is mounted | `agentation_watch_annotations` |
| **Copy-Paste** | No MCP server, human pastes markdown into chat | Read the pasted markdown — `elementPath`, `comment`, `boundingBox` are included |

**MCP mode is always preferred for iterative review cycles.**

To check if MCP server is running: `curl -sf http://localhost:4747/health`

---

### Step 3: Use the correct runtime surface

| Tool | Parameters | Description |
|------|-----------|-------------|
| `agentation_watch_annotations` | `sessionId?`, `batchWindowSeconds?` (default 10, max 60), `timeoutSeconds?` (default 120, max 300) | **Block until new annotations arrive** — primary watch-loop tool |
| `agentation_acknowledge` | `annotationId: string` | Mark annotation as acknowledged (agent is working on it) |
| `agentation_resolve` | `annotationId: string, summary?: string` | Mark as resolved with optional summary |
| `agentation_dismiss` | `annotationId: string, reason: string` | Dismiss with required reason |
| `agentation_reply` | `annotationId: string, message: string` | Add reply to annotation thread |
| `agentation_get_pending` | `sessionId: string` | Get pending annotations for a session |
| `agentation_get_all_pending` | none | Get pending annotations across ALL sessions |
| `agentation_get_session` | `sessionId: string` | Get session with all annotations |
| `agentation_list_sessions` | none | List all active annotation sessions |

---

### Step 4: Run the MCP watch loop

This is the canonical agent workflow. Use this unless the human explicitly provides copy-pasted markdown.

```
1. agentation_watch_annotations()          ← blocks up to 120s for new annotations
2. For each annotation received:
   a. agentation_acknowledge(annotationId) ← signal human that agent is working
   b. Grep(elementPath)                    ← find the source code for this element
      OR search reactComponents field for component name
   c. Make the minimal code change described in annotation.comment
   d. agentation_resolve(annotationId, "Changed X to Y") ← or agentation_dismiss(id, reason)
3. agentation_watch_annotations()          ← loop again
```

### elementPath → Code Search

```
annotation.elementPath = "body > main > section.hero > button.cta"
→ Grep(".cta", src/)                  # search by CSS class
→ Grep("button.cta", src/)            # more specific
→ Grep(reactComponents, src/)         # "App > Dashboard > HeroButton" → search component name
```

`elementPath` is always a valid CSS selector. Start with the most specific class or ID, broaden if no match.

### Annotation Lifecycle

```
pending → acknowledged → resolved
                      ↘ dismissed (requires reason string)
```

Process `severity: "blocking"` annotations first within a batch.

### Watch Loop Instruction Block (add to CLAUDE.md / GEMINI.md / Codex developer_instructions)

```markdown
When I say "watch mode", "annotate", or "agentation watch", call agentation_watch_annotations in a loop.
For each annotation received:
  1. Call agentation_acknowledge(annotationId)
  2. Use elementPath to locate the code: Grep(elementPath) or search for CSS class/component name
  3. Make the minimal change described in the comment
  4. Call agentation_resolve(annotationId, "<brief summary of what changed>")
Continue watching until I say stop, or until timeout.
```

---

### Step 5: Handle copy-paste fallback

When the human clicks "Copy" in the toolbar and pastes markdown into chat:

```
1. Read the pasted markdown — it contains:
   - elementPath: CSS selector for the element
   - comment: human's feedback
   - boundingBox: pixel coordinates
   - reactComponents: component tree (React apps)
2. Use elementPath or reactComponents to grep the codebase
3. Make the change
4. Reply with summary (no MCP tool calls needed)
```

No `agentation_acknowledge` / `agentation_resolve` calls are needed in copy-paste mode.

---

### Step 6: Handle hook-injected annotations

Platform hooks (UserPromptSubmit on Claude, AfterAgent on Gemini) auto-inject pending annotations into every agent message. No "watch mode" needed — annotations appear in context automatically. Respond to them using the watch loop flow (acknowledge → fix → resolve).

---

### Step 7: Support autonomous critique loops

Two-agent setup for fully autonomous UI review:

- **Session 1 (Critic)**: `agent-browser` navigates app, clicks elements via agentation toolbar, adds critique annotations — which flow to MCP server automatically.
- **Session 2 (Fixer)**: `agentation_watch_annotations` → acknowledge → edit → resolve → loop.

---

## Examples

### Example 1: MCP watch mode during UI verification

Input:
```text
Watch agentation annotations for this session and fix anything marked blocking first.
```

Output shape:
- checks the health endpoint or otherwise confirms MCP watch mode is available
- calls `agentation_watch_annotations`
- acknowledges each annotation before editing
- uses `elementPath` or `reactComponents` to locate the code
- resolves or dismisses each annotation with a short summary

### Example 2: Copy-pasted annotation with no server

Input:
```text
The user pasted an agentation payload for `body > main > button.cta` and wants the button label fixed.
```

Output shape:
- reads the pasted payload directly instead of waiting on MCP
- searches by `elementPath` or `reactComponents`
- makes the requested UI change
- replies with a concise summary without MCP acknowledgment calls

### Example 3: omg phase guard

Input:
```text
Run agentation while omg is still in plan phase.
```

Output shape:
- refuses to start the watch loop in `plan`
- points the run back to `plannotator` or the planning surface
- preserves `agentation` for `verify` or `verify_ui`

---

## Annotation Schema (compact)

```typescript
type Annotation = {
  id: string;
  comment: string;           // human's feedback text
  elementPath: string;       // CSS selector → PRIMARY GREP TARGET
  element: string;           // tag name: "button", "div", etc.
  reactComponents?: string;  // "App > Dashboard > Button" → component grep target
  boundingBox?: { x: number; y: number; width: number; height: number };
  selectedText?: string;
  nearbyText?: string;
  cssClasses?: string;
  intent?: "fix" | "change" | "question" | "approve";
  severity?: "blocking" | "important" | "suggestion";
  status?: "pending" | "acknowledged" | "resolved" | "dismissed";
  sessionId?: string;
  url?: string;
  thread?: { role: string; message: string; timestamp: string }[];
  createdAt?: string;
  resolvedAt?: string;
  resolvedBy?: "human" | "agent";
};
```

---

## omg Integration

agentation is the **VERIFY_UI** phase of the omg skill. It never runs during `plan` phase (plannotator's domain).

| Tool | Allowed phase | Guard |
|------|--------------|-------|
| plannotator | `plan` only | `omg-state.json` → `phase === "plan"` |
| agentation | `verify` / `verify_ui` only | `omg-state.json` → `phase === "verify_ui"` |

### omg Evaluation Flow

```
omg "<task>"
 [1] PLAN      → plannotator loop (approve plan.md)
 [2] EXECUTE   → team/bmad
 [3] VERIFY
     ├─ agent-browser snapshot
     ├─ Pre-flight: GET /health, GET /sessions, GET /pending
     └─ annotate → VERIFY_UI (agentation watch loop)
         ├─ ACK → FIND (elementPath grep) → FIX → RESOLVE
         ├─ RE-SNAPSHOT (agent-browser)
         └─ update agentation fields in omg-state.json
 [4] CLEANUP
```

### Pre-flight Check (before entering VERIFY_UI)

```bash
curl -sf http://localhost:4747/health    # server running?
curl -sf http://localhost:4747/sessions  # component mounted?
curl -sf http://localhost:4747/pending   # annotations waiting?
```

Pass all three → set `omg-state.json`: `phase: "verify_ui"`, `agentation.active: true`.

### Trigger Keywords

| Keyword | Platform | Action |
|---------|----------|--------|
| `annotate` | Claude Code | `agentation_watch_annotations` MCP blocking call |
| `annotate` | Codex | `ANNOTATE_READY` signal → `omg-notify.py` HTTP polling |
| `annotate` | Gemini | GEMINI.md instruction: HTTP REST polling pattern |
| `/omg-annotate` | OpenCode | opencode.json `mcp.agentation` + instructions |
| `agentui` | All | Deprecated alias — same behavior as `annotate` |
| `UI review` | All | Same as `annotate` |

---

## Platform Support

| Platform | MCP config location | Hook type |
|----------|--------------------|-----------|
| Claude Code | `~/.claude/claude_desktop_config.json` or `.claude/mcp.json` | `hooks.UserPromptSubmit` in `settings.json` |
| Codex CLI | `~/.codex/config.toml` | `developer_instructions` |
| Gemini CLI | `~/.gemini/settings.json` or `.gemini/settings.json` | `hooks.AfterAgent` |
| OpenCode | `~/.config/opencode/opencode.json` | Skills system |
| Cursor / Windsurf | `.cursor/mcp.json` / `.windsurf/mcp.json` | — |

**Fastest setup (auto-detects all platforms):**
```bash
npx add-mcp "npx -y agentation-mcp server"
```

Full setup instructions: [`references/setup-guide.md`](./references/setup-guide.md)

---

## Best practices

1. Gate `<Agentation>` with `NODE_ENV === 'development'` — never ship to production.
2. Use MCP watch-loop over copy-paste for iterative cycles — eliminates context switching.
3. Call `agentation_acknowledge` immediately when starting a fix — signals the human.
4. Include a `summary` in `agentation_resolve` — gives human traceability.
5. Process `severity: "blocking"` annotations first in each batch.
6. Use `elementPath` as the primary grep target — it is a valid CSS selector.
7. Use `reactComponents` field for React codebases — matches component names directly.
8. For autonomous self-driving: use `agent-browser` in headed mode with agentation mounted.

---

## References

- Setup guide: [`references/setup-guide.md`](./references/setup-guide.md)
- [agentation repo](https://github.com/benjitaylor/agentation)
- [agentation npm](https://www.npmjs.com/package/agentation)
- [agentation-mcp npm](https://www.npmjs.com/package/agentation-mcp)
- [agent-browser skill](../agent-browser/SKILL.md)
- [omg skill](../omg/SKILL.md)

## Metadata

- Version: 1.2.0
- Source: benjitaylor/agentation (PolyForm Shield 1.0.0)
- Packages: `agentation@2.2.1`, `agentation-mcp@1.2.0`
- Last updated: 2026-03-22
- Scope: UI annotation bridge for human-agent feedback loops — Claude Code, Codex, Gemini CLI, OpenCode
