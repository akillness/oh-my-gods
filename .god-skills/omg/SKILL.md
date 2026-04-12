---
name: omg
description: >
  Orchestrate a cross-platform AI agent workflow with ralph plus plannotator
  for planning, team or bmad for execution, agent-browser for browser
  verification, and agentation for UI feedback before cleanup. Use when the
  user needs one shared orchestration entrypoint across Claude, Codex,
  Gemini CLI, or OpenCode instead of choosing `omc`, `omx`, or `ohmg`
  manually. Triggers on: omg, annotate, UI검토, agentui.
compatibility: "Requires git, node>=18, bash. Optional: bun, docker."
allowed-tools: Read Write Bash Grep Glob Task
metadata:
  tags: omg, orchestration, ralph, plannotator, agentation, annotate, agentui, UI검토, team, bmad, omc, omx, ohmg, agent-browser, multi-agent, workflow, worktree-cleanup, browser-verification, ui-feedback
  platforms: Claude, Codex, Gemini, OpenCode
  keyword: omg
  version: 1.4.0
  source: akillness/oh-my-gods
---


# OMG — Integrated Agent Orchestration

> Keyword: `omg` · `annotate` · `UI검토` · `agentui (deprecated)` | Platforms: Claude Code · Codex CLI · Gemini CLI · OpenCode
>
> A unified skill providing fully automated orchestration flow:
> Plan (ralph+plannotator) → Execute (team/bmad) → UI Feedback (agentation/annotate) → Cleanup (worktree cleanup)

## When to use this skill

- When the user wants an end-to-end AI coding workflow across planning, execution, verification, and cleanup
- When the task benefits from combining `ralph`, `plannotator`, `team` or `bmad`, browser verification, and optional UI annotation
- When the user mentions `omg`, `annotate`, `UI검토`, or asks for a coordinated multi-platform agent workflow

## Instructions

Follow the execution protocol below in order. Do not skip PLAN, and only enable the UI feedback lane when the task actually needs browser or visual verification.

## Control Layers

OMG uses one cross-platform abstraction for orchestration:

- `settings`: platform/runtime configuration such as Claude hooks, Codex `config.toml`, Gemini `settings.json`, MCP registration, and prompt parameters
- `rules`: policy constraints that must hold on every platform
- `hooks`: event callbacks that enforce those rules on each platform

The key OMG rules are:

- do not reopen the PLAN gate when the current plan hash already has a terminal result
- only a revised plan resets `plan_gate_status` to `pending`
- do not process agentation annotations before explicit submit/onSubmit opens the submit gate

The authoritative state is `.omc/state/omg-state.json`. Hooks may help advance the workflow, but they must obey the state file.

---

## 0. Agent Execution Protocol (follow immediately upon `omg` keyword detection)

> The following are commands, not descriptions. Execute them in order. Each step only proceeds after the previous one completes.

### STEP 0: State File Bootstrap (required — always first)

```bash
mkdir -p .omc/state .omc/plans .omc/logs
```

If `.omc/state/omg-state.json` does not exist, create it:

<!-- NOTE: The `worktrees` array was removed from the initial schema as it is not yet implemented.
     Add it back when multi-worktree parallel execution tracking is needed.
     worktree-cleanup.sh queries git worktree list directly, so it works without this field. -->
```json
{
  "phase": "plan",
  "task": "<감지된 task>",
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

Notify the user:
> "OMG activated. Phase: PLAN. Add the `annotate` keyword if a UI feedback loop is needed."

**Claude Code only — hook self-check (run inline):**

Verify the `ExitPlanMode` hook is using `claude-plan-gate.py`, not raw `plannotator`. If misconfigured, auto-repair:

```python
import json, os, subprocess, sys

p = os.path.expanduser("~/.claude/settings.json")
if os.path.exists(p):
    s = json.load(open(p))
    for entry in s.get("hooks", {}).get("PermissionRequest", []):
        if entry.get("matcher") == "ExitPlanMode":
            for h in entry.get("hooks", []):
                cmd = h.get("command", "")
                if (cmd.strip() == "plannotator" or cmd.startswith("plannotator ")) and "claude-plan-gate" not in cmd:
                    print("[OMG][WARN] Hook uses raw plannotator — state tracking disabled. Auto-repairing...", file=sys.stderr)
                    for candidate in [
                        os.path.join(os.getcwd(), ".agent-skills/omg/scripts/setup-claude.sh"),
                        os.path.expanduser("~/.claude/skills/omg/scripts/setup-claude.sh"),
                        os.path.expanduser("~/.agent-skills/omg/scripts/setup-claude.sh"),
                    ]:
                        if os.path.exists(candidate):
                            subprocess.run(["bash", candidate], check=False)
                            print("[OMG] Hook repaired. Restart Claude Code to apply.", file=sys.stderr)
                            break
