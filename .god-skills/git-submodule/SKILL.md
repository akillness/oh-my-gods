---
name: git-submodule
description: >
  Decide when Git submodules are the right dependency boundary, then operate
  them safely: add a submodule, clone and init recursively, update a tracked
  branch, develop inside the submodule without getting lost in detached HEAD,
  remove a submodule cleanly, or configure CI checkout. Use when the user asks
  about `.gitmodules`, `git submodule`, recursive clone or setup, updating
  submodule pointers, private submodules in CI, or whether submodule vs
  subtree or vendoring is the better fit. Not for generic Git history cleanup
  or package-manager dependency delivery.
license: Apache-2.0
compatibility: >
  Best for repositories that already use Git or are deciding whether a Git
  submodule boundary is safer than subtree, vendoring, or package-manager
  delivery.
allowed-tools: Bash Read Write Grep Glob
metadata:
  version: "2.0.0"
  author: Agent Skills Team
  tags: git, submodule, dependencies, version-control, ci
  platforms: Claude, ChatGPT, Gemini, Codex
---

# Git Submodule

Git submodule work is mainly about boundary choice and workflow safety. Keep
the entrypoint focused on deciding whether submodules are appropriate, then
walk the user through the smallest safe setup, update, recovery, or removal
path.

Read `references/decision-and-setup.md` when the user needs help choosing
submodule vs subtree or vendoring, cloning a repo with submodules, or wiring
CI and private access. Read `references/update-and-removal.md` when the task is
updating pointers, recovering from detached HEAD, or removing a submodule
cleanly.

If the user mainly needs:

- generic branch, merge, rebase, commit, or PR coordination, use
  `git-workflow`
- package-manager delivery from a Git remote, keep it out of this skill and use
  the package manager's own Git dependency workflow
- broad repository structure or vendoring strategy beyond submodule mechanics,
  use `file-organization`

## When to use this skill

- Decide whether Git submodules are the right dependency boundary for a shared
  repository, fork, or infra component
- Add a new submodule and record the right `.gitmodules` and pointer changes
- Clone or bootstrap a repository that already contains submodules
- Update a submodule pointer to a newer commit or tracked branch safely
- Recover from detached HEAD inside a submodule during development
- Remove a submodule cleanly without leaving stale Git metadata behind
- Configure CI or automation that needs recursive checkout or private submodule
  access

## When not to use this skill

- The main problem is generic Git history surgery, branch cleanup, or PR prep:
  use `git-workflow`
- The main problem is consuming a package directly from Git in npm or pnpm:
  keep it out of this skill and use the package manager's own Git dependency
  workflow
- The team already decided against submodules and needs a broader repo-layout
  decision instead

## Instructions

### Step 1: Ground the current repo shape or decision point

Before suggesting commands, determine which lane the user is in:

- decision: should this repo use a submodule at all?
- bootstrap: clone or initialize existing submodules
- update: move the recorded pointer or track a remote branch
- develop: make changes inside the submodule safely
- remove: remove the submodule and clean metadata
- CI: configure automation or private access for checkout

If the repo already exists, check the smallest useful evidence first:

- whether `.gitmodules` exists
- current submodule status from `git submodule status --recursive`
- whether the user is inside a detached HEAD in the submodule
- whether the job is local-only, shared-branch, or CI-specific

Do not jump into `git submodule add`, `update --remote`, or cleanup commands
until the lane is clear.

### Step 2: Decide whether submodule is the right boundary

Use submodules when:

- the dependency is its own Git repository with independent history
- you want the parent repo to pin an exact external commit
- upstream ownership and release cadence should stay separate
- the team accepts Git-level workflow overhead in exchange for provenance

Prefer subtree or vendoring when:

- contributors need one-repo editing with minimal Git ceremony
- CI, onboarding, or access control would make submodule checkout fragile
- the code should behave like copied source rather than a separately versioned
  dependency

Prefer a package manager when:

- the real need is language-specific dependency delivery, semver, or registry
  workflows
- the dependency is not meant to be edited through Git inside the parent repo

State the reason for the choice. Do not recommend submodules by habit.

