---
name: langextract
description: >
  Extract structured, source-grounded information from unstructured text with
  LangExtract. Use when the user needs entities, relationships, or structured
  data from text, URLs, notes, reports, research papers, or other free-form
  documents and wants exact spans back to the source. Triggers on: information
  extraction, entity extraction, NER, grounded extraction, provenance, schema
  extraction, structured output from text, text mining, langextract,
  annotation, ollama extraction, openai extraction, source-grounded
  extraction.
allowed-tools: Bash Read Write Edit Glob Grep
metadata:
  tags: langextract, information-extraction, nlp, gemini, openai, ollama, structured-output, grounding, provenance
  platforms: Claude, Gemini, Codex, OpenCode
  version: "1.0"
  source: https://github.com/google/langextract
  license: Apache-2.0
---

# langextract — LLM-Powered Structured Information Extraction

Use `langextract` when the core job is extracting structured data from text
while keeping each extraction traceable back to the source.

## When to use this skill

- Extract entities, relationships, or facts from unstructured text
- Process clinical notes, legal documents, research papers, reports, or logs
- Build extraction pipelines that need source grounding, not just final values
- Handle long documents with chunking, parallel workers, and multi-pass recall
- Run extraction on Gemini, OpenAI, Ollama, or a custom provider
- Generate HTML visualizations of extracted spans over the original text

## Do not use this skill

- When the main problem is OCR, PDF layout parsing, or image-to-text recovery
- When the task is ordinary summarization, classification, or question answering
- When the user needs a general RAG system rather than structured extraction
- When the input is not available as clean text or a retrievable URL yet

## Instructions

### Step 1: Confirm the extraction boundary

Decide whether the input is already usable by LangExtract:

- If the source is clean text, a text file, or a URL that LangExtract can fetch,
  continue here.
- If the source is a PDF, scan, screenshot, or complex document layout, first
  convert it into reliable text with an OCR or document-parsing workflow.
- If the user really wants retrieval or summarization instead of structured
  extraction, route to a better-matched skill.

### Step 2: Define the schema through examples

Write a prompt that says exactly what to extract and how grounded it must stay.
Then create a few `ExampleData` objects that show:

- the extraction classes you want
- exact `extraction_text` spans from the example text
- attributes that add context without paraphrasing the source spans

LangExtract uses those examples as the schema contract. High-quality examples
matter more than adding more instructions.

```python
import langextract as lx
import textwrap

prompt = textwrap.dedent("""\
    Extract medications and dosages in order of appearance.
    Use exact text for extraction_text. Do not paraphrase.""")

examples = [
    lx.data.ExampleData(
        text="Patient takes aspirin 81mg daily.",
        extractions=[
            lx.data.Extraction(
                extraction_class="medication",
                extraction_text="aspirin",
                attributes={"dosage": "81mg", "frequency": "daily"},
            )
        ],
    )
]
```

### Step 3: Run extraction with the right provider shape

Use `lx.extract()` with the source text, prompt, examples, and model choice.

```python
result = lx.extract(
    text_or_documents=input_text,
    prompt_description=prompt,
    examples=examples,
    model_id="gemini-2.5-flash",
)
```

Provider notes:

- Gemini is the simplest default path.
- OpenAI works with `pip install langextract[openai]`; leave `fence_output`
  and `use_schema_constraints` unset so the provider auto-configures them.
- Ollama works with `model_url="http://localhost:11434"` and also prefers the
  auto-configured defaults.
- For custom or OpenAI-compatible providers, use `ModelConfig` and an explicit
  provider selection.

### Step 4: Keep only grounded results when needed

Few-shot examples can sometimes leak into model output. LangExtract marks
extractions that cannot be grounded in the source with `char_interval = None`.
Filter them out when you need a strictly grounded result set.

```python
grounded_extractions = [e for e in result.extractions if e.char_interval]
```

If downstream code uses `start` and `end`, verify the extracted span still
matches the source text before trusting it.

### Step 5: Scale for long documents and review visually

For long inputs, increase recall with multiple passes and parallel workers.
Then save the annotated output and generate the HTML review artifact.

```python
result = lx.extract(
    text_or_documents=document_url,
    prompt_description=prompt,
    examples=examples,
    model_id="gemini-2.5-flash",
    extraction_passes=3,
    max_workers=20,
    max_char_buffer=1000,
)

lx.io.save_annotated_documents([result], output_name="results.jsonl", output_dir=".")
html = lx.visualize("results.jsonl")
```

Use the visualization to catch missed spans, duplicated entities, and schema
mistakes before you trust the output in a production pipeline.

## Examples

### Example 1: Medication extraction from clinical text

Input:

```text
Use langextract to pull medications and dosages from this note.
```

Expected shape:

- `lx.extract()` with a medication-focused prompt
- `ExampleData` that demonstrates the desired schema
- grounded spans or a post-filter for ungrounded extractions

### Example 2: Long legal document from a URL

Input:

```text
How do I extract structured clauses from a 200-page contract with langextract?
```

Expected shape:

- URL passed to `text_or_documents`
- `extraction_passes`, `max_workers`, and `max_char_buffer` tuned for recall
- explanation of chunking, multi-pass behavior, and visualization review

### Example 3: Private local extraction with Ollama

Input:

```text
I need local-only extraction with Ollama and no API key.
```

Expected shape:

- `model_id` set to an Ollama-served model like `gemma2:2b`
- `model_url="http://localhost:11434"`
- no forced `fence_output` or `use_schema_constraints` overrides unless the
  user is debugging provider behavior

### Example 4: Custom provider plugin

Input:

```text
Show me how to add my own provider to langextract.
```

Expected shape:

- provider registration using the router or entry-point system
- base model implementation details
- packaging guidance for a plugin-style provider

## Best practices

1. Write prompts that say "use exact text" when grounded spans matter.
2. Keep `ExampleData` high quality and in source order; examples define the schema.
3. Filter on `char_interval` when strict grounding matters more than recall.
4. Prefer the provider defaults for OpenAI and Ollama unless you are debugging.
5. Use `extraction_passes`, `max_workers`, and `max_char_buffer` together for long inputs.
6. Review HTML visualizations before trusting a new extraction setup in production.
7. Keep raw parsing and OCR out of this skill; feed LangExtract clean text first.

## References

- [GitHub: google/langextract](https://github.com/google/langextract)
- [PyPI: langextract](https://pypi.org/project/langextract/)
- [Google Docs: LangExtract overview](https://developers.google.com/health-ai-developer-foundations/libraries/langextract)
- [References: grounding and provider notes](references/grounding-and-providers.md)
- [References: long-document and visualization guide](references/long-doc-workflows.md)
- License: Apache 2.0
