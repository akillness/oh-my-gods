# Persistence And Capture Patterns

Use this reference when the user wants to decide what belongs in OpenContext
and how to store it for later reuse.

## Highest-value note types

The OpenContext usage guide recommends storing durable material such as:

- project background
- known pitfalls
- API contracts
- acceptance criteria
- dependency or version notes

These tend to age better than raw chat transcripts and are easier for agents to
search and reuse.

## Before / during / after workflow

Before work:

- load background or generate a manifest for the current task

During work:

- search prior conclusions when the agent is uncertain
- create a draft doc when the task exposes a reusable pattern or unresolved
  question

After work:

- persist the final decision, fix summary, pitfall, or next-step packet

## Global library behavior

OpenContext stores contexts in a shared library by default, so material can be
reused across repos and dates. That is powerful, but it means users should:

- keep folder names and doc descriptions explicit
- avoid vague dumping-ground notes
- prefer one durable note per topic over scattering fragments across many docs

## Good capture heuristic

Write to OpenContext when a future agent would otherwise have to rediscover the
same fact, decision, or failure pattern. Skip it when the information is
ephemeral, purely conversational, or already captured elsewhere in a durable
source of truth.

## Verification

- confirm the new doc exists in the intended folder
- confirm the description makes the note discoverable
- confirm a simple keyword search can find the note later

## Sources

- https://0xranx.github.io/OpenContext/en/usage/
