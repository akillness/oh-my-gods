# Workflow Context

- The recent highest-value lanes improved reusable skills by shrinking generic
  inline prompts, adding only the support files needed for progressive
  disclosure, and making sibling-skill boundaries explicit near the top.
- `data-analysis` still shipped as an older cookbook-style skill with inline
  pandas and SQL snippets, no local `references/`, no local `evals/`, and weak
  route-outs around dashboards, logs, anomaly hunting, and observability gaps.
- Current ecosystem guidance still rewards compact, provenance-friendly skill
  directories whose entrypoints stay focused while details live in
  `references/` and quality checks live in `evals/`.

# Affected Users

- Maintainers who need small, reviewable diffs and stronger trigger precision.
- Agents that must distinguish structured dataset analysis from dashboard
  construction, raw log triage, and instrumentation design.
- Future loop runs that should not reopen the just-merged `user-guide-writing`
  lane.

# Current Workarounds

- Keep pandas, SQL, and visualization snippets inline in one `SKILL.md`.
- Depend on the model to infer whether a request belongs to
  `looker-studio-bigquery`, `log-analysis`, `pattern-detection`, or
  `monitoring-observability`.
- Skip eval-backed trigger checks because the skill has no local eval package.

# Adjacent Problems

- Dataset work overlaps with BI dashboards, telemetry reviews, anomaly scans,
  and log-heavy debugging, so weak route-outs increase misfires.
- Large single-file skills remain harder to keep portable across Copilot,
  Claude, Codex, and Gemini-style hosts.

# Sources

- https://agentskills.io/specification
- https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills
- https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- https://platform.openai.com/docs/guides/agent-evals
