# Changelog — agentation SKILL.md autoresearch

## Run: 2026-03-22

### Baseline Analysis

**File**: `.god-skills/agentation/SKILL.md`
**Lines**: 777
**Score**: 9/20 (45%)

#### Issues Found

1. **Watch loop buried at line 475** — 440 lines of installation/setup content precede the core agent pattern. An agent reading for instructions would never reach it without significant context budget.

2. **elementPath grep connection not prominent** — mentioned once in Section 6 Pattern 2 and once in Best Practices (#6), but not surfaced as a Key Rule. Most agents miss it.

3. **Phase guard invisible** — The critical `verify_ui`-only constraint lives in Section 12 (line 716), the last substantive section. An agent executing in the wrong phase gets no early warning.

4. **Platform detection fragmented** — Copy-Paste vs MCP split exists in Section 2 architecture table, but is buried under: Architecture → Installation → React Setup → MCP Setup (5 platform variants) before any workflow appears.

5. **70-line bash script inline** — The setup-agentation-mcp.sh script (lines 369–439) is not agent-relevant and bloats the skill considerably.

6. **Platform config repeated 5 times** — Claude, Codex, Gemini, OpenCode, and Universal each get full config blocks with JSON/TOML. This is human setup docs, not agent instructions.

### Mutation Applied

**Target lines**: 250–300 (achieved: 276)
**Strategy**: Agent-first restructure — Key Rules up front, setup extracted to `references/`

#### Changes Made

| Change | Before | After |
|--------|--------|-------|
| Key Rules section | None | 5 rules at top (NEVER pattern) |
| Watch loop position | Line 475 (Section 6) | Immediately after Key Rules |
| elementPath guidance | Buried in Pattern 2 + BP#6 | Key Rule #3 + Watch Loop |
| Phase guard | Section 12, line 716 | Key Rule #5 |
| Platform detection | Fragmented across sections | Compact Mode Detection section |
| Setup content | Inline 440 lines | Extracted to `references/setup-guide.md` |
| Platform configs | 5 full config blocks | Compact support table (5 rows) |
| Bash setup script | 70 lines inline | Moved to references |
| HTTP REST API | Full listing | Moved to references |
| Environment vars | Full table | Moved to references |
| Programmatic utils | Full import block | Moved to references |

#### Extracted to references/setup-guide.md

- All installation instructions (npm install commands)
- Platform-specific MCP config (Claude, Codex, Gemini, OpenCode, Universal)
- React component setup (Basic, Next.js App Router, Next.js Pages Router)
- Full Props reference table
- Bash setup script (setup-agentation-mcp.sh)
- HTTP REST API reference (port 4747)
- Environment variables table
- Programmatic utilities import block

#### Kept in SKILL.md

- Frontmatter (unchanged)
- Key Rules section (NEW — 5 rules)
- Mode Detection (MCP vs Copy-Paste — condensed)
- MCP Tools table (complete)
- Watch Loop (Primary Pattern — moved to top)
- Annotation lifecycle (acknowledge → resolve/dismiss)
- elementPath guidance (explicit grep connection)
- Annotation schema (compacted)
- omg integration (condensed)
- Best practices (condensed to inline list)
- Platform support table (compact — replaces 5 full config blocks)
- References section

### Score Comparison

| Eval | Baseline T1 | Baseline T2 | Baseline T3 | Baseline T4 | Mutation T1 | Mutation T2 | Mutation T3 | Mutation T4 |
|------|-------------|-------------|-------------|-------------|-------------|-------------|-------------|-------------|
| EVAL1 Watch Loop | 0 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
| EVAL2 Ack-Resolve | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 0 |
| EVAL3 elementPath | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 0 |
| EVAL4 Platform | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| EVAL5 Phase Guard | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
| **Total** | **2** | **3** | **2** | **2** | **5** | **5** | **5** | **3** |

**Baseline total**: 9/20 (45%)
**Mutation total**: 18/20 (90%)
**Improvement**: +9 points (+45%)

### Remaining Gap (2/20)

T4 (copy-paste, no server) scores 3/5 on the mutation because:
- EVAL2 (Acknowledge-Resolve): N/A in copy-paste mode — no MCP server, no tool calls
- EVAL3 (elementPath grep): N/A in copy-paste mode — agent gets markdown from human, doesn't need to grep

These are not fixable without blurring the copy-paste/MCP distinction. The 2-point gap is acceptable.
