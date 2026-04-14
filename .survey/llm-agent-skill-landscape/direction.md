# Direction Lock: recurring oh-my-gods skill improvement loop

## Audit snapshot

- PR `#29` for `database-schema-design` merged into `main` on
  `2026-04-14T20:05:52Z`, so that lane is closed.
- PR `#30` for `genkit` merged into `main` at commit
  `34482161d18a27f057434e7c3523cc732734d2a1` on
  `2026-04-15T07:07:40+09:00`, so that lane is closed.
- PR `#31` is now open on `chore/skill-loop-pr-open-20260415-r32` for the new
  `prompt-repetition` packaging lane:
  https://github.com/akillness/oh-my-gods/pull/31
- Repo-wide validator snapshot on this branch is now `80/80` shipped skills
  with `0` hard errors and `67` warnings.
- Eval coverage rises from `26/80` to `27/80` shipped skills because
  `.god-skills/prompt-repetition/evals/evals.json` now exists.
- `prompt-repetition` moved from a `544` line inline skill with no packaged
  support files to a `166` line standards-clean entrypoint backed by local
  references, evals, and a reusable transformer script.
- `prompt-repetition` now has a corrected support contract in `SKILL.toon`, and
  the tracked compiled cache artifact was removed from the packaged surface.

## Survey refresh

The current LLM-agent skill landscape still favors packaging-first work over
prompt-mutation work for this repo:

1. Agent Skills continues to reward a compact `SKILL.md` plus optional support
   folders, so oversized single-file skills still lose leverage until they are
   packaged cleanly.
2. OpenAI Codex now exposes skills and automations as first-class workflow
   surfaces, and its skills guidance explicitly favors focused entrypoints with
   deterministic scripts only where they are justified.
3. Anthropic and Gemini both keep moving toward packaged commands, subagents,
   and extension surfaces, which rewards explicit trigger text and portable
   support files over monolithic prompts.
4. A2A security and agent-card guidance keeps pushing capability disclosure and
   auth requirements into explicit metadata, which reinforces the need for
   compact skill contracts and durable support references.
5. `skill-autoresearch` remains justified only after a skill has both compact
   packaging and baseline eval coverage.

## Locked direction

Improve one workflow-critical packaging gap per run, in priority order:

1. `prompt-repetition` via PR `#31`
2. `technical-writing`
3. `deployment-automation`
4. `skill-autoresearch` mutations only where a compact, eval-backed baseline
   already exists

This order is locked because:

- `prompt-repetition` had the best next bounded signal after `genkit` landed:
  five validator warnings, no packaged support surface, an existing reusable
  helper that justified a `scripts/` folder, and direct fit with the current
  lightweight-model workflow landscape.
- `technical-writing` and `deployment-automation` remain strong packaging
  targets, but both still have lower immediate warning pressure than the lane
  already opened in PR `#31`.
- `skill-autoresearch` is still not justified for the large non-eval backlog
  until those skills have compact structure and packaged evals.

## Skill-autoresearch triage

| Skill | Leverage | Ready for mutation loop now? | Needs assets | Needs scripts | Needs references | Needs evals | Next bounded action |
|------|----------|-------------------------------|-------------|--------------|------------------|------------|---------------------|
| `genkit` | High | No | No | No | Added on merged PR `#30` | Added on merged PR `#30` | Closed for now; reconsider mutations only if repeated measured failures appear |
| `prompt-repetition` | Medium-high | No | No | Added on this branch | Added on this branch | Added on this branch | Review PR `#31`, then merge if the lane stays clean |
| `survey` | Medium | Not yet | No | No | Maybe later | Already present | Keep as the landscape capture surface |
| `skill-standardization` | Medium | Not yet | No | Existing validator script is enough | No | Already present | Keep as the audit gate |
| `skill-autoresearch` | Medium | Already packaged | No | No | Already present | Already present | Use only on compact skills with stable eval-backed baselines |

## Packaging decision for this run

- Target skill: `prompt-repetition`
- Assets: no new assets needed
- Scripts: yes; the existing transformer now lives in `scripts/` because this
  lane needs a deterministic reusable implementation
- References: yes; research and integration detail moved into local support
  files instead of staying inline in the activation surface
- Evals: yes; this skill now has a packaged baseline for future review or
  mutation decisions
- Sections: the main skill is now compact and standards-clean, and `SKILL.toon`
  now points at the real support files

## Current state

- State: the `prompt-repetition` improvement slice is complete and registered
  as PR `#31`
- Blocker: none
- Next owner: `nanoclaw_pd` on the next run to perform the explicit PR-review
  pass on PR `#31`
- Stage: `PR-open`
