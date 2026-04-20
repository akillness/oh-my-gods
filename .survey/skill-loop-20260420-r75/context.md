# Workflow Context

- The repo's recent merged lanes all improved high-leverage skills by shrinking
  oversized entrypoints and adding only the support files needed for
  progressive disclosure.
- `environment-setup` is still a long generic recipe sheet with no local
  references, no eval coverage, and no compact companion surface.
- The live GitHub state matters because the recurring loop should advance one
  bounded lane at a time instead of reopening already-merged PRs.

# Affected Users

- Maintainers who need reliable trigger behavior and low-review-noise diffs.
- Agent users who need a clear boundary between env policy, deployment,
  machine bootstrap, and auth/security work.
- Future loop runs that should avoid re-discovering already-closed lanes.

# Current Workarounds

- Leave generic multi-framework snippets inline in one large `SKILL.md`.
- Depend on user interpretation to separate env policy from Docker, rollout, or
  auth work.
- Skip measurable trigger checks because the skill has no eval package.

# Adjacent Problems

- Env-file sprawl often overlaps with `system-environment-setup`,
  `deployment-automation`, `authentication-setup`, and
  `security-best-practices`, so weak route-outs cause overlap.
- Large single-file skills are harder to keep portable across GitHub Copilot,
  Claude Code, Codex, and other hosts.

# User Voices

- This run used repo audit plus primary platform/spec documentation instead of
  a fresh community-voice scrape because the ecosystem signal was stable and
  the immediate decision was the next bounded repo-local packaging lane.

# Sources

- https://agentskills.io/specification
- https://docs.github.com/en/copilot/concepts/agents/about-agent-skills
- https://github.blog/changelog/2025-12-18-github-copilot-now-supports-agent-skills
