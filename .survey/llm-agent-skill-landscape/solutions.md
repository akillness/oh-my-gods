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

In practice, teams mix a small set of reusable skill packages with platform-native orchestration controls. They still rely on manual review gates, explicit permissions, and targeted supporting files rather than one giant prompt for everything. That makes monolithic skills without evals the main quality bottleneck in this repo.

## Frequency Ranking

This ranking is an inference from current official docs coverage and product emphasis, not a usage telemetry measurement:

1. Agent Skills packaging and description quality
2. Native skills plus subagents in Claude Code
3. Native skills plus rules/hooks/subagents in Codex
4. Gemini CLI extensions/custom commands
5. Deep Agents patterns for complex orchestration

## Key Gaps

- Repo-wide eval coverage is extremely low relative to the importance of workflow skills.
- Realistic benchmark evidence shows skill benefits degrade sharply when retrieval quality and skill quality are weak, so refinement loops need explicit evals instead of intuition-only edits.
- Central orchestration skills (`omg`, `omx`) are not yet packaged in the same evaluation-ready shape that current ecosystems reward.
- The `survey` skill itself lacked the standard sections and eval scaffold needed to serve as the front door for recurring research loops.

## Contradictions

- Ecosystem docs emphasize small entrypoints plus supporting files, but some of the repo's highest-leverage skills are still monoliths.
- Platforms increasingly support deterministic control surfaces, but many repo skills still rely on prose only and have no measurable pass/fail criteria.

## Key Insight

The highest-value improvement is not adding another broad skill first. It is upgrading workflow-critical existing skills into evaluation-ready, standards-compliant entrypoints so future iterations can optimize them one bounded mutation at a time. Recent benchmark work reinforces that query-specific refinement helps only when the initial skill is already relevant and measurable.
