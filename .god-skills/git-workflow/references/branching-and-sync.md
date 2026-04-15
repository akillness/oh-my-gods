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
git fetch origin
git log --oneline --graph --decorate --max-count=10 HEAD origin/main
```

If the branch is private and the user wants linear history, rebase is usually
fine. If the branch is shared or already under review by multiple people, merge
or a carefully coordinated rebase is safer.

## Rebase path

Use when the branch is personal or the team explicitly expects rebased history:

```bash
git fetch origin
git rebase origin/main
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
git fetch origin
git merge origin/main
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
git checkout main
git merge upstream/main
git push origin main
```

Use rebase instead of merge only when the fork owner explicitly prefers it.
