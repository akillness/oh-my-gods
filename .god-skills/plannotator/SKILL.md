---
name: plannotator
description: >
  Review and annotate agent plans or diffs in a visual browser UI, then approve
  or request changes with structured feedback. Use when the user wants visual
  plan review, diff review, hook-driven feedback loops, or note export to
  Obsidian or Bear Notes. Triggers on: plannotator, plan review, diff review,
  code review, annotate plan, review agent plan.
allowed-tools: Read Bash Write
metadata:
  tags: plan, planning, planno, plannotator, plan-review, diff-review, code-review, claude-code, opencode, annotation, visual-review, design-review
  platforms: Claude, OpenCode, Codex, Gemini
  keyword: plan
  version: 0.9.2
  source: backnotprop/plannotator
---

# plannotator - Interactive Plan and Diff Review

> Keyword: `plan` | Source: https://github.com/backnotprop/plannotator
>
> Use plannotator as the visual review surface for agent plans and git diffs.
> The human annotates the review, then approves or requests changes.

## When to use this skill

- Review an implementation plan before the agent starts coding
- Review a git diff after the agent has made changes
- Send structured feedback back into a hook-driven replanning loop
- Save reviewed plans to Obsidian or Bear Notes
- Annotate screenshots or UI issues alongside the review

## Instructions

### Step 1: Install and verify the CLI

Use the bundled setup and status scripts instead of retyping the workflow.

```bash
bash scripts/install.sh
bash scripts/check-status.sh
```

Key setup entrypoints:

| Goal | Script |
|------|--------|
| Install CLI and optional integrations | `bash scripts/install.sh` |
| Claude Code hook setup | `bash scripts/setup-hook.sh` |
| Gemini CLI hook setup | `bash scripts/setup-gemini-hook.sh` |
| Codex CLI setup | `bash scripts/setup-codex-hook.sh` |
| OpenCode plugin setup | `bash scripts/setup-opencode-plugin.sh` |
| Remote/devcontainer setup | `bash scripts/configure-remote.sh` |
| Diff review UI | `bash scripts/review.sh [range]` |

### Step 2: Prefer the hook-driven plan review path

For live feedback, the best path is automatic plan review when the agent exits
plan mode.

1. Configure the relevant integration surface.
2. Let the agent produce the plan.
3. Open the plannotator UI.
4. Annotate with one clear action per comment:
   - `delete`
   - `insert`
   - `replace`
   - `comment`
5. Finish with exactly one outcome:
   - `Approve`
   - `Request changes`

If the user wants Claude Code plugin mode instead of a manual hook:

```bash
/plugin marketplace add backnotprop/plannotator
/plugin install plannotator@plannotator
```

Restart the host agent after installing the plugin or writing hook settings.

### Step 3: Use diff review after implementation

```bash
bash scripts/review.sh
bash scripts/review.sh HEAD~1
bash scripts/review.sh main...HEAD
```

Use diff review when the code already exists and the user wants visual
annotation tied to changed lines.

### Step 4: Configure the correct agent surface

Claude Code:

```bash
bash scripts/setup-hook.sh
```

Gemini CLI:

```bash
bash scripts/setup-gemini-hook.sh
```

Codex CLI:

```bash
bash scripts/setup-codex-hook.sh
```

The Codex helper:

- adds plannotator guidance to `~/.codex/config.toml`
- updates the `developer_instructions` surface
- creates `~/.codex/prompts/plannotator.md`
- lets the user invoke `/prompts:plannotator` inside Codex

OpenCode:

```bash
bash scripts/setup-opencode-plugin.sh
```

Detailed platform-specific setup notes live in
`references/platform-setup.md`.

### Step 5: Handle manual submission and notes export correctly

Manual plan submission should use JSON input, not echo or heredoc shortcuts:

```bash
python3 -c "
import json
plan = open('plan.md').read()
print(json.dumps({'tool_input': {'plan': plan, 'permission_mode': 'acceptEdits'}}))
" | plannotator > /tmp/plannotator_feedback.txt 2>&1 &
```

To save a reviewed plan without approving or denying it yet:

1. Click `Export` in the plannotator UI
2. Open the `Notes` tab
3. Use `Save` for Obsidian or Bear, or `Save All`

Requirements:

- plannotator must be running in hook mode
- Obsidian or Bear must already be configured in Settings -> Saving
- Settings are stored in browser cookies, so use the normal system browser

Detailed Notes-tab, Obsidian, Bear, and troubleshooting guidance lives in
`references/notes-and-troubleshooting.md`.

### Step 6: Respect the known limitations

- Manual `plannotator review` or `bash scripts/review.sh` opens the review UI,
  but `Send Feedback` does not automatically reach the active agent session.
- When the user needs a live feedback loop, route them to hook-driven plan
  review instead of pretending manual diff review is wired back into the agent.
- If they already reviewed manually, tell them to export, copy, or paste the
  annotations back into the agent chat themselves.
- Diff review requires a git repository.
- If a stale local instance blocks the right tab or port, restart the process
  and pin a fixed port before retrying:

```bash
pkill plannotator 2>/dev/null; sleep 1
export PLANNOTATOR_PORT=19432
plannotator review
```

## Examples

### Example 1: Review a plan before coding

Input:

```text
Use plannotator to review my AI agent's implementation plan before it starts coding.
```

Expected response shape:

- Position plannotator as the visual plan-review surface
- Tell the user to annotate the plan with `delete`, `insert`, `replace`, or
  `comment`
- End with `Approve` or `Request changes`

### Example 2: Set up plannotator for Codex CLI

Input:

```text
Set up plannotator for Codex CLI on this machine and tell me how to invoke it in a session.
```

Expected response shape:

- Use `bash scripts/setup-codex-hook.sh`
- Mention `~/.codex/config.toml` and `developer_instructions`
- Mention `~/.codex/prompts/plannotator.md`
- Tell the user to invoke `/prompts:plannotator`

### Example 3: Explain the manual review limitation

Input:

```text
I ran bash scripts/review.sh and the review UI opened, but Send Feedback did not get back to the active agent session.
```

Expected response shape:

- State that manual review does not automatically feed the active agent session
- Recommend hook-driven plan review for a live loop
- Recommend copying or exporting annotations back into chat when needed

## Best practices

1. Use plan review before coding so wrong approaches are caught early.
2. Keep each annotation tied to one actionable change.
3. Include acceptance criteria when requesting changes.
4. Use exact diff ranges for behavior-sensitive code review.
5. Keep the SKILL entrypoint compact and move deeper setup notes to references.

## References

- [Platform setup](references/platform-setup.md)
- [Notes and troubleshooting](references/notes-and-troubleshooting.md)
- [GitHub: backnotprop/plannotator](https://github.com/backnotprop/plannotator)
- [Official site: plannotator.ai](https://plannotator.ai)
- [Hook README: apps/hook/README.md](https://github.com/backnotprop/plannotator/blob/main/apps/hook/README.md)
- [OpenCode plugin: apps/opencode-plugin/README.md](https://github.com/backnotprop/plannotator/blob/main/apps/opencode-plugin/README.md)
