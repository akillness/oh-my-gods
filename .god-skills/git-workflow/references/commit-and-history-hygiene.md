# Commit And History Hygiene

Use this reference when the user mainly needs staging, commit-message, or log
inspection guidance.

## Review before committing

Check the repo state and staged scope first:

```bash
git status --short
git diff
git diff --staged
```

Stage intentionally:

```bash
git add path/to/file
```

Use broad staging only when the whole change is known to be coherent.

## Write commit messages that explain why

A good commit message states the intent and the reason, not just the file list.

Common prefixes:

- `feat`
- `fix`
- `docs`
- `refactor`
- `test`
- `chore`

Simple shape:

```text
type(scope): short intent

Why the change matters
```

## Amend or split carefully

Amend only when the last commit is still local and rewriting it will not
surprise collaborators:

```bash
git commit --amend
git commit --amend --no-edit
```

If the user needs to split work, prefer making a new focused commit over
rewriting shared history by default.

## Inspect recent history

Useful commands:

```bash
git log --oneline --graph -10
git show --stat HEAD
git log --follow -- path/to/file
git log --grep="<keyword>"
```

Use these before suggesting cleanup so the user understands what is about to be
rewritten.

## Keep PRs reviewable

- keep each branch focused on one change theme
- stage and commit in logical slices
- check `git diff <base>...HEAD` before pushing
- avoid mixing refactors, formatting, and behavior changes unless necessary
