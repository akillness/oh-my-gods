# Platform Map: recurring oh-my-gods skill loop

## Settings

- Progressive disclosure still matters across agent hosts: compact metadata,
  bounded `SKILL.md`, and on-demand support files remain the portable default
  shape. Source: https://agentskills.io/specification
- GitHub's new `gh skill` surface increases the value of standard skill
  packaging and clean update paths. Source:
  https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli

## Rules

- Keep one bounded lane per run
- Prefer references and evals before `skill-autoresearch`
- Do not reopen merged lanes without review feedback or measured failures
- Pick skills whose descriptions and route-outs materially improve host-side
  auto-trigger quality

## Hooks

- Survey after merges so lock state does not drift behind GitHub
- Validate the repo after every bounded packaging pass
- Open a PR as soon as the bounded change set is ready

## Platform Gaps

| Surface | Current repo gap | Why `debugging` won |
|---|---|---|
| Agent Skills packaging | Some workflow-critical skills still lack refs/evals | `debugging` is high-frequency and still generic |
| Trigger quality | Weak route-outs can send work to the wrong skill | `debugging` has the clearest sibling-boundary repair opportunity |
| Mutation readiness | Not every remaining gap needs autoresearch yet | `debugging` first needed packaging and evals, not optimization experiments |
