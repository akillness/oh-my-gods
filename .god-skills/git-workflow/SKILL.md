---
name: git-workflow
description: >
  Manage Git workflows for day-to-day delivery: branch creation, syncing with a
  base branch, commits, pull-request preparation, conflict resolution, and
  safe recovery from mistakes. Use when working in a Git repository, preparing
  reviewable commits, rebasing or merging, recovering from wrong-branch or
  reset mistakes, or deciding how to push shared history safely. Triggers on:
  git workflow, branch strategy, write commit message, merge conflict, rebase,
  cherry-pick, recover commit, force-with-lease, sync fork, prepare PR.
allowed-tools: Bash Read Write Grep Glob
metadata:
  tags: git, version-control, branching, commits, collaboration
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Git Workflow

Git workflow help is mainly about choosing the safest path for the current repo
state. Keep the entrypoint focused on triage, workflow selection, and safety
checks. Load the references only when the user needs exact command recipes or
recovery playbooks.

## When to use this skill

- Start a new feature, fix, docs, or hotfix branch
- Sync an existing branch with `main` or another base branch before review
- Stage and commit work with a clear message and reviewable scope
- Resolve merge or rebase conflicts without losing local work
- Recover from common Git mistakes like wrong-branch commits or bad resets
- Decide whether merge, rebase, revert, cherry-pick, or stash is the right
  move

Prefer a narrower sibling skill when the main job is not Git coordination:

- `git-submodule` for submodule-specific workflows
- `changelog-maintenance` when the user mainly needs release notes
- `code-review` when the repo state is already settled and the task is code
  quality

## Instructions

### Step 1: Ground the current repo state first

Before suggesting branch, history, or push actions, confirm:

- current branch
- clean or dirty working tree
- ahead/behind status relative to the remote
- whether the branch is personal, shared, or already under review

Use `git status --short --branch` first. If history shape matters, inspect a
small log slice such as `git log --oneline --graph -10`.

Do not recommend `rebase`, `reset`, `merge`, or `push --force-with-lease`
before the current state is known.

### Step 2: Choose the smallest safe workflow lane

Map the request to one lane:

- new work: create a focused branch from the right base
- sync work: fetch, inspect divergence, then choose merge or rebase
- commit prep: review diffs, stage intentionally, write a message with why
- collaboration: push with upstream, open or update the PR, keep shared
  history safe
- recovery: protect reachable work first, then use reflog, cherry-pick,
  revert, or reset as appropriate

If the user only asked for one move, answer that move plus the immediate safety
checks before and after it.

### Step 3: Protect work before history surgery

Before risky operations:

- preserve uncommitted work with a focused commit or stash when needed
- create a rescue branch before destructive history edits when recovery risk is
  non-trivial
- prefer `--force-with-lease` over `--force`
- prefer `git revert` over history rewriting on shared branches
- treat `git reset --hard`, branch deletion, and history rewriting as
  last-resort recovery moves

When the branch is already shared, optimize for recoverability instead of the
cleanest possible history.

### Step 4: Pull the matching reference, not the whole package

Load only the reference that matches the user's job:

- `references/branching-and-sync.md` for branch creation, fetching, rebasing,
  merging, and fork sync
- `references/commit-and-history-hygiene.md` for staging, commit messages,
  amend, log inspection, and history cleanup
- `references/conflicts-recovery-and-collaboration.md` for conflict handling,
  wrong-branch recovery, revert vs reset, reflog, and shared-branch safety

### Step 5: Verify the workflow result

After the suggested workflow, verify with the smallest relevant checks:

- `git status --short --branch`
- `git diff --staged` or `git diff <base>...HEAD`
- `git log --oneline --graph -5`
- relevant tests or linters if code changed

Do not claim the repo is ready until the post-action state matches the intent.

## Examples

### Example 1: Sync a feature branch before review

Input:

```text
My branch is a few commits behind main and I want the cleanest path before I
open a PR. What Git workflow should I follow?
```

Expected shape:

- checks the current branch and working tree first
- fetches remote state before choosing rebase or merge
- includes a post-sync verification step before pushing

### Example 2: Recover a wrong-branch commit

Input:

```text
I committed a bugfix on main by mistake and have not pushed yet. How do I move
it safely?
```

Expected shape:

- protects the commit before rewriting local branch history
- uses a recovery workflow such as branch creation plus reset or cherry-pick
- verifies the commit ends up on the intended branch

### Example 3: Resolve a rebase conflict on a shared branch

Input:

```text
My branch hit conflicts during rebase and the PR is already under review. What
should I do without wrecking the branch for teammates?
```

Expected shape:

- checks whether the branch is shared before recommending history changes
- walks through conflict resolution and `rebase --continue` or `--abort`
- uses `--force-with-lease` only if the rewritten branch still needs to be
  pushed

## Best practices

1. Inspect `git status` before suggesting history edits
2. Stage intentionally and review diffs before committing
3. Prefer small focused branches and reviewable commits
4. Prefer reversible workflows on shared branches
5. Use `--force-with-lease`, not blind force pushes
6. Keep detailed command recipes in references so the entrypoint stays compact
   and triggerable
7. Verify the repo state after every non-trivial Git operation

## References

- `references/branching-and-sync.md`
- `references/commit-and-history-hygiene.md`
- `references/conflicts-recovery-and-collaboration.md`
- [Pro Git Book](https://git-scm.com/book/en/v2)
- [Git Documentation](https://git-scm.com/docs)
- [Conventional Commits](https://www.conventionalcommits.org/)
