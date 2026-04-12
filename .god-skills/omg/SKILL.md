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
  version: 1.3.0
  source: supercent-io/skills-template
---

# OMG - Integrated Agent Orchestration

One shared orchestration surface for Claude Code, Codex CLI, Gemini CLI, and OpenCode:
plan with `ralph` plus `plannotator`, execute with `team` or `bmad`, verify with `agent-browser`, optionally run the `annotate` feedback loop, then clean up worktrees.

## When to use this skill

- When the user wants one cross-platform orchestration entrypoint instead of choosing `omc`, `omx`, or `ohmg` manually
- When the task needs a full plan-to-execute-to-verify workflow rather than a single narrow helper skill
- When UI review or annotation feedback needs to stay inside the same orchestration loop
- When worktree cleanup and stateful recovery matter after execution
- When the request spans Claude Code, Codex CLI, Gemini CLI, or OpenCode and needs one shared operating model

## Control Layers

- `settings`: runtime configuration such as hooks, prompts, config files, and MCP registration
- `rules`: guardrails that must hold across platforms, especially around PLAN approval and annotation submit gates
- `hooks`: event callbacks that enforce those rules in each client

The authoritative runtime state is `.omc/state/omg-state.json`. For the exact schema, platform setup, and troubleshooting, use the reference files listed below.

## Instructions

### Step 1: Bootstrap state before doing anything else

- Create `.omc/state`, `.omc/plans`, and `.omc/logs`.
- If `.omc/state/omg-state.json` does not exist, initialize it with the plan gate fields, retry counter, checkpoint, and `agentation.submit_gate_status`.
- Notify the user that OMG is active in PLAN phase and that `annotate` enables the UI feedback loop when needed.
- Record the current phase in the state file each time you enter `plan`, `execute`, `verify`, `verify_ui`, or `cleanup`.

Minimal bootstrap:

```bash
mkdir -p .omc/state .omc/plans .omc/logs
```

### Step 2: PLAN must succeed before EXECUTE

- Write `plan.md` with goal, steps, risks, and completion criteria.
- Never skip the plan gate.
- Never reopen the same unchanged plan after a terminal review result.

Platform path:

- Claude Code:
  - enter plan mode
  - write the plan
  - exit plan mode so the hook-driven plannotator gate runs
- Codex, Gemini, OpenCode:
  - resolve the OMG scripts directory
  - run `bash "${_OMG_SCRIPTS}/ensure-plannotator.sh"`
  - run the blocking plan loop:

```bash
bash "${_OMG_SCRIPTS}/plannotator-plan-loop.sh" plan.md /tmp/plannotator_feedback.txt 3
```

Required branching:

- `0`: approved, update state for EXECUTE and continue
- `10`: feedback required, revise `plan.md`, retry the gate
- `32`: infrastructure blocked, use manual approval mode and do not continue until approval is explicit
- `30` or `31`: session exited or user confirmation needed; stop and resolve the gate

Hard rules:

- Never enter EXECUTE without an approved plan
- Never run the plan gate with `&`
- Only a revised plan may reset `plan_gate_status` to `pending`

### Step 3: EXECUTE with the smallest valid runtime

- Update `.omc/state/omg-state.json` to `phase = "execute"`.
- If Claude Code team mode is available, use `/omc:team 3:executor "<task>"`.
- If Claude Code is active but team mode is unavailable, stop and fix setup; do not silently degrade to single-agent execution.
- For Codex, Gemini, or OpenCode without native team execution, use BMAD:

```text
/workflow-init
/workflow-status
```

### Step 4: VERIFY with browser checks when a UI exists

- Update state to `phase = "verify"`.
- When browser-based behavior matters, verify it with `agent-browser`.
- If the request includes `annotate` or the deprecated alias `agentui`, move into VERIFY_UI.

Minimal browser check:

```bash
agent-browser snapshot http://localhost:3000
agent-browser snapshot http://localhost:3000 -i
```

### Step 5: VERIFY_UI only after explicit submit

- Before entering the loop, confirm the agentation server is healthy and a session exists.
- Set `phase = "verify_ui"` and `agentation.submit_gate_status = "waiting_for_submit"`.
- Do not process draft annotations before explicit submit or `onSubmit`.

Execution path:

- Claude Code: wait for the submit hook, then run the blocking `agentation_watch_annotations` loop
- Codex, Gemini, OpenCode: wait until `submit_gate_status = "submitted"`, then poll `http://localhost:4747/pending`

Per annotation:

- acknowledge
- navigate to the code via `elementPath`
- apply the fix
- resolve with a summary

Never process annotations before submit.

### Step 6: CLEANUP after work is complete

- Update state to `phase = "cleanup"`.
- Warn if the worktree is dirty before cleanup.
- Remove only clean extra worktrees by default.
- Update state to `phase = "done"` after cleanup completes.

Default cleanup:

```bash
bash scripts/worktree-cleanup.sh || git worktree prune
```

### Step 7: Use references for deep operational detail

The compact entrypoint is intentional. Read the support files only when the task needs deeper operational detail:

- `references/FLOW.md` for the full cross-platform execution flow and state machine
- `references/OPERATIONS.md` for installed components, setup paths, platform config, state details, and troubleshooting
- `references/PLANNOTATOR_RELIABILITY_CONSENSUS_2026-03-06.md` for the `exit 32` reliability rationale

## Examples

### Example 1: Run the full orchestration flow

Input:
```text
Use omg to plan, execute, verify, and clean up a cross-platform agent workflow for this feature.
```

Output shape:
- keeps PLAN mandatory
- chooses `team` or `bmad` based on platform capability
- includes verification and cleanup

### Example 2: Keep UI feedback inside the same loop

Input:
```text
Use omg with annotate so UI review stays inside the same workflow.
```

Output shape:
- enters VERIFY first
- opens VERIFY_UI only after explicit submit
- resolves annotations before cleanup

### Example 3: Handle a blocked plan gate safely

Input:
```text
OMG hit exit 32 in a constrained environment. What should it do next?
```

Output shape:
- explains manual approval mode
- keeps EXECUTE blocked until approval is explicit
- references the plannotator reliability note

## Best practices

1. Keep `omg` as the shared entrypoint, then route into `omc`, `omx`, `ohmg`, or BMAD only after the platform/runtime is clear.
2. Treat PLAN approval and annotation submit as hard gates, not suggestions.
3. Keep the main `SKILL.md` compact and move deep setup or operational detail into `references/`.
4. Prefer reversible cleanup and explicit state updates so interrupted runs can resume safely.

## References

- `references/FLOW.md`
- `references/OPERATIONS.md`
- `references/PLANNOTATOR_RELIABILITY_CONSENSUS_2026-03-06.md`
- `scripts/plannotator-plan-loop.sh`
- `scripts/worktree-cleanup.sh`
- https://agentskills.io/specification
- https://plannotator.ai
