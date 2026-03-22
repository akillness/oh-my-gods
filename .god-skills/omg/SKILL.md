---
name: omg
description: "OMG — Integrated AI agent orchestration skill. Plan with ralph+plannotator, execute with team/bmad, verify browser behavior with agent-browser, apply UI feedback with agentation(annotate), auto-cleanup worktrees after completion. Supports Claude, Codex, Gemini CLI, and OpenCode. Install: ralph, omc, omx, ohmg, bmad, plannotator, agent-browser, agentation."
compatibility: "Requires git, node>=18, bash. Optional: bun, docker."
allowed-tools: Read Write Bash Grep Glob Task
metadata:
  tags: omg, orchestration, ralph, plannotator, agentation, annotate, agentui, UI검토, team, bmad, omc, omx, ohmg, agent-browser, multi-agent, workflow, worktree-cleanup, browser-verification, ui-feedback
  platforms: Claude, Codex, Gemini, OpenCode
  keyword: omg
  version: 1.5.0
  source: supercent-io/skills-template
---

# OMG — Integrated Agent Orchestration

> Keyword: `omg` · `annotate` · `UI검토` · `agentui (deprecated)` | Platforms: Claude Code · Codex CLI · Gemini CLI · OpenCode
>
> Flow: **PLAN** (ralph+plannotator) → **EXECUTE** (team/bmad) → **VERIFY** (agent-browser) → **CLEANUP** (worktree)
>
> Setup & config: see `references/setup-guide.md` | Detailed flow diagrams: see `references/FLOW.md`

---

## NEVER Rules (absolute constraints — apply to every STEP)

1. **NEVER enter EXECUTE without `plan_approved: true`**
2. **NEVER run plannotator with `&` (background)** — must run blocking
3. **NEVER process draft annotations before explicit submit/onSubmit**
4. **NEVER reopen the same unchanged plan** after `approved`, `manual_approved`, `feedback_required`, or `infrastructure_blocked`
5. **NEVER fall back to single-agent execution in Claude Code** — if team mode is unavailable, error and exit
6. **NEVER skip the PLAN step** — every OMG invocation must plan first

---

## State & Recovery

Authoritative state: `.omc/state/omg-state.json`

**At the start of each STEP**, record the checkpoint:
```python
# Update checkpoint and updated_at in omg-state.json (see references/checkpoint-helpers.md for full snippet)
# phase = "plan" | "execute" | "verify" | "cleanup"
```

**On error**: set `last_error` and increment `retry_count`. If `retry_count >= 3`, ask the user whether to abort.

**On restart**: read `checkpoint` from state file and resume from that phase.

---

## STEP 0: State File Bootstrap (required — always first)

```bash
mkdir -p .omc/state .omc/plans .omc/logs
mkdir -p .omg/long-term .omg/short-term
```

If `.omc/state/omg-state.json` does not exist, create it:

```json
{
  "phase": "plan",
  "task": "<detected task>",
  "plan_approved": false,
  "plan_gate_status": "pending",
  "plan_current_hash": null,
  "last_reviewed_plan_hash": null,
  "last_reviewed_plan_at": null,
  "plan_review_method": null,
  "team_available": null,
  "retry_count": 0,
  "last_error": null,
  "checkpoint": null,
  "created_at": "<ISO 8601>",
  "updated_at": "<ISO 8601>",
  "agentation": {
    "active": false,
    "session_id": null,
    "keyword_used": null,
    "submit_gate_status": "idle",
    "submit_signal": null,
    "submit_received_at": null,
    "submitted_annotation_count": 0,
    "started_at": null,
    "timeout_seconds": 120,
    "annotations": { "total": 0, "acknowledged": 0, "resolved": 0, "dismissed": 0, "pending": 0 },
    "completed_at": null,
    "exit_reason": null
  }
}
```

Notify: `"OMG activated. Phase: PLAN. Add the 'annotate' keyword if a UI feedback loop is needed."`

---

## Project Management (.omg/ folder)

Three-phase development flow:
```
PLANNING (기획) → DEVELOPMENT (개발) → QA (품질검증)
```

Each OMG execution maps to one phase:
- **PLANNING**: Read `.omg/long-term/` (concept, rules, validation), check backlog, write plan.md
- **DEVELOPMENT**: Read `.omg/short-term/` (system, unit-tests, flow-tests), move backlog → progress, execute
- **QA**: Run tests per `.omg/short-term/unit-tests.md` + `flow-tests.md`, validate against `.omg/long-term/validation.md`

### Document Lifecycle

