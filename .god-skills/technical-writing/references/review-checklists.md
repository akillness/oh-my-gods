# Technical Writing Review Checklists

Use these checklists to tighten a draft after the main structure is chosen.

## Audience triage

- Who will read this first: engineer, operator, stakeholder, or mixed team?
- What decision or action should the reader be able to make after reading it?
- What prior knowledge can safely be assumed?
- What failure or risk matters most if the document is wrong or incomplete?

If these answers are missing, get them before expanding the document.

## Clarity checklist

- State the purpose in the opening section.
- Define unfamiliar terms before using them repeatedly.
- Keep each section answerable with one clear question or decision.
- Prefer concrete examples over abstract advice.
- Name assumptions, constraints, and open questions explicitly.

## Technical completeness checklist

- Prerequisites are listed before procedures.
- Error cases and rollback paths are present when the document drives action.
- Monitoring or verification steps exist for operational documents.
- Security, privacy, and data handling are named when relevant.
- References point to the authoritative source of truth when one exists.

## Visual and formatting checklist

- Use diagrams only when they reduce cognitive load.
- Keep tables for comparison or structured parameters, not for simple prose.
- Test code blocks and commands when they are meant to be copied.
- Remove placeholder text before finalizing.
- Match terminology and formatting across sibling docs.

## Review workflow

1. Ask whether the draft solved the target reader's job.
2. Remove sections that do not support that job.
3. Check examples, commands, and links for accuracy.
4. Ask a likely reader to review the draft when stakes are high.
5. Record what needs periodic refresh, especially if APIs or infrastructure
   change often.

## Common failure patterns

- The document mixes multiple audiences and satisfies none of them well.
- The reader gets templates but no decision guidance for which one to use.
- The draft repeats API or end-user documentation that belongs in a more
  specific sibling skill.
- The prose explains what exists but not how to act on it.
- Operational documents omit rollback, alerts, or escalation paths.
