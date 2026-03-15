---
name: langextract
description: >
  Extract structured, schema-enforced information from unstructured text using LLMs with
  full source grounding (character-level offsets). Use when extracting entities, relationships,
  or structured data from documents, clinical notes, legal texts, research papers, or any
  free-form text. Supports Gemini, OpenAI, Ollama (local), and custom providers.
  Triggers on: information extraction, NER, entity extraction, structured output from text,
  document parsing, text mining, LLM extraction, schema extraction, grounded extraction,
  hallucination-free extraction, provenance, annotation.
allowed-tools: Bash Read Write Edit Glob Grep
metadata:
  tags: langextract, information-extraction, nlp, gemini, openai, ollama, structured-output, grounding, provenance
  platforms: Claude, Gemini, Codex, OpenCode
  version: "1.0"
  source: https://github.com/google/langextract
  license: Apache-2.0
---

# langextract — LLM-Powered Structured Information Extraction

> Extract structured data from unstructured text with **character-level provenance**.
> Every extracted entity traces back to exact character offsets in the source document.

## When to use this skill

- Extracting entities, relationships, or facts from unstructured text
- Processing clinical notes, legal documents, research papers, or reports
- Building NLP pipelines that need citation-level traceability (not just extracted values)
- Long-document extraction (chunking + parallel workers + multi-pass for recall)
- Replacing fragile regex/rule-based extraction with LLM-driven schema enforcement
- Generating interactive HTML visualizations of annotated text

---

## 1. Installation

```bash
# Standard install (Gemini backend — default)
pip install langextract

# With OpenAI support
pip install langextract[openai]

# Development
pip install -e ".[dev]"
```

**API key setup:**
```bash
export LANGEXTRACT_API_KEY="your-gemini-or-openai-key"
# Gemini keys: https://aistudio.google.com/app/apikey
# OpenAI keys:  https://platform.openai.com/api-keys
```

---

## 2. Core concepts

| Concept | Description |
|---------|-------------|
| **Source grounding** | Every extraction carries `(start, end)` char offsets into original text |
| **Controlled generation** | Gemini uses schema-constrained decoding; no hallucinated field names |
| **Few-shot examples** | Schema is inferred from `ExampleData` objects — zero fine-tuning needed |
| **Multi-pass extraction** | `extraction_passes=N` runs N independent passes; results are merged |
| **Parallel chunking** | `max_workers=N` processes text chunks concurrently |

---

## 3. Basic extraction

```python
import langextract as lx
import textwrap

prompt = textwrap.dedent("""\
    Extract characters, emotions, and relationships in order of appearance.
    Use exact text for extractions. Do not paraphrase or overlap entities.
    Provide meaningful attributes for each entity to add context.""")

examples = [
    lx.data.ExampleData(
        text="ROMEO. But soft! What light through yonder window breaks?",
        extractions=[
            lx.data.Extraction(
                extraction_class="character",
                extraction_text="ROMEO",
                attributes={"emotional_state": "wonder"}
            ),
        ]
    )
]

result = lx.extract(
    text_or_documents="Lady Juliet gazed longingly at the stars...",
    prompt_description=prompt,
    examples=examples,
    model_id="gemini-2.5-flash",
)

# Access results
for extraction in result.extractions:
    print(f"[{extraction.extraction_class}] '{extraction.extraction_text}' "
          f"@ chars {extraction.start}–{extraction.end}")
```

---

## 4. Long-document extraction (URL input, multi-pass, parallel)

```python
result = lx.extract(
    text_or_documents="https://www.gutenberg.org/files/1513/1513-0.txt",
    prompt_description=prompt,
    examples=examples,
    model_id="gemini-2.5-flash",
    extraction_passes=3,   # 3 independent runs, results merged
    max_workers=20,        # parallel chunk processing
    max_char_buffer=1000   # smaller focused context windows
)
# Romeo & Juliet (147k chars / ~44k tokens) → 4,088 entities extracted
```

---

## 5. OpenAI backend

```python
import os, langextract as lx

result = lx.extract(
    text_or_documents=input_text,
    prompt_description=prompt,
    examples=examples,
    model_id="gpt-4o",
    api_key=os.environ.get("OPENAI_API_KEY"),
    fence_output=True,
    use_schema_constraints=False
)
```

