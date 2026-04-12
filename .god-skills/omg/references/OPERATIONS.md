# OMG Operations Reference

Use this note when the compact `SKILL.md` entrypoint is not enough.

## Installed Components

| Tool | Purpose | Typical path |
|------|---------|--------------|
| `omc` | Claude Code multi-agent orchestration | Claude plugin / slash commands |
| `omx` | Codex and OpenCode orchestration surface | Codex prompts, tmux team runtime |
| `ohmg` | Gemini / Antigravity orchestration surface | `bunx oh-my-ag` |
| `bmad` | Structured fallback workflow | slash-command workflow |
| `ralph` | Planning loop | platform-specific prompt / slash command |
| `plannotator` | Visual plan approval gate | PLAN hook or blocking CLI |
| `agentation` | Annotation-to-fix loop | MCP or HTTP server |
| `agent-browser` | Browser verification | CLI snapshots and screenshots |

## Platform Setup

### Claude Code

Setup:

```bash
bash scripts/setup-claude.sh
```

Key surfaces:

- `~/.claude/settings.json`
- `PermissionRequest` hook for the plan gate
- `UserPromptSubmit` hook for the annotation submit gate
- `/omc:team` for team execution

### Codex CLI

Setup:

```bash
bash scripts/setup-codex.sh
```

Key surfaces:

- `~/.codex/config.toml`
- `~/.codex/prompts/omg.md`
- notify hook for follow-up PLAN and VERIFY_UI work
- `developer_instructions` must stay a top-level string in `config.toml`

### Gemini CLI

Setup:

```bash
bash scripts/setup-gemini.sh
```

Key surfaces:

- `~/.gemini/settings.json`
- `~/.gemini/GEMINI.md`
- direct blocking `plannotator` execution remains the main PLAN path
- hooks are a safety net, not a replacement for the blocking gate

### OpenCode

Setup:

```bash
bash scripts/setup-opencode.sh
```

Key surfaces:

- `opencode.json`
- registered slash commands such as `/omg-plan`, `/omg-exec`, and `/omg-cleanup`
- optional `omx` team execution if available

## State File

Path:

```text
.omc/state/omg-state.json
```

Core fields to preserve:

- `phase`
- `task`
- `plan_approved`
- `plan_gate_status`
- `plan_current_hash`
- `last_reviewed_plan_hash`
- `plan_review_method`
- `team_available`
- `retry_count`
- `last_error`
- `checkpoint`
- `agentation.active`
- `agentation.submit_gate_status`
- `agentation.submit_signal`
- `agentation.submitted_annotation_count`
- `agentation.exit_reason`

State rules:

- same plan hash plus terminal gate result means do not reopen PLAN
- only a revised plan resets the gate to `pending`
- draft annotations stay blocked until submit
- checkpoint and retry data must survive interruption

## Recommended Workflow

```text
1. Install and verify the client-specific setup
2. Start OMG and write plan.md
3. Complete PLAN approval
4. Execute with team mode or BMAD
5. Verify browser/runtime behavior
6. Run annotate only after explicit submit
7. Clean up extra worktrees
```

## Troubleshooting

| Issue | Response |
|------|----------|
| `plannotator` not available | Run `bash scripts/ensure-plannotator.sh` or rerun the platform setup |
| PLAN loop exits with `32` | Use manual approval mode and keep EXECUTE blocked |
| Claude team mode missing | Re-run `bash scripts/setup-claude.sh` and verify agent teams are enabled |
| Codex startup error about `developer_instructions` type | Rewrite `~/.codex/config.toml` so `developer_instructions` is a top-level string |
| Gemini feedback loop missing | Recheck `~/.gemini/GEMINI.md` and blocking `plannotator` invocation |
| `annotate` loop not starting | Check `http://localhost:4747/health` and ensure submit was explicit |
| Cleanup leaves worktrees behind | Inspect `git worktree list`, then prune or force-remove intentionally |

## Related Files

- `references/FLOW.md`
- `references/PLANNOTATOR_RELIABILITY_CONSENSUS_2026-03-06.md`
- `scripts/check-status.sh`
- `scripts/plannotator-plan-loop.sh`
- `scripts/worktree-cleanup.sh`