### Step 3: Pull only the matching reference

Load only the reference that matches the task:

- `references/decision-and-setup.md` for adoption criteria, add flow, clone and
  init, recursive checkout, and CI/private access
- `references/update-and-removal.md` for tracked-branch updates, detached-HEAD
  recovery, pointer verification, and clean removal

### Step 4: Use the smallest safe workflow lane

For each lane, optimize for recoverability:

- decision: compare submodule vs subtree or vendoring and call out tradeoffs
- bootstrap: `git clone --recursive` or `git submodule update --init
  --recursive`
- add: record the URL and path, then commit both `.gitmodules` and the
  submodule pointer
- update: fetch the intended remote state, move the submodule deliberately, and
  commit only the pointer change in the parent repo
- develop: get off detached HEAD in the submodule before making commits, then
  update the parent pointer afterward
- remove: deinit, remove the tracked path, clean `.git/modules/<path>`, and
  verify no stale config remains
- CI: enable recursive checkout and confirm auth for private submodules before
  assuming automation will work

When the user asks for one exact command sequence, give the shortest path plus
the immediate verification checks.

### Step 5: Protect work before pointer or history changes

Before risky submodule operations:

- inspect whether the submodule has uncommitted work
- avoid making commits from detached HEAD unless the user is intentionally
  pinning a one-off commit
- prefer creating or checking out the intended branch inside the submodule
  before editing
- treat `git submodule update --remote` as a reviewable pointer move, not a
  blind sync
- on shared repos, verify which branch or commit the parent should record

If the user accidentally worked in detached HEAD, recover the work before
running cleanup or reset commands.

### Step 6: Verify the result

Use the smallest relevant checks after any non-trivial change:

- `git submodule status --recursive`
- `git diff --submodule`
- `git status --short --branch`
- `git config -f .gitmodules --get-regexp 'submodule\\..*\\.(path|url|branch)'`
- CI or checkout logs when the task is automation-specific

Do not claim the repo is ready until the parent repo records the intended
pointer and the submodule state matches the user's goal.

## Examples

### Example 1: Decide whether submodule is the right dependency boundary

Input:

```text
We share an internal infrastructure repo across three projects. Should we use a
Git submodule, subtree, or just vendor the code?
```

Expected shape:

- compares submodule vs subtree or vendoring instead of assuming submodule
- explains when independent history and pinned commits justify submodules
- calls out workflow overhead and CI or access risks

### Example 2: Bootstrap a repo after clone

Input:

```text
I cloned a repo and the submodule folders are empty. What Git submodule steps do
I run?
```

Expected shape:

- recognizes this as a bootstrap flow, not a generic Git issue
- uses recursive init and update commands
- verifies the resulting pointer state

### Example 3: Recover from detached HEAD in a submodule

Input:

```text
I edited code inside a submodule and now I’m on detached HEAD. How do I save the
work and update the parent repo safely?
```

Expected shape:

- protects the in-progress work before more checkout commands
- gets the user onto an intended branch inside the submodule
- commits the parent pointer only after the submodule commit is stable

### Example 4: Remove a submodule cleanly

Input:

```text
How do I remove this submodule without leaving broken Git metadata behind?
```

Expected shape:

- uses a clean remove flow including deinit and `.git/modules` cleanup
- verifies both working tree and config state afterward
- keeps the answer specific to submodule removal instead of broad Git cleanup

## Best practices

1. Decide first whether submodule is the right boundary
2. Inspect `.gitmodules` and current pointer state before changing commands
3. Treat detached HEAD recovery as a first-class workflow, not an edge case
4. Commit the parent repo pointer intentionally after submodule changes
5. Verify CI and auth assumptions for private submodules
6. Keep detailed command recipes in references so the entrypoint stays compact
   and triggerable
7. Route generic Git history work back to `git-workflow`

## References

- `references/decision-and-setup.md`
- `references/update-and-removal.md`
- [Git Submodule Documentation](https://git-scm.com/docs/git-submodule)
- [Gitmodules Documentation](https://git-scm.com/docs/gitmodules)
