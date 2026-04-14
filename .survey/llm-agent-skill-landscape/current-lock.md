# Current Lock

Date: 2026-04-15

## Survey refresh

- Agent Skills still centers the ecosystem on `SKILL.md` plus optional support
  folders such as `scripts/`, `references/`, and `evals/`, so packaging-first
  work remains higher leverage than prompt-only mutation for oversized skills.
- The current ecosystem is increasingly organized around MCP and A2A
  interoperability layers, which increases the importance of clear contracts,
  compatibility notes, and support-file based skill packaging.
- Security and trust posture are becoming more important for agent ecosystems,
  which raises the priority of skills that define authentication or other
  privileged boundaries.
- Eval and tracing surfaces are now common enough that `skill-autoresearch`
  should start only after a skill has a compact entrypoint and packaged eval
  coverage.
- Durable execution and review-focused runtime patterns still support the
  repo's staged loop of `survey -> improvement -> PR-open -> PR-review ->
  merge`.

Source links:

- https://agentskills.io/specification
- https://agentskills.io/clients
- https://modelcontextprotocol.io/specification/2025-11-25
- https://a2a-protocol.org/dev/specification/
- https://developers.openai.com/api/docs/guides/agents-sdk
- https://docs.langchain.com/langsmith/core-capabilities
- https://vercel.com/docs/agent-resources/skills

## Live GitHub state

- PR `#27` for `backend-testing` merged into `main` on
  `2026-04-14T16:07:06Z`, so that lane is closed.
- PR `#28` for `authentication-setup` is still open on
  `chore/skill-loop-pr-open-20260415-r29`, with merge state `CLEAN`, no review
  comments, and no status-check blockers as of this review pass.
- This review pass keeps the lane bounded, then prepares the branch for merge:
  https://github.com/akillness/oh-my-gods/pull/28

## Audit snapshot

- Repo-wide validator snapshot on this branch: `80/80` shipped skills pass with
  `0` hard errors, and the repo-wide warning count is now `76`.
- `authentication-setup` validates at `0` errors and `0` warnings under the
  repo's `skill-standardization` validator.
- Eval coverage rises to `24/80` shipped skills because
  `.god-skills/authentication-setup/evals/evals.json` now exists.
- `authentication-setup` now includes the support references it was missing, so
  the entrypoint shrank from `667` lines to `213` lines while keeping framework
  recipes and security guidance bundled locally.
- This review pass found one remaining support-file mismatch: the entrypoint
  promised Node/Python recipe coverage while the packaged reference only
  covered Node/session/OAuth. The branch now includes a bounded Python/FastAPI
  JWT recipe so that the support-file contract matches the entrypoint.
- No new assets or runtime scripts were needed for `authentication-setup` in
  this run; the skill changes were the entrypoint, `SKILL.toon`, references,
  and eval coverage.

## Target decisions

| Skill | Current status | Assets | Scripts | References | Evals | Skill-autoresearch justified now? | Locked next move |
|---|---|---|---|---|---|---|---|
| `authentication-setup` | PR `#28` has been re-reviewed and is merge-ready on `chore/skill-loop-pr-open-20260415-r29` | No | No | Added on this branch because the old entrypoint was oversized and mixed framework/security detail into activation | Added on this branch | No | Merge PR `#28`, then reopen the queue |
| `database-schema-design` | Still a top candidate in the large non-eval backlog | No | No | Likely needed | Needed | No | Keep behind `authentication-setup` |
| `genkit` | Remains large and unevaluated, but behind the current PR-open lane | No | No | Likely needed | Needed | No | Keep behind `authentication-setup` |
| `survey` | Remains the research surface, not the packaging target | No | No | Maybe later | Already present | Not yet | Keep for landscape refresh only |
| `skill-standardization` | Remains the repo audit gate | No | Existing validator is enough | No | Already present | Not yet | Keep as the compliance surface |

## Locked direction

- Primary lane: merge PR `#28` for `authentication-setup` now that the review
  pass is clean after the bounded reference fix.
- Secondary lane: after `authentication-setup` lands, refresh the packaging
  queue among large non-eval skills; current leading candidates remain
  `database-schema-design` and `genkit`.
- Do not start a `skill-autoresearch` mutation loop for the large non-eval
  backlog before the packaging-first queue lands compact entrypoints and evals.
- Keep the branch clean by excluding unrelated docs churn, runtime experiments,
  and already-merged slices.

## Cleanup plan

1. Refresh GitHub and validator state before touching lifecycle stage.
2. Re-run the repo validator and the `skill-standardization` validator for
   `.god-skills/authentication-setup/`.
3. Confirm PR `#28` stays bounded to `.god-skills/authentication-setup/*` plus
   the recurring survey lock files.
4. Merge the lane once the review fix validates cleanly.

## Run action

- Smallest bounded action for this run: close the remaining review mismatch
  inside `authentication-setup`, then move PR `#28` to merge

## Status

- Current state: PR `#28` is reviewed clean and merge-ready for the bounded
  `authentication-setup` packaging slice on
  `chore/skill-loop-pr-open-20260415-r29`
- Blocker: no hard blocker remains; browser/runtime validation is intentionally
  deferred because this slice repackages docs and evals rather than changing a
  live browser workflow
- Next owner: `nanoclaw_pd` to merge PR `#28`, then open the next packaging
  lane
- Stage: `merge`
