# Genkit workflow patterns

Use this reference when the user needs deeper implementation shape after the
language and provider are already known.

## Flows are the default unit

Keep the main AI path in a flow whenever possible because flows give you:

- typed input and output contracts
- a stable review boundary
- traceability in local tooling
- a cleaner path to deployment and evaluation

If the user is writing raw route handlers with direct generation calls, consider
that a review smell unless the task is intentionally throwaway.

## Pattern chooser

### Simple generation or extraction

Use this when the task is one step and the output is either free text or a
small structured shape.

Good fit:

- summarize content
- classify or extract fields
- transform text into a typed result

### Prompt assets with Dotprompt

Use prompt files when prompts need version control, team review, or reuse across
flows. Keep prompt assets focused and avoid hiding runtime branching logic in
the prompt file alone.

### Tool-calling flows

Use tools when the model must fetch data or trigger external actions.

Guardrails:

- keep each tool narrowly scoped
- validate tool input/output
- separate side effects from the model-facing description of the tool
- keep network or API failures explicit in the flow result

### Retrieval-augmented generation

Use RAG when answers must be grounded in indexed content.

Minimum structure:

1. index or ingest path
2. retrieval path
3. answer-generation path
4. evaluation path for retrieval quality and groundedness

Do not present RAG as complete just because the generate step works; retrieval
quality is part of the product contract.

### Chat or session workflows

Use chat/session patterns when conversational state matters across turns.
Separate short-lived request data from persisted conversation state so review
and debugging stay understandable.

### Multi-step orchestration

Use multiple flows only when one flow becomes too broad or mixes clearly
different responsibilities. Explain the handoff boundaries between subflows.

Avoid “multi-agent” framing unless the workflow genuinely needs specialist
delegation or iterative coordination.

## Review checklist

- Does each flow have one clear job?
- Are input/output schemas explicit where the API contract matters?
- Are tools, retrieval, and prompt assets separated cleanly?
- Is null or malformed model output handled deliberately?
- Is there a local path to inspect behavior before deployment?

## Official docs

- Flows: https://genkit.dev/docs/flows/
- Prompt management / Dotprompt: https://genkit.dev/docs/dotprompt/
- Tool calling: https://genkit.dev/docs/tool-calling/
- RAG: https://genkit.dev/docs/rag/
- Multi-agent systems: https://genkit.dev/docs/multi-agent/
