# Triage

- Problem: the next high-value remaining skill gap after `data-analysis` merged
  is `pattern-detection`, which is still a generic single-file scan cookbook
  with weak trigger boundaries and no local references or evals
- Audience: maintainers of `oh-my-gods` and downstream agents that need clean
  routing between pattern scans, log triage, debugging, security review, and
  structured data analysis
- Why now: PR `#73` is already merged on `origin/main`, so this recurring loop
  needs a new bounded lane instead of reopening stale review work
