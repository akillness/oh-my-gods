# Triage
- Problem: `web-design-guidelines` still uses a thin 1.0 entrypoint with broad triggers, no packaged references or evals, and a live dependency on Vercel's guideline command file without support-surface guardrails.
- Audience: maintainers and users who invoke the skill for UI audits, accessibility-adjacent checks, and front-end review work across agent hosts.
- Why now: PR `#79` for `vercel-deploy` is merged, there are no open recurring-loop PRs, and this skill is now the highest-leverage remaining review surface with stale packaging.
