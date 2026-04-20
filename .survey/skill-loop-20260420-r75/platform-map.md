# Settings

- Keep skill metadata portable and compact so hosts can discover the lane
  without loading a long inline cookbook.
- Preserve progressive disclosure by moving detailed env-file precedence and
  validation rules into local references.

# Rules

- Standardize one bounded skill lane per run.
- Do not reopen already-merged lanes unless review feedback or measured
  failures justify it.
- Add `references/` and `evals/` only when they materially improve trigger
  quality and reviewability.
- Defer `skill-autoresearch` until a packaged lane still misses objective
  checks after review.

# Hooks

- Repo audit: find large skills with no evals or support files.
- PR state check: confirm whether the current lane is merged, open, or stale.
- Post-packaging validation: run `python3 validate_frontmatter.py` before PR
  registration.

# Platform Gaps

| Platform | Relevant signal | Packaging implication |
|---|---|---|
| GitHub Copilot | Cross-host agent skills support and official docs | Keep directories portable and provenance-friendly |
| Claude / Codex / Gemini-style hosts | Progressive disclosure and sibling route-outs matter more than giant inline prompts | Keep main entrypoints compact and support files focused |
| Repo-local recurring loop | Needs measurable, one-lane-at-a-time diffs | Prefer bounded packaging passes before any mutation loop |
