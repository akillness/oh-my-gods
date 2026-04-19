# Git Submodule Decision And Setup

Use this reference when the user is deciding whether submodules are the right
boundary or needs the clean setup path for an existing or new submodule.

## Decide whether submodule is the right tool

Use a submodule when:

- the dependency is its own repository with its own release or review lifecycle
- the parent repo should pin an exact commit rather than float automatically
- provenance and upstream separation matter more than contributor convenience

Prefer subtree or vendoring when:

- contributors need one-repo edits without detached-HEAD or pointer management
- private-network or CI auth makes recursive checkout fragile
- the code should travel as copied source instead of a separately versioned repo

Prefer package-manager delivery when:

- the dependency belongs in npm, pip, Cargo, or another language ecosystem
- the team mainly wants semver updates, lockfiles, and registry caching

## Add a submodule

```bash
git submodule add <repository-url> <path>
git add .gitmodules <path>
git commit -m "Add <name> as a submodule"
```

If the parent should track a specific branch:

```bash
git submodule add -b main <repository-url> <path>
git config -f .gitmodules submodule.<path>.branch main
git add .gitmodules <path>
git commit -m "Add <name> submodule tracking main"
```

Afterward verify:

```bash
git submodule status --recursive
git config -f .gitmodules --get-regexp 'submodule\\..*\\.(path|url|branch)'
```

## Clone and bootstrap an existing repo

Fresh clone:

```bash
git clone --recursive <repository-url>
```

Existing clone:

```bash
git submodule update --init --recursive
```

When submodules themselves contain submodules, keep `--recursive`.

## CI and private access

In CI, turn on recursive checkout explicitly rather than assuming default host
behavior. For GitHub Actions, the common pattern is:

```yaml
- uses: actions/checkout@v4
  with:
    submodules: recursive
```

For private submodules, verify that the checkout token or SSH key can read both
the parent repository and the submodule repository before treating the setup as
complete.
