# video-production direction reference

Load this reference after `video-production` is selected. Keep `SKILL.md`
focused on activation, route-outs, high-level steps, and reusable examples.

## Why this skill exists

Use `video-production` when the user needs a repeatable video creation workflow
rather than a slide deck, static image set, or broad marketing strategy.

The canonical output is:

1. pipeline choice
2. brief and constraints
3. scene or segment plan
4. asset and validation checklist
5. implementation and render handoff

## Route-in rules

Choose `video-production` when the request is about:

- Remotion or code-first video generation
- automated or programmable video production
- personalized or batch video creation
- template-first plus API/hybrid video workflows
- video variants, captions, localization, or render pipelines

If the user explicitly names `remotion-video-production`, keep the request in
this canonical skill and treat the old name as alias-only discovery.

## Route-out rules

Do not keep adjacent jobs inside `video-production` when they are narrower or
belong to another delivery surface:

- `presentation-builder`
  - editable slide decks
  - investor decks, roadmap decks, workshop slides
- `marketing-automation`
  - launch messaging
  - campaign strategy
  - funnel or lifecycle planning without a real video artifact
- `imagegen`
  - single bitmap images, thumbnails, textures, or mockups

## Minimum video brief

Produce a compact brief with:

- audience and distribution channel
- goal and call to action
- output format and duration
- pipeline choice: code-first, template-first, or hybrid
- asset constraints
- review and render checkpoints

## Pipeline chooser

- code-first
  - best for Remotion, dynamic timelines, reusable scene components,
    personalized variants, or render automation
- template-first
  - best for simple high-volume content where code ownership is not central
- hybrid
  - best when templated assets still need programmable assembly, captions,
    localization, or API-driven variants

## Validation checklist

Before final handoff, check:

- duration and pacing
- text readability and safe zones
- narration and audio sync
- asset completeness
- export or render target
- variant requirements such as aspect ratio, captions, or locale

## Source anchors checked on 2026-04-18

- Agent Skills specification:
  `https://agentskills.io/specification`
- Agent Skills best practices:
  `https://agentskills.io/skill-creation/best-practices`
- LangChain skills launch:
  `https://blog.langchain.com/langchain-skills/`
- LangChain skill evaluation guidance:
  `https://blog.langchain.com/evaluating-skills/`
- GitHub CLI `gh skill` launch:
  `https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli`
- OpenAI Codex skills overview:
  `https://developers.openai.com/codex/skills`

Current ecosystem signal still favors compact skill entrypoints, clear trigger
wording, explicit route-outs, and progressive disclosure through support files
only when they add concrete leverage.
