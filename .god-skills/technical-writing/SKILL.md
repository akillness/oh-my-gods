---
name: technical-writing
description: >
  Write or review technical specs, architecture docs, runbooks, and other
  engineering-facing documentation. Use when the user needs internal technical
  writing, wants help choosing the right documentation shape, or needs a draft
  reviewed for clarity, completeness, and operational risk. Triggers on:
  technical spec, architecture doc, runbook, system design doc, engineering
  documentation, developer documentation, ADR, internal docs.
allowed-tools: Read Write Edit Glob Grep
metadata:
  tags: technical-writing, documentation, specs, architecture, runbooks, adrs
  platforms: Claude, ChatGPT, Gemini, Codex
  version: "2.0.0"
---

# Technical Writing

Technical writing works best when the document is shaped around one reader job.
Keep the entrypoint focused on audience, document lane, and review risk, then
load the support files only when a template or checklist materially helps.

## When to use this skill

- Draft or review a technical specification for engineers or cross-functional
  reviewers
- Write or tighten an architecture document, ADR, or system design narrative
- Produce a runbook or operational guide for deploy, incident, or maintenance
  work
- Improve an engineering-facing document for clarity, structure, and action
- Decide whether a documentation request should be routed to a more specific
  sibling skill

Prefer a sibling skill when the request is narrower than general technical
writing:

- `api-documentation` for OpenAPI, endpoint reference docs, or SDK docs
- `user-guide-writing` for onboarding, tutorials, FAQ, or screenshot-heavy
  end-user docs
- `changelog-maintenance` for release notes or changelog work

## Instructions

### Step 1: Triage the reader and the job

Capture the minimum facts before drafting:

- primary reader: engineer, operator, stakeholder reviewer, or mixed team
- document job: decision record, implementation guide, operations aid, or
  review artifact
- expected action after reading: approve, build, deploy, debug, or hand off
- risk level: what breaks if the document is vague or wrong

If the audience or job is unclear, narrow that first instead of filling a
generic template.

### Step 2: Pick the narrowest document lane

Use the smallest shape that fits the request:

- technical spec for goals, constraints, solution design, rollout, and open
  questions
- architecture doc or ADR for boundaries, tradeoffs, and component
  relationships
- runbook for deploy, rollback, monitoring, troubleshooting, and escalation
- general technical review when the user already has a draft and wants it
  tightened

Do not default to an all-purpose document that mixes architecture, API
reference, onboarding, and release notes into one answer.

### Step 3: Write for decisions and action

Keep the draft useful to the target reader:

- state the purpose near the top
- name assumptions, constraints, and non-goals explicitly
- use examples, commands, or checklists only when they help the reader act
- include verification, monitoring, rollback, or escalation paths when the
  document drives operational work
- remove sections that do not support the selected lane

### Step 4: Pull support files only when they add leverage

Load the smallest support file that matches the request:

- `references/document-templates.md` for spec, architecture, and runbook
  skeletons plus sibling-skill boundaries
- `references/review-checklists.md` for clarity, completeness, and maintenance
  checks when drafting or reviewing

### Step 5: Review the document before handing it off

Before calling the draft done:

- confirm the document matches one reader job
- check that prerequisites come before procedures
- make sure commands, examples, and links are accurate when present
- call out open questions instead of hiding uncertainty
- note when the document should be maintained alongside changing code or
  infrastructure

## Examples

### Example 1: Technical spec request

Input:

```text
Write a technical spec for a feature that syncs customer profiles between
Salesforce and our internal admin tool.
```

Expected shape:

- identifies the request as a technical spec
- includes goals, constraints, design sections, and rollout or rollback notes
- keeps the audience on engineers or reviewers instead of end users

### Example 2: Runbook request

Input:

```text
We need a runbook for the payments worker because queue backlog spikes during
deploys.
```

Expected shape:

- identifies the request as an operational runbook
- includes dependencies, monitoring, troubleshooting, and rollback guidance
- treats the reader as operators or on-call engineers

### Example 3: Specialized lane routing

Input:

```text
Document our public REST API for external developers and include request and
response examples.
```

Expected shape:

- recognizes API reference work as the primary need
- routes to `api-documentation` or explicitly frames the answer as OpenAPI or
  endpoint-reference documentation
- avoids responding with a generic architecture-document template

## Best practices

- Choose the reader and document job before choosing a template
- Prefer one strong document lane over a bloated hybrid document
- Use support files for reusable templates and review checklists, not for core
  triage rules
- Keep operational documents explicit about verification and rollback
- Route specialized API, end-user, or changelog requests to sibling skills
- Treat documentation drift as a maintenance risk and say so when it matters

## References

- `references/document-templates.md`
- `references/review-checklists.md`