At each STEP the agent MUST:
1. **Check**: Read `.omg/backlog.md` and `.omg/progress.md` at STEP 0
2. **Update**: Move completed items from `progress.md` → `history.md` at STEP 4 (CLEANUP)
3. **Prune**: Remove empty plan files in `.omg/short-term/` after all items are completed
4. **Add**: Append newly discovered tasks to `backlog.md` during execution

### Flow Map

```
STEP 0: Bootstrap
  └─ mkdir -p .omg/{long-term,short-term}
  └─ Read .omg/backlog.md, .omg/progress.md
  └─ Load context from .omg/long-term/ into plan

STEP 1: PLAN
  └─ Reference .omg/long-term/concept.md for goals
  └─ Reference .omg/long-term/rules.md for constraints
  └─ Move relevant backlog items to progress.md

STEP 2: EXECUTE
  └─ Follow .omg/short-term/ plans
  └─ Update progress.md with status

STEP 3: VERIFY
  └─ Validate against .omg/long-term/validation.md
  └─ Check .omg/short-term/unit-tests.md + flow-tests.md

STEP 4: CLEANUP
  └─ Archive completed items: progress.md → history.md
  └─ Prune empty short-term plan files
  └─ Add newly discovered tasks to backlog.md
```

---

## STEP 1: PLAN (never skip)

Record checkpoint: `phase="plan"`

### Plan Hash Guard

Before opening the plan gate, check whether the current `plan.md` hash matches `last_reviewed_plan_hash` in state. If match AND `plan_gate_status` is terminal (`approved`/`manual_approved`/`feedback_required`/`infrastructure_blocked`), **skip** — do not reopen.

### Write & Review Plan

1. Write `plan.md` (include goal, steps, risks, completion criteria)
2. Invoke plannotator per platform:

| Platform | Method |
|----------|--------|
| **Claude Code** | `EnterPlanMode` → write plan → `ExitPlanMode` (hook fires plannotator automatically). Do NOT call plannotator via MCP or CLI. |
| **Codex / Gemini / OpenCode** | `bash "${_OMG_SCRIPTS}/plannotator-plan-loop.sh" plan.md "$FEEDBACK_FILE" 3` (blocking, no `&`) |

> For Codex/Gemini/OpenCode: resolve `_OMG_SCRIPTS` by scanning candidate paths (`$OMG_SKILL_DIR/scripts`, `$HOME/.agent-skills/omg/scripts`, etc.) for `plannotator-plan-loop.sh`. If plannotator is missing, auto-install via `bash "${_OMG_SCRIPTS}/ensure-plannotator.sh"`.

3. Check result:
   - **Approved** (`approved: true` / hook returns approved) → set `plan_approved: true`, `phase: "execute"` → **STEP 2**
   - **Not approved** (feedback / `exit 10`) → read feedback, revise `plan.md`, repeat step 2
   - **Infrastructure blocked** (`exit 32` — sandbox/CI) → output `plan.md` to user, ask for manual approval. **WAIT** — do not proceed. On approval: set `plan_gate_status: "manual_approved"` → STEP 2
   - **Session exited 3 times** (`exit 30/31`) → ask user whether to abort or resume

---

## STEP 2: EXECUTE

Record checkpoint: `phase="execute"`

### Pre-flight: Detect Team Availability

Check `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` env var and `~/.claude/settings.json`. Record `team_available` in state.

### Execution Path

| Condition | Action |
|-----------|--------|
| Claude Code + omc + teams enabled | `/omc:team 3:executor "<task>"` (staged pipeline: plan→prd→exec→verify→fix) |
| Claude Code + teams **disabled** | **Early exit**: `exit 1` with error: "OMG requires team mode. Run `bash scripts/setup-claude.sh`, restart, verify `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`." VERIFY and CLEANUP are skipped — this is expected behavior; the workflow terminates at EXECUTE. |
| Codex / Gemini / OpenCode (no team) | BMAD fallback: `/workflow-init` → `/workflow-status` |
| Gemini + ohmg | `bunx oh-my-ag` for multi-agent |
| OpenCode + omx | omx team orchestration |

---

## STEP 3: VERIFY

Record checkpoint: `phase="verify"`

### Browser Verification (when browser UI is present)

```bash
agent-browser snapshot http://localhost:3000
agent-browser snapshot http://localhost:3000 -i   # accessibility tree refs
agent-browser screenshot http://localhost:3000 -o verify.png
```

> Backend/CLI tasks without a browser UI skip this step.

### Decision Point

- `annotate` keyword detected → **STEP 3.1 (VERIFY_UI)**
- No `annotate` → **STEP 4 (CLEANUP)**

---

## STEP 3.1: VERIFY_UI (only when `annotate` keyword detected)

> `agentui` is a backward-compatible alias for `annotate`.

