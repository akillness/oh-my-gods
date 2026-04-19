# Triage

- Problem: `oh-my-gods` has broad coverage, but several high-frequency skills still use older, inline-heavy instruction styles with weak trigger boundaries and no eval coverage. The repo needs a repeatable way to choose the next highest-value improvement target without redoing recent work.
- Audience: maintainers of `oh-my-gods` and downstream agents that rely on these skills for routing, progressive disclosure, and safe execution.
- Why now: as of April 19, 2026, the repo has no open PRs, recent loop work already covered `playwriter`, `workflow-automation`, `ralphmode`, `testing-strategies`, and `code-review`, and the broader skill ecosystem is shifting toward stricter security/governance, validation, registry search, and eval-backed discoverability.
