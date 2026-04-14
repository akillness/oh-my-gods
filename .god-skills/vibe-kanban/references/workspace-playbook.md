# Vibe Kanban workspace playbook

Use this file when the user needs the detailed workspace lifecycle, not when a
short answer from `SKILL.md` is enough.

## Core loop

1. Start the board.
2. Create one workspace for one reviewable task.
3. Pick the coding agent.
4. Let the board create the isolated branch and worktree.
5. Review logs, diff, and preview.
6. Open the PR from the workspace.
7. Merge and let the workspace archive or clean up.

## Review surfaces

- Diff panel: inspect code changes before asking for another pass
- Logs panel: check the agent transcript and failures
- Preview panel: inspect the running app
- Notes: keep human review context near the workspace

## Workspace states

- Running: the agent is actively working
- Idle: the workspace is waiting
- Needs Attention: the agent is finished or blocked
- Archived or done: the PR path is complete

## Supported coding-agent examples

Commonly documented upstream examples include Claude Code, Codex, Gemini,
GitHub Copilot, Amp, Cursor, OpenCode, Droid, CCR, and Qwen Code.

## Representative use cases

### Parallel feature delivery

- Workspace 1: frontend UI
- Workspace 2: backend API
- Workspace 3: integration tests

Use this when the tasks are independent enough to review separately.

### Compare two implementation strategies

- Workspace A: design-first or UX-heavy pass
- Workspace B: performance-first or refactor-first pass

Use this when the team wants to compare approaches before merging.

### Board plus PR workflow

- Plan on the board
- Run the agent in the workspace
- Review in the board
- Approve in GitHub

Use this when the team wants a human approval checkpoint before merge.

## Scope discipline

- One workspace should map to one PR-sized outcome.
- Split giant prompts before launching the board.
- Prefer a follow-up workspace to a bloated retry prompt.

## When to pair with other skills

- Pair with `plannotator` when the plan needs review before execution.
- Pair with `playwriter` when authenticated browser validation is required.
- Pair with `ultrawork` or similar orchestration only when the board is the review surface and not just background task launching.
