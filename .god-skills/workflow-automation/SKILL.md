---
name: workflow-automation
description: >
  Design repo-scoped recurring workflow automation: task runners, bootstrap
  entrypoints, local-CI parity commands, hook guardrails, and maintenance
  routines that wrap existing tools without bloating into full deployment or
  environment provisioning. Use when the user needs repeatable commands for
  setup, build, test, lint, release prep, or repo hygiene; wants to replace
  copy-paste shell rituals; or must choose between npm scripts, Make/just/task,
  hooks, and lightweight repo automation. Triggers on: workflow automation,
  task runner, make this repeatable, bootstrap script, local CI parity,
  pre-commit hook, justfile, Taskfile, Makefile, repo automation.
allowed-tools: Read Write Bash Grep Glob
compatibility: >
  Best for repository-local automation with standard shell tooling. Pair with
  existing project commands instead of introducing new deployment platforms or
  heavy infrastructure by default.
metadata:
  tags: automation, task-runner, justfile, taskfile, makefile, hooks, ci-parity, repo-maintenance
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Workflow Automation

Workflow automation is a repo-operations skill, not a generic dump of scripts.
Keep the entrypoint focused on repeatable developer workflows, task-runner
choice, and local guardrails. Pull detailed patterns only when the request
needs them.

## When to use this skill

- Replace repeated shell rituals with named commands or a small task runner
- Choose between `npm` scripts, `make`, `just`, or `Taskfile` for an existing
  repo
- Add bootstrap, setup, build, test, lint, or release-prep entrypoints
- Mirror CI checks locally so contributors can run the same lane before push
- Add Git hooks or maintenance routines without turning the repo into a full
  platform-engineering project

Prefer a narrower sibling skill when the real problem is elsewhere:

- `deployment-automation` for shipping artifacts to environments
- `system-environment-setup` for Docker, devcontainers, or machine setup
- `environment-setup` for `.env` structure and config precedence
- `git-workflow` for branch, commit, or rebase policy rather than automation

## Instructions

### Step 1: Triage the repeated work before picking a tool

Capture the minimum facts first:

- repeated jobs: setup, build, test, lint, format, release prep, cleanup, or
  repo maintenance
- existing command surface: package scripts, language tools, `make`, shell
  scripts, CI YAML, or ad-hoc docs
- team shape: solo repo, small team, monorepo, or mixed-language workspace
- portability needs: macOS/Linux only, Windows support, or container-only
- risk shape: destructive cleanup, publish commands, migrations, or secrets use

Do not start by inventing a task runner. Start by naming the repeated workflow
and the commands that already exist.

### Step 2: Choose the lightest automation surface that fits

Prefer the smallest layer that makes the workflow repeatable:

- package-manager scripts when one language ecosystem already owns the repo
- `just` or `Taskfile` when the repo needs readable multi-command orchestration
  across platforms
- `make` when the team already uses it and POSIX-only ergonomics are acceptable
- a small `scripts/` wrapper only when the workflow logic is too awkward to
  keep inline in a task runner
- Git hooks only for fast, local guardrails rather than expensive CI copies

Do not add a new task runner if the repo already has a clean, sufficient
command surface.

### Step 3: Design for local-CI parity, not command sprawl

Keep automation reviewable:

- expose a small top-level command set such as `setup`, `build`, `test`, `lint`,
  `check`, and `release-prep`
- map each command to existing tools instead of duplicating business logic
- make `check` or an equivalent command mirror the main CI quality lane
- keep destructive or slow tasks clearly named rather than hidden in default
  hooks
- document prerequisites and environment assumptions next to the automation

### Step 4: Add hooks and maintenance guardrails carefully

Before adding automation that runs implicitly:

- keep pre-commit hooks fast enough for local use
- leave heavy integration or end-to-end checks in CI unless the repo has a
  strong reason otherwise
- keep cleanup or reset commands explicit and obviously destructive
- make release or publish commands opt-in and reviewable
- avoid hidden network, credential, or production side effects in default flows

### Step 5: Pull support files only when they add leverage

Load the smallest supporting reference that matches the request:

- `references/task-runner-selection.md` for `npm` vs `make` vs `just` vs
  `Taskfile` choices
- `references/local-ci-parity-and-hooks.md` for local quality lanes, hook
  policy, and maintenance guardrails

## Examples

### Example 1: Replace tribal shell history

Input:

```text
Everyone copies setup, lint, test, and build commands from Slack. I want one
repeatable repo entrypoint without overengineering it.
```

Expected shape:

- inventories the existing commands before adding wrappers
- chooses one light task surface instead of multiple overlapping ones
- exposes a small named command set and keeps CI parity explicit

### Example 2: Choose a task runner

Input:

```text
Should this mixed Node + Python repo use npm scripts, just, Taskfile, or make?
```

Expected shape:

- compares the runner choices against language mix and portability needs
- avoids defaulting to one runner without repo constraints
- recommends the lightest viable surface and names tradeoffs

### Example 3: Add guardrails without deployment creep

Input:

```text
I want pre-commit and a local check command, but I do not want this to turn
into a deployment pipeline.
```

Expected shape:

- keeps the solution repo-scoped
- separates fast local hooks from CI-only checks
- avoids drifting into deployment or infrastructure advice

## Best practices

- Automate repeated work, not every possible command
- Prefer one visible command surface over overlapping wrappers
- Reuse the repo's existing tools before introducing a new runner
- Keep local hooks fast and keep heavy checks in CI unless proven necessary
- Make destructive, publishing, or credentialed flows explicit
- Store detailed patterns in references so the entrypoint stays compact and
  triggerable

## References

- `references/task-runner-selection.md`
- `references/local-ci-parity-and-hooks.md`
