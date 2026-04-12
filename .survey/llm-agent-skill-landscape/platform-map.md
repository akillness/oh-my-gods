# Platform Map: LLM-agent skill landscape

## Settings

| Concern | Claude | Codex | Gemini | Common Layer |
|---------|--------|-------|--------|--------------|
| Skill package | `SKILL.md` plus supporting files | `SKILL.md` plus skills docs surface | extensions plus command files | Skill entrypoint plus optional supporting files |
| Delegation unit | subagents | subagents | extensions plus custom commands | specialized execution surfaces |
| Invocation metadata | description, tool access, model, context | skills/rules/hooks/subagents in Codex docs | extension metadata and command description | concise trigger text plus bounded execution context |
| Supporting files | explicit docs for references/scripts/examples | supported by skills and team config patterns | extensions package prompts, MCP, commands | keep entrypoint compact and load detail on demand |

## Rules

| Concern | Claude / OMC | Codex / OMX | Gemini / OHMG | Common Layer |
|---------|---------------|-------------|---------------|--------------|
| Trigger quality | description drives invocation | description plus rules surface | command/extension description | short, explicit trigger wording |
| Permission control | permissions, allowed tools, hooks | rules, hooks, approvals, allowed tools | shell confirmation and extension boundaries | explicit safe/unsafe boundaries |
| Optimization gate | official eval guidance exists via Agent Skills ecosystem | Codex docs surface evals/tools prominently | less standardized, more workflow-local | add evals before mutation loops |

## Hooks

| Lifecycle | Claude | Codex | Gemini | Common Layer |
|-----------|--------|-------|--------|--------------|
| Pre-execution | hooks and scoped skill behavior | hooks/rules configuration | custom-command prompt assembly | inject only the context needed |
| In-flight control | permissions, subagent tool limits | rules, hooks, subagents | confirmation on shell execution | constrain tool use while active |
| Post-run | hooks, teams, schedules | automations, rules, team config | extension restart/update cycle | save artifacts and summarize outcomes |

## Platform Gaps

- Claude has the clearest unified story for skills, subagents, hooks, and permissions.
- Codex clearly exposes the same major surfaces, but the public ecosystem is newer and still converging on reusable patterns.
- Gemini has strong packaging for extensions and commands, but less consistent shared language for rules and hooks, so OHMG needs to keep abstractions explicit.
- For this repo, `settings / rules / hooks` remains the right normalization layer across all three.