---

## 6. Local LLMs via Ollama

```python
result = lx.extract(
    text_or_documents=input_text,
    prompt_description=prompt,
    examples=examples,
    model_id="gemma2:2b",
    model_url="http://localhost:11434",
    fence_output=False,
    use_schema_constraints=False
)
```

---

## 7. Visualize results

```python
lx.io.save_annotated_documents([result], output_name="results.jsonl", output_dir=".")
html_content = lx.visualize("results.jsonl")
with open("visualization.html", "w") as f:
    f.write(html_content.data if hasattr(html_content, "data") else html_content)
# Open visualization.html in browser → color-coded annotations over source text
```

---

## 8. Key parameters reference

| Parameter | Type | Description |
|-----------|------|-------------|
| `text_or_documents` | `str` / URL | Raw text, URL to fetch, or list of documents |
| `prompt_description` | `str` | Natural language extraction instructions |
| `examples` | `list[ExampleData]` | Few-shot examples that define the schema |
| `model_id` | `str` | `gemini-2.5-flash`, `gpt-4o`, `gemma2:2b`, … |
| `api_key` | `str` | API key (overrides `LANGEXTRACT_API_KEY` env var) |
| `model_url` | `str` | Base URL for Ollama or custom endpoints |
| `extraction_passes` | `int` | Independent extraction runs (default: 1) |
| `max_workers` | `int` | Parallel chunk workers (default: 1) |
| `max_char_buffer` | `int` | Characters per chunk |
| `fence_output` | `bool` | Use JSON fencing instead of constrained decoding |
| `use_schema_constraints` | `bool` | Controlled generation — Gemini default: `True` |

---

## 9. Custom provider plugin

```python
import langextract as lx

@lx.providers.registry.register(r'^mymodel', r'^custom')
class MyProviderLanguageModel(lx.inference.BaseLanguageModel):
    def __init__(self, model_id: str, api_key: str = None, **kwargs):
        self.client = MyProviderClient(api_key=api_key)

    def infer(self, batch_prompts, **kwargs):
        for prompt in batch_prompts:
            result = self.client.generate(prompt, **kwargs)
            yield [lx.inference.ScoredOutput(score=1.0, output=result)]
```

Package as a PyPI plugin with entry point:
```toml
[project.entry-points."langextract.providers"]
myprovider = "langextract_myprovider:MyProviderLanguageModel"
```

Disable all plugins: `LANGEXTRACT_DISABLE_PLUGINS=1`

---

## 10. Use cases

| Domain | Example |
|--------|---------|
| **Medical/clinical** | Medication names, dosages, routes from clinical notes |
| **Legal** | Clause extraction, party identification from contracts |
| **Literary analysis** | Character, emotion, relationship graphs |
| **Finance** | Structured data extraction from earnings reports |
| **Radiology** | Free-text radiology reports → structured format |
| **Research** | Entity/relation extraction from academic papers |

---

## Best practices

1. **Write precise prompts** — specify "use exact text, do not paraphrase" to keep offsets accurate
2. **Use few-shot examples** — 2–3 examples covering edge cases dramatically improves accuracy
3. **Tune `max_char_buffer`** — smaller values (500–1000) give more focused context; larger values reduce API calls
4. **Use `extraction_passes=3`** for long docs — independent runs catch entities missed in single pass
5. **Set `max_workers`** — parallelization dramatically speeds up long-document processing
6. **Verify offsets** — `result.text[extraction.start:extraction.end]` must equal `extraction_text`
7. **Use visualization** — HTML output makes it easy to spot extraction errors and coverage gaps

---

## References

- [GitHub: google/langextract](https://github.com/google/langextract)
- [PyPI: langextract](https://pypi.org/project/langextract/)
- [Google Developers Blog announcement](https://developers.googleblog.com/introducing-langextract-a-gemini-powered-information-extraction-library/)
- [Provider Plugin README](https://github.com/google/langextract/blob/main/langextract/providers/README.md)
- [Long-document Example](https://github.com/google/langextract/blob/main/docs/examples/longer_text_example.md)
- License: Apache 2.0
