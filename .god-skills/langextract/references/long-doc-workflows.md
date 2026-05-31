# LangExtract long-document and visualization guide

## Long-document defaults

For large inputs, LangExtract gets most of its leverage from combining:

- `extraction_passes=3` for better recall across repeated runs
- `max_workers` for parallel chunk processing
- `max_char_buffer=500-1000` for tighter context windows

This is especially useful for long contracts, books, research papers, and
large report collections.

## Why chunking helps

LangExtract does not rely on one giant context window. It chunks text into
smaller windows, processes those windows in parallel, then merges results.
That reduces distant-context interference and usually improves extraction
quality for large documents.

## Visualization loop

Save the annotated output before reviewing:

```python
lx.io.save_annotated_documents([result], output_name="results.jsonl", output_dir=".")
html = lx.visualize("results.jsonl")
```

The HTML visualization is the fastest way to catch:

- duplicated entities
- missed spans
- paraphrased `extraction_text`
- attributes that drift away from the source text

## Input-prep boundary

LangExtract is strongest after the input is already available as clean text.
If the source is a PDF, scan, image, or messy HTML, do the text recovery step
first, then hand the normalized text to LangExtract.

## Useful upstream examples

- Full-text Romeo and Juliet extraction for long-document tuning
- medication examples for clinically grounded extraction
- RadExtract for domain-specific structuring patterns
