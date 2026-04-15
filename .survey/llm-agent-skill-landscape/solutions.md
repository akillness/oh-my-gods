# Solution Landscape: oh-my-gods skill improvement loop

## Solution List

| Name | Approach | Strengths | Weaknesses | Notes |
|------|----------|-----------|------------|-------|
| Agent Skills standard | Cross-tool SKILL.md packaging standard | Portable structure, supporting-file model, description/eval guidance | Still leaves quality enforcement to maintainers | Strong fit for repo-wide normalization |
| Claude Code skills + subagents | Native skills, hooks, and specialized agents | Mature invocation controls, subagent delegation, supporting-file patterns | Claude-specific extensions beyond the shared standard | Strong reference model for workflow skills |
| OpenAI Codex skills + subagents | Native skills, rules, hooks, and subagents in Codex docs | Skills and automation are now first-class in official OpenAI surfaces | Public examples are newer and ecosystem patterns are still consolidating | Strong signal that eval-ready workflow skills matter |
| Gemini CLI extensions + custom commands | Extension packaging plus command-level prompt injection | Good packaging for prompts, MCP, and shared commands | Weaker shared language for rules/hooks than Claude/Codex | Useful for OHMG portability decisions |
| LangChain Deep Agents | Framework-level subagents, state, and memory patterns | Strong for complex orchestration and decomposition | Not a direct SKILL.md distribution layer | Influences which orchestration skills deserve deeper references |

## Categories

- Shared standard: Agent Skills
- Native agent tooling: Claude Code, OpenAI Codex, Gemini CLI
- Framework patterns: LangChain Deep Agents

## What People Actually Use

In practice, teams mix a small set of reusable skill packages with
platform-native orchestration controls. They still rely on manual review gates,
explicit permissions, and targeted supporting files rather than one giant
prompt for everything. That makes compact entrypoints plus eval-backed workflow
skills the main quality bottleneck in this repo.

## Frequency Ranking

This ranking is an inference from current official docs coverage and product
emphasis, not a usage telemetry measurement:

1. Agent Skills packaging and description quality
2. Native skills plus subagents in Claude Code
3. Native skills plus rules/hooks/subagents in Codex
4. Gemini CLI extensions/custom commands
5. Deep Agents patterns for complex orchestration

## Key Gaps

- Repo-wide eval coverage is still low relative to the importance of workflow
  skills.
- Workflow skills that repeat setup, runtime, and deployment detail in the
  entrypoint drift faster than skills that keep the main file compact and push
  detail into references.
- OpenAI Codex automations, Claude subagents, and Gemini extensions all reward
  concise reusable workflow packages, so packaging debt now blocks more
  leverage than adding another broad skill.
- `state-management` is now the strongest active packaging gap because
  `deployment-automation` already merged on PR `#33` while state-management
  still ships on `main` as a large monolith with no packaged support files or
  eval coverage; the active PR-review pass found no bounded fixes, so PR `#34`
  is now merge-ready and `codebase-search` becomes the top queued packaging
  lane once it lands.

## Contradictions

- Ecosystem docs emphasize small entrypoints plus supporting files, but some of
  the repo's highest-leverage skills are still monoliths.
- Platforms increasingly support deterministic control surfaces, but many repo
  skills still rely on prose only and have no measurable pass/fail criteria.

## Key Insight

The highest-value improvement is still not adding another broad skill first. It
is upgrading workflow-critical existing skills into evaluation-ready,
standards-compliant entrypoints so future iterations can optimize them one
bounded mutation at a time. That is why this run advances
`state-management` from PR review into merge readiness on `#34` and leaves
`codebase-search` as the next queued packaging target rather than starting a
fresh `skill-autoresearch` experiment or an unrelated new skill.
