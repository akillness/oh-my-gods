# Solution Landscape: oh-my-gods skill improvement loop

## Solution List

| Name | Approach | Strengths | Weaknesses | Notes |
|------|----------|-----------|------------|-------|
| Agent Skills standard | Cross-tool SKILL.md packaging standard | Portable structure, supporting-file model, description/eval guidance | Still leaves quality enforcement to maintainers | Strong fit for repo-wide normalization |
| Claude Code skills + subagents | Native skills, hooks, and specialized agents | Mature invocation controls, subagent delegation, supporting-file patterns | Claude-specific extensions beyond the shared standard | Strong reference model for workflow skills |
| OpenAI Codex skills + subagents | Native skills, rules, hooks, and automations in Codex docs | Skills and automation are first-class in official OpenAI surfaces | Public ecosystem patterns are still consolidating | Strong signal that eval-ready workflow skills matter |
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
prompt for everything. Inference for this repo: that makes compact entrypoints
plus eval-backed workflow skills the main leverage bottleneck, especially for
bridge skills that sit between a delivery workflow and a fast-moving framework
ecosystem.

## Frequency Ranking

This ranking is an inference from current official docs coverage and product
emphasis, not a usage telemetry measurement:

1. Agent Skills packaging and description quality
2. Native skills plus subagents in Claude Code
3. Native skills plus rules/hooks/automations in Codex
4. Gemini CLI extensions/custom commands
5. Deep Agents patterns for complex orchestration

## Key Gaps

- Repo-wide eval coverage is still low relative to the importance of workflow
  skills.
- Workflow skills that repeat setup, runtime, and long example detail in the
  entrypoint drift faster than skills that keep the main file compact and push
  detail into references.
- OpenAI Codex, Claude subagents, and Gemini extensions all reward concise
  reusable workflow packages, so packaging debt still blocks more leverage than
  prompt mutation on oversized skills in this repo.
- Bridge skills that sit between two ecosystems are the most drift-prone when
  they have no support files. `langchain-bmad` was the clearest example before
  its standards pass because it combined BMAD and LangChain guidance in one
  inline surface with no `references/` or `evals/`.
- Survey and audit skills are especially sensitive to evidence quality drift:
  if they cannot distinguish direct page retrieval from thin snippets, later
  planning lanes inherit avoidable uncertainty.
- Workflow skills still need careful review for hidden hard-coded assumptions,
  such as default remote/base names or destructive recovery shortcuts, even
  after they are packaged.

## Contradictions

- Ecosystem docs emphasize small entrypoints plus supporting files, but some of
  the repo's highest-leverage skills are still monoliths.
- Platforms increasingly support deterministic control surfaces, but many repo
  skills still rely on prose only and have no measurable pass/fail criteria.

## Key Insight

The highest-value improvement is still not adding another broad skill first. It
is upgrading workflow-critical existing skills into evaluation-ready,
standards-compliant entrypoints so future iterations can optimize them one
bounded mutation at a time. After `agent-evaluation` closed via merged PR
`#53`, the queue advances to `survey`: a central intake skill that still lacks
an explicit evidence-recovery support file even though current ecosystem drift
increasingly punishes weak or stale sourcing.