```

---

### STEP 0.1: Error Recovery Protocol (applies to all STEPs)

Use the canonical snippets in `references/checkpoint-helpers.md` instead of duplicating them inline.

- At the start of every phase, record the new `checkpoint` and `updated_at`.
- Before any pre-flight `exit 1`, record `last_error` and increment `retry_count`.
- On restart, read the stored checkpoint and resume from that phase instead of replaying the whole workflow blindly.
- If `retry_count >= 3`, ask the user whether to abort before continuing.

---

### STEP 1: PLAN (never skip)

**Pre-flight (required before entering):**
```bash
# Record checkpoint
python3 -c "
import json,datetime,os,subprocess,fcntl,tempfile
try:
    root=subprocess.check_output(['git','rev-parse','--show-toplevel'],stderr=subprocess.DEVNULL).decode().strip()
except:
    root=os.getcwd()
f=os.path.join(root,'.omc/state/omg-state.json')
if os.path.exists(f):
    with open(f,'r+') as fh:
        fcntl.flock(fh,fcntl.LOCK_EX)
        try:
            d=json.load(fh)
            d.update({'checkpoint':'plan','updated_at':datetime.datetime.utcnow().isoformat()+'Z'})
            fh.seek(0); json.dump(d,fh,ensure_ascii=False,indent=2); fh.truncate()
        finally:
            fcntl.flock(fh,fcntl.LOCK_UN)
" 2>/dev/null || true

# NOTE: Claude Code — skip this entire bash block.
# plannotator is a hook-only binary; calling it directly always fails.
# For Claude Code: call EnterPlanMode → write plan → call ExitPlanMode.
# The ExitPlanMode PermissionRequest hook fires plannotator automatically.
# The following script is for Codex / Gemini / OpenCode only.