### Pre-flight

```bash
curl -sf --connect-timeout 2 http://localhost:4747/health
```

- **Server not running** → log warning, skip to **STEP 4** (graceful, no exit 1)
- **Server OK** → check sessions via `GET /sessions`, update state: `phase="verify_ui"`, `agentation.active=true`, `agentation.submit_gate_status="waiting_for_submit"`

### Submit Gate (mandatory wait)

**Do NOT read `/pending`, acknowledge, or fix anything until the user explicitly submits annotations.**

| Platform | Submit Signal |
|----------|--------------|
| Claude Code | `UserPromptSubmit` hook after user clicks **Send Annotations** |
| Codex / Gemini / OpenCode | `ANNOTATE_READY` signal (or `AGENTUI_READY` compat) |

After submit: set `submit_gate_status="submitted"`, record `submit_received_at` and `submitted_annotation_count`.

### Annotation Processing Loop

| Platform | Method |
|----------|--------|
| Claude Code (MCP) | `agentation_watch_annotations({batchWindowSeconds: 10, timeoutSeconds: 120})` — blocking |
| Others (HTTP) | Poll `GET http://localhost:4747/pending` with timeout |

Per annotation (sorted by severity: blocking → important → suggestion):
1. `acknowledge` → spinner shown in toolbar
2. Navigate code via `elementPath` (CSS selector) → apply fix
3. `resolve` with summary → green checkmark
4. Re-snapshot with agent-browser to verify fix

**Dismissed annotations**: skip code changes, increment `annotations.dismissed`, continue.

Loop ends when `pending == 0` (all resolved + dismissed) or timeout → **STEP 4**

---

## STEP 4: CLEANUP

Record checkpoint: `phase="cleanup"`

### Pre-flight

```bash
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || echo "⚠️ Not a git repo — skip cleanup"
git status --porcelain | wc -l  # warn if uncommitted changes
```

### Execute

```bash
bash scripts/worktree-cleanup.sh || git worktree prune
```

Update state: `phase="done"`

Archive completed `.omg/` items: move entries from `progress.md` → `history.md`, then prune empty `.omg/short-term/` plan files and append any newly discovered tasks to `backlog.md`.

> Default: removes only clean extra worktrees. Dirty worktrees are left with a warning. Use `--force` only after review.

---

## State Schema Reference

```json
{
  "phase": "plan|execute|verify|verify_ui|cleanup|done",
  "task": "string",
  "plan_approved": "boolean",
  "plan_gate_status": "pending|approved|feedback_required|infrastructure_blocked|manual_approved",
  "plan_current_hash": "sha256|null",
  "last_reviewed_plan_hash": "sha256|null",
  "last_reviewed_plan_at": "ISO 8601|null",
  "plan_review_method": "plannotator|manual|null",
  "team_available": "boolean|null",
  "retry_count": "number",
  "last_error": "string|null",
  "checkpoint": "plan|execute|verify|verify_ui|cleanup|null",
  "agentation.active": "boolean — watch loop running (hook guard)",
  "agentation.session_id": "string|null — for resume",
  "agentation.submit_gate_status": "idle|waiting_for_submit|submitted",
  "agentation.submit_signal": "platform that opened the gate",
  "agentation.exit_reason": "all_resolved|timeout|user_cancelled|error"
}
```

---

## Platform Routing Summary

```
omg keyword detected
  │
  ├─ Claude Code
  │   ├─ PLAN: EnterPlanMode → write plan → ExitPlanMode (hook = plannotator)
  │   ├─ EXECUTE: /omc:team 3:executor (requires AGENT_TEAMS=1)
  │   ├─ VERIFY: agent-browser snapshot
  │   └─ VERIFY_UI: agentation MCP tools (blocking watch)
  │
  ├─ Codex CLI
  │   ├─ PLAN: plannotator-plan-loop.sh (blocking)
  │   ├─ EXECUTE: BMAD /workflow-init
  │   ├─ VERIFY: agent-browser snapshot
  │   └─ VERIFY_UI: HTTP REST polling http://localhost:4747/pending
  │
  ├─ Gemini CLI
  │   ├─ PLAN: plannotator blocking direct call
  │   ├─ EXECUTE: ohmg (bunx oh-my-ag) or BMAD
  │   ├─ VERIFY: agent-browser snapshot
  │   └─ VERIFY_UI: HTTP REST polling
  │
  └─ OpenCode
      ├─ PLAN: /omg-plan (plannotator-plan-loop.sh)
      ├─ EXECUTE: omx team or BMAD
      ├─ VERIFY: agent-browser snapshot
      └─ VERIFY_UI: /omg-annotate (HTTP REST polling)
```
