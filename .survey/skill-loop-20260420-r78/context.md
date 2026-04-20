# Workflow Context

- The recurring loop already closed `debugging`, `performance-optimization`,
  `monitoring-observability`, `log-analysis`, `environment-setup`,
  `user-guide-writing`, and `data-analysis`.
- The next useful lane must be bounded, standards-clean, and reusable across
  agent hosts.
- `pattern-detection` still mixes code smells, security scans, data anomalies,
  and trend analysis without clear ownership boundaries.

# Affected Users

- Repo maintainers who want another reviewable packaging improvement
- Agents choosing between pattern scans, runtime triage, debugging, security,
  and business analysis
- Reviewers who need route-out behavior to be reproducible instead of ad hoc

# Current Workarounds

- Rely on a broad single-file skill with example grep commands
- Let neighboring skills absorb ambiguous requests after the fact
- Re-discover boundaries manually because there are no local references or evals

# Adjacent Problems

- Over-triggering into `pattern-detection` when the real job is `log-analysis`
  or `security-best-practices`
- Under-specified anomaly work that should stay on `pattern-detection`
- No durable eval surface before considering `skill-autoresearch`

# User Voices

- Maintainers need the loop to move forward instead of reopening already-merged
  lanes
- The highest-value packaging work remains skills that are still generic
  single-file entrypoints with no route-clean support files