# GUARD: enforce no-repeat PLAN review by plan hash.
# same hash + terminal gate status => skip reopening the plan gate
# revised plan.md content => reset gate to pending and review again
PLAN_GATE_STATUS=$(python3 -c "
import json, os
try:
    s = json.load(open('.omc/state/omg-state.json'))
    print(s.get('plan_gate_status', 'pending'))
except Exception:
    print('pending')
" 2>/dev/null || echo "pending")

HASH_MATCH=$(python3 -c "
import hashlib, json, os
try:
    s = json.load(open('.omc/state/omg-state.json'))
    if not os.path.exists('plan.md'):
        print('no-match')
    else:
        current_hash = hashlib.sha256(open('plan.md', 'rb').read()).hexdigest()
        print('match' if current_hash == (s.get('last_reviewed_plan_hash') or '') else 'no-match')
except Exception:
    print('no-match')
" 2>/dev/null || echo "no-match")

if [[ "$HASH_MATCH" == "match" && "$PLAN_GATE_STATUS" =~ ^(approved|manual_approved|feedback_required|infrastructure_blocked)$ ]]; then
  echo "✅ Current plan hash already has gate result: $PLAN_GATE_STATUS. Do not reopen plannotator."
  exit 0
fi

# plannotator is mandatory for the PLAN step (Codex/Gemini/OpenCode).
# If missing, OMG auto-installs it before opening the PLAN gate.
# Resolve the OMG scripts directory (works from any CWD)
_OMG_SCRIPTS=""
for _candidate in \
  "${OMG_SKILL_DIR:-}/scripts" \
  "$HOME/.agent-skills/omg/scripts" \
  "$HOME/.codex/skills/omg/scripts" \
  "$(pwd)/.agent-skills/omg/scripts" \
  "scripts" \
  ; do
  if [ -f "${_candidate}/plannotator-plan-loop.sh" ]; then
    _OMG_SCRIPTS="$_candidate"
    break
  fi
done

if [ -z "$_OMG_SCRIPTS" ]; then
  echo "❌ OMG scripts not found. Re-run: bash setup-codex.sh (or setup-gemini.sh)"
  exit 1
fi

if ! bash "${_OMG_SCRIPTS}/ensure-plannotator.sh"; then
  echo "❌ plannotator auto-install failed: cannot proceed with PLAN step."
  echo "   Retry: bash ${_OMG_SCRIPTS}/../scripts/install.sh --with-plannotator"
  exit 1
fi

# Required PLAN gate (Codex / Gemini / OpenCode):
# - Must wait until approve/feedback is received
# - Auto-restart on session exit (up to 3 times)
# - After 3 exits, ask user whether to end PLAN
FEEDBACK_DIR=$(python3 -c "import hashlib,os; h=hashlib.md5(os.getcwd().encode()).hexdigest()[:8]; d=f'/tmp/omg-{h}'; os.makedirs(d,exist_ok=True); print(d)" 2>/dev/null || echo '/tmp')
FEEDBACK_FILE="${FEEDBACK_DIR}/plannotator_feedback.txt"
bash "${_OMG_SCRIPTS}/plannotator-plan-loop.sh" plan.md "$FEEDBACK_FILE" 3
PLAN_RC=$?

if [ "$PLAN_RC" -eq 0 ]; then
  echo "✅ Plan approved"
elif [ "$PLAN_RC" -eq 10 ]; then
  echo "❌ Plan not approved — apply feedback, revise plan.md, and retry"
  exit 1
elif [ "$PLAN_RC" -eq 32 ]; then
  echo "⚠️ plannotator UI unavailable (sandbox/CI). Entering Conversation Approval Mode:"
  echo "   1. Output plan.md content to user in conversation"
  echo "   2. Ask user: 'approve' to proceed or provide feedback"
  echo "   3. DO NOT proceed to EXECUTE until user explicitly approves"
  exit 32
elif [ "$PLAN_RC" -eq 30 ] || [ "$PLAN_RC" -eq 31 ]; then
  echo "⛔ PLAN exit decision (or awaiting confirmation). Confirm with user before retrying."
  exit 1
else
  echo "❌ plannotator PLAN gate failed (code=$PLAN_RC)"
  exit 1
fi
mkdir -p .omc/plans .omc/logs
```

1. Write `plan.md` (include goal, steps, risks, and completion criteria)
2. **Invoke plannotator** (per platform):
   - **Claude Code (hook mode — only supported method)**:
     `plannotator` is a hook-only binary. It cannot be called via MCP tool or CLI directly.
     Call `EnterPlanMode`, write the plan content in plan mode, then call `ExitPlanMode`.
     The `ExitPlanMode` PermissionRequest hook fires the OMG Claude plan-gate wrapper automatically.
     That wrapper must skip re-entry when the current plan hash already has a terminal review result.
     Wait for the hook to return before proceeding — approved or feedback will arrive via the hook result.
   - **Codex / Gemini / OpenCode**: run blocking CLI (never use `&`):
     ```bash
     # _OMG_SCRIPTS must be resolved first via the dynamic path discovery block in the pre-flight above
     bash "${_OMG_SCRIPTS}/plannotator-plan-loop.sh" plan.md /tmp/plannotator_feedback.txt 3
     ```
     If `plannotator` is missing, OMG must auto-run `bash "${_OMG_SCRIPTS}/ensure-plannotator.sh"` first and continue only after the CLI is available.
3. Check result:
   - `approved: true` (Claude Code: hook returns approved) → update `omg-state.json` `phase` to `"execute"` and `plan_approved` to `true` → **enter STEP 2**
   - Not approved (Claude Code: hook returns feedback; others: `exit 10`) → read feedback, revise `plan.md` → repeat step 2
   - Infrastructure blocked (`exit 32`) → **Conversation Approval Mode**: output `plan.md` content to user, ask `approve` or provide feedback. **WAIT** for user response — do NOT proceed to EXECUTE until user explicitly approves
   - Session exited 3 times (`exit 30/31`) → ask user whether to end PLAN and decide to abort or resume

**NEVER: enter EXECUTE without `approved: true`. NEVER: run with `&` background.**
**NEVER: reopen the same unchanged plan after `approved`, `manual_approved`, `feedback_required`, or `infrastructure_blocked`.**

---

### STEP 2: EXECUTE

**Pre-flight (auto-detect team availability):**
```bash
# Record checkpoint
python3 -c "
import json,datetime,os,subprocess,fcntl
try:
    root=subprocess.check_output(['git','rev-parse','--show-toplevel'],stderr=subprocess.DEVNULL).decode().strip()
except:
    root=os.getcwd()
f=os.path.join(root,'.omc/state/omg-state.json')
if os.path.exists(f):
    with open(f,'r+') as fh:
        fcntl.flock(fh,fcntl.LOCK_EX)
        try:
            d=json.load(fh)
            d.update({'checkpoint':'execute','updated_at':datetime.datetime.utcnow().isoformat()+'Z'})
            fh.seek(0); json.dump(d,fh,ensure_ascii=False,indent=2); fh.truncate()
        finally:
            fcntl.flock(fh,fcntl.LOCK_UN)
" 2>/dev/null || true

TEAM_AVAILABLE=false
if [[ "${CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS:-}" =~ ^(1|true|True|yes|YES)$ ]]; then
  TEAM_AVAILABLE=true
elif python3 -c "
import json, os, sys
try:
    s = json.load(open(os.path.expanduser('~/.claude/settings.json')))
    val = s.get('env', {}).get('CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS', '')
    sys.exit(0 if str(val) in ('1', 'true', 'True', 'yes') else 1)
except Exception:
    sys.exit(1)
" 2>/dev/null; then
  TEAM_AVAILABLE=true
fi
export TEAM_AVAILABLE_BOOL="$TEAM_AVAILABLE"
python3 -c "
import json,os,subprocess,fcntl
try:
    root=subprocess.check_output(['git','rev-parse','--show-toplevel'],stderr=subprocess.DEVNULL).decode().strip()
except:
    root=os.getcwd()
f=os.path.join(root,'.omc/state/omg-state.json')
if os.path.exists(f):
    with open(f,'r+') as fh:
        fcntl.flock(fh,fcntl.LOCK_EX)
        try:
            d=json.load(fh)
            d['team_available']=os.environ.get('TEAM_AVAILABLE_BOOL','false').lower()=='true'
            fh.seek(0); json.dump(d,fh,ensure_ascii=False,indent=2); fh.truncate()
        finally:
            fcntl.flock(fh,fcntl.LOCK_UN)
" 2>/dev/null || true
```

1. Update `omg-state.json` `phase` to `"execute"`
2. **Team available (Claude Code + omc)**:
   ```
   /omc:team 3:executor "<task>"
   ```
3. **Claude Code but no team**:
   ```
   echo "❌ OMG requires Claude Code team mode. Re-run bash scripts/setup-claude.sh, restart Claude Code, and confirm CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1."
   exit 1
   ```
   Never fall back to single-agent execution in Claude Code.
4. **No omc (BMAD fallback — Codex / Gemini / OpenCode only)**:
   ```
   /workflow-init   # Initialize BMAD
   /workflow-status # Check current step
   ```

---

### STEP 3: VERIFY

1. Update `omg-state.json` `phase` to `"verify"`
2. **Basic verification with agent-browser** (when browser UI is present):
   ```bash
   agent-browser snapshot http://localhost:3000
   ```
3. `annotate` keyword detected → **enter STEP 3.1**
4. Otherwise → **enter STEP 4**

---

### STEP 3.1: VERIFY_UI (only when `annotate` keyword is detected)

1. Pre-flight check (required before entering):
   ```bash
   if ! curl -sf --connect-timeout 2 http://localhost:4747/health >/dev/null 2>&1; then
     echo "⚠️  agentation-mcp server not running — skipping VERIFY_UI and proceeding to CLEANUP"
     python3 -c "
import json,os,subprocess,fcntl,time
try:
    root=subprocess.check_output(['git','rev-parse','--show-toplevel'],stderr=subprocess.DEVNULL).decode().strip()
except:
    root=os.getcwd()
f=os.path.join(root,'.omc/state/omg-state.json')
if os.path.exists(f):
    with open(f,'r+') as fh:
        fcntl.flock(fh,fcntl.LOCK_EX)
        try:
            d=json.load(fh)
            d['last_error']='agentation-mcp not running; VERIFY_UI skipped'
            d['updated_at']=time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime())
            fh.seek(0); json.dump(d,fh,ensure_ascii=False,indent=2); fh.truncate()
        finally:
            fcntl.flock(fh,fcntl.LOCK_UN)
" 2>/dev/null || true
     # Proceed to STEP 4 CLEANUP (no exit 1 — graceful skip)
   fi
   ```
2. Update `omg-state.json`: `phase = "verify_ui"`, `agentation.active = true`, `agentation.submit_gate_status = "waiting_for_submit"`
3. Wait for explicit human submit:
   - **Claude Code**: wait for `UserPromptSubmit` after the user presses **Send Annotations** / `onSubmit`
   - **Codex / Gemini / OpenCode**: wait until the human confirms submission and the agent emits `ANNOTATE_READY` (or compatibility alias `AGENTUI_READY`)
4. Before that submit signal arrives, do not read `/pending`, do not acknowledge annotations, and do not start the fix loop
5. After submit arrives, switch `agentation.submit_gate_status = "submitted"` and record `submit_signal`, `submit_received_at`, and `submitted_annotation_count`
6. **Claude Code (MCP)**: blocking call to `agentation_watch_annotations` (`batchWindowSeconds:10`, `timeoutSeconds:120`)
7. **Codex / Gemini / OpenCode (HTTP)**: polling loop via `GET http://localhost:4747/pending`
8. Process each annotation: `acknowledge` → navigate code via `elementPath` → apply fix → `resolve`
9. `count=0` or timeout → reset the submit gate or finish the sub-phase → **enter STEP 4**

**NEVER: process draft annotations before submit/onSubmit.**

---

### STEP 4: CLEANUP

**Pre-flight (check before entering):**
```bash
# Record checkpoint
python3 -c "
import json,datetime,os,subprocess,fcntl
try:
    root=subprocess.check_output(['git','rev-parse','--show-toplevel'],stderr=subprocess.DEVNULL).decode().strip()
except:
    root=os.getcwd()
f=os.path.join(root,'.omc/state/omg-state.json')
if os.path.exists(f):
    with open(f,'r+') as fh:
        fcntl.flock(fh,fcntl.LOCK_EX)
        try:
            d=json.load(fh)
            d.update({'checkpoint':'cleanup','updated_at':datetime.datetime.utcnow().isoformat()+'Z'})
            fh.seek(0); json.dump(d,fh,ensure_ascii=False,indent=2); fh.truncate()
        finally:
            fcntl.flock(fh,fcntl.LOCK_UN)
" 2>/dev/null || true

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "⚠️ Not a git repository — skipping worktree cleanup"
else
  UNCOMMITTED=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  [[ "$UNCOMMITTED" -gt 0 ]] && echo "⚠️ ${UNCOMMITTED} uncommitted change(s) — recommend commit/stash before cleanup"
fi
```

1. Update `omg-state.json` `phase` to `"cleanup"`
2. Worktree cleanup:
   ```bash
   bash scripts/worktree-cleanup.sh || git worktree prune
   ```
3. Update `omg-state.json` `phase` to `"done"`

---

## Examples

### Example 1: Full orchestration

```text
omg "ship the billing settings page and verify it in the browser"
```

### Example 2: Orchestration with UI feedback

```text
omg annotate "review the dashboard layout, collect annotations, and apply the fixes"
```

## Best practices

1. **Plan first**: always review the plan with ralph+plannotator before executing (catches wrong approaches early)
2. **Team first**: omc team mode is most efficient in Claude Code
3. **bmad fallback**: use BMAD in environments without team (Codex, Gemini)
4. **Worktree cleanup**: run `worktree-cleanup.sh` immediately after work completes (prevents branch pollution)
5. **State persistence**: use `.omc/state/omg-state.json` to maintain state across sessions
6. **annotate**: use the `annotate` keyword to run the agentation watch loop for complex UI changes (precise code changes via CSS selector). `agentui` is a backward-compatible alias.

---

---

## References

- `references/FLOW.md` — detailed plan/execute/verify/cleanup flow, including the annotate watch loop
- `references/setup-guide.md` — install, platform configuration, state layout, and troubleshooting
- `references/checkpoint-helpers.md` — canonical checkpoint, `last_error`, and resume snippets
- [oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) — Claude Code multi-agent
- [plannotator](https://plannotator.ai) — visual plan/diff review
- [BMAD Method](https://github.com/bmad-dev/BMAD-METHOD) — structured AI development workflow
- [Agent Skills Spec](https://agentskills.io/specification) — skill format specification
- [agentation](https://github.com/benjitaylor/agentation) — UI annotation → agent code fix integration (`annotate`; `agentui` backward compatible)
