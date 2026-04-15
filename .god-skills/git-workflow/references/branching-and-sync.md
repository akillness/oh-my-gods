# Branching And Sync

Use this reference when the user needs concrete branch-management or sync
commands.

## Start new work from the right base

1. Update the base branch first.
2. Create a focused branch from that base.
3. Confirm the new branch tracks the intended remote once pushed.

Typical names:

- `feature/<scope>`
- `bugfix/<scope>`
- `docs/<scope>`
- `hotfix/<scope>`
- `refactor/<scope>`

## Inspect divergence before syncing

Use these checks before merging or rebasing:

```bash
git status --short --branch
git fetch <remote>
git log --oneline --graph --decorate --max-count=10 HEAD <remote>/<base-branch>
```

Replace `<remote>` and `<base-branch>` with the branch the user is actually
syncing against. `origin/main` is only one common case, not a universal
default.

If the branch is private and the user wants linear history, rebase is usually
fine. If the branch is shared or already under review by multiple people, merge
or a carefully coordinated rebase is safer.

## Rebase path

Use when the branch is personal or the team explicitly expects rebased history:

```bash
git fetch <remote>
git rebase <remote>/<base-branch>
```

If conflicts appear:

```bash
git status
# resolve files
git add <resolved-files>
git rebase --continue
```

Abort if the rebase direction was wrong or the conflict volume is not worth it:

```bash
git rebase --abort
```

## Merge path

Use when the branch is shared, the team prefers merge commits, or rebasing
would create unnecessary churn:

```bash
git fetch <remote>
git merge <remote>/<base-branch>
```

Use `--no-ff` only when the repo convention wants an explicit merge commit.

## Push the synchronized branch

```bash
git push -u origin <branch-name>
```

If the branch was rebased and already exists remotely:

```bash
git push --force-with-lease origin <branch-name>
```

## Sync a fork with upstream

```bash
git remote add upstream <original-repo-url>
git fetch upstream
git checkout <default-branch>
git merge upstream/<default-branch>
git push origin <default-branch>
```

Use rebase instead of merge only when the fork owner explicitly prefers it.
