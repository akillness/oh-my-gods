# Conflicts Recovery And Collaboration

Use this reference when the user is in trouble: merge conflicts, wrong-branch
commits, undoing a bad move, or preserving teammate safety on a shared branch.

## Resolve conflicts deliberately

When merge or rebase stops on conflicts:

```bash
git status
```

Then:

1. Open each conflicted file.
2. Resolve the `<<<<<<<`, `=======`, `>>>>>>>` sections.
3. Re-run relevant checks if code changed.
4. Stage the resolved files.

Continue or stop explicitly:

```bash
git add <resolved-files>
git rebase --continue
git rebase --abort
git commit    # if resolving a merge commit
```

## Recover from a wrong-branch commit

If the commit is local and should move elsewhere:

```bash
git branch <correct-branch-name>
git checkout <correct-branch-name>
git checkout main
git reset --hard HEAD~1
```

This is only safe because the commit remains reachable on the new branch. If
the user has any doubt, inspect `git log --oneline --graph -5` before and
after the reset.

## Prefer revert on shared history

If the branch or commit is already pushed and collaborators may depend on it,
prefer:

```bash
git revert <commit-hash>
```

For merge commits:

```bash
git revert -m 1 <merge-commit-hash>
```

Use reset or rebase on shared history only with explicit coordination.

## Use reflog for recovery

When the user thinks work is lost:

```bash
git reflog
git checkout -b recovered-work <reflog-or-commit-hash>
```

Reflog is the first recovery surface after accidental reset, bad rebase, or
branch deletion.

## Collaborate safely on reviewed branches

- confirm whether the branch is shared before rebasing
- announce rebases that require `push --force-with-lease`
- never use blind `--force`
- verify branch state after recovery with status and log
