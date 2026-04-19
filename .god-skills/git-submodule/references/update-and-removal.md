# Git Submodule Update And Removal

Use this reference when the user already has a submodule and needs to update a
pointer, recover from detached HEAD, or remove the submodule cleanly.

## Update a submodule pointer safely

Review the current state first:

```bash
git submodule status --recursive
git diff --submodule
```

If the submodule tracks a branch:

```bash
git submodule update --remote --merge <path>
git add <path>
git commit -m "Update <name> submodule pointer"
```

If you want one exact upstream commit:

```bash
cd <path>
git fetch origin
git checkout <commit-or-tag>
cd ..
git add <path>
git commit -m "Pin <name> submodule to <ref>"
```

Treat the parent commit as the reviewed record of the pointer move.

## Recover from detached HEAD

If work already exists inside the submodule:

```bash
cd <path>
git status
git switch -c <new-branch-name>
git add .
git commit -m "Save in-progress submodule work"
git push -u origin <new-branch-name>
cd ..
git add <path>
git commit -m "Update <name> submodule pointer"
```

If the intended branch already exists, switch to it before editing instead of
committing on detached HEAD.

## Remove a submodule cleanly

```bash
git submodule deinit -f <path>
git rm -f <path>
rm -rf .git/modules/<path>
git commit -m "Remove <name> submodule"
```

Then verify:

```bash
git status --short --branch
git config -f .gitmodules --get-regexp 'submodule\\..*' || true
```

If `.gitmodules` is now empty, remove it in the same change rather than leaving
dead config behind.
