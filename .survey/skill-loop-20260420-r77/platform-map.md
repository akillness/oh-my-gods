# Settings

- Keep the main entrypoint compact so hosts can discover the structured-data
  analysis lane without loading a long cookbook of inline snippets.
- Move lane-selection and data-quality detail into local references for
  progressive disclosure.

# Rules

- Standardize one bounded skill lane per run.
- Do not reopen already-merged lanes unless review feedback or measured
  failures justify it.
- Add `references/` and `evals/` when they materially improve trigger
  precision, route-outs, and reviewability.
- Defer `skill-autoresearch` until the packaged skill still fails objective
  checks after review.

# Hooks

- Repo audit: find generic single-file skills with no evals and weak route-outs.
- PR state check: confirm the previous lane is merged before choosing the next target.
- Post-packaging validation: run repo and skill validators before PR registration.

# Platform Gaps

| Platform | Relevant signal | Packaging implication |
|---|---|---|
| GitHub Copilot and `gh skill` | Portable skill directories and provenance matter more | Keep the entrypoint compact and support files local |
| Claude, Codex, Gemini-style hosts | Overlap-heavy skills misroute when route-outs are buried or absent | Put sibling boundaries near the top of the skill |
| OpenAI eval tooling | Reproducible eval gates matter before optimization | Add local evals before considering a mutation loop |
| Repo-local recurring loop | Needs one-lane-at-a-time diffs with measurable checks | Prefer references plus evals before autoresearch |
