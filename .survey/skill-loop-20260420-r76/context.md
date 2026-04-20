# Workflow Context

- The recent high-value lanes improved reusable skills by shrinking generic
  inline entrypoints and adding only the support files needed for progressive
  disclosure and bounded review.
- `user-guide-writing` still ships as a long single-file template dump with no
  focused route-outs, no local references, and no eval-backed trigger checks.
- The current ecosystem signal still rewards portable skill directories with
  compact entrypoints, provenance-friendly packaging, and support files that
  load only when needed.

# Affected Users

- Maintainers who need low-noise diffs and measurable trigger surfaces.
- Agents that must distinguish customer-facing help content from internal docs,
  API docs, and release-note work.
- Future loop runs that should avoid reopening already-merged lanes.

# Current Workarounds

- Keep many document shapes, screenshots, and troubleshooting patterns inline
  in one large `SKILL.md`.
- Depend on the model to infer whether a request belongs to
  `technical-writing`, `api-documentation`, or `changelog-maintenance`.
- Skip eval-backed trigger checks because the skill has no local eval package.

# Adjacent Problems

- User-facing docs frequently overlap with internal engineering docs, API
  reference, and release comms, so weak route-outs increase misfires.
- Large single-file skills remain harder to keep portable across GitHub
  Copilot, Claude Code, Codex, and Gemini-style hosts.

# Sources

- https://agentskills.io/specification
- https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- https://code.claude.com/docs/en/sub-agents
- https://platform.openai.com/docs/guides/agents-sdk/
