# Context

## Workflow Context

- The active recurring lane is no longer selecting a new skill; it is
  reviewing an already-open PR for `vercel-deploy`.
- Primary-source survey signals still favor compact, standards-clean skill
  packaging with references and evals over reopening the target into a broader
  mutation loop.
- Post-open review found only bounded support-surface issues, not a reason to
  switch away from the `vercel-deploy` lane.

## Affected Users

- Maintainers deciding whether PR `#79` is ready to merge
- Future scheduler runs that need a durable record of what the review stage
  checked and what was fixed
- Users relying on `vercel-deploy` rollout references during promotion or
  rollback work

## Current Workarounds

- Reviewers compare the new references against live Vercel docs because the PR
  introduced new rollout guidance
- Merge is held until the reference commands and condensed skill surface are in
  sync with current behavior

## Adjacent Problems

- Beta verification helpers can look like default commands unless their status
  and prerequisites are made explicit
- Condensed discovery surfaces such as `SKILL.toon` can drift from `SKILL.md`
  during a packaging rewrite
- Review-stage state can be lost if the recurring loop only records the
  original packaging pass

## User Voices

- GitHub's April 16, 2026 `gh skill` launch increases the value of packaged,
  provenance-friendly skill directories:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli
- Agent Skills still favors `SKILL.md` plus optional support files and
  progressive disclosure:
  https://agentskills.io/specification
- Vercel's current CLI docs mark `vercel curl` and `vercel httpstat` as beta
  surfaces with versioned prerequisites:
  https://vercel.com/docs/cli/curl
  https://vercel.com/docs/cli/httpstat
