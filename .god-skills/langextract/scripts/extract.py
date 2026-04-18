#!/usr/bin/env python3
"""
langextract helper script — quick extraction from CLI.

Usage:
    python extract.py --text "Patient took 10mg aspirin daily" \
                      --prompt "Extract medications and dosages" \
                      --model gemini-2.5-flash \
                      --output results.jsonl

    python extract.py --url https://example.com/document.txt \
                      --prompt "Extract named entities" \
                      --passes 3 --workers 10 \
                      --output results.jsonl --visualize

Environment:
    LANGEXTRACT_API_KEY  — Gemini/OpenAI API key
    OPENAI_API_KEY       — OpenAI API key (alternative)
"""

import argparse
import json
import os
import sys
import textwrap


def main():
    parser = argparse.ArgumentParser(
        description="Extract structured information from text using langextract"
    )
    input_group = parser.add_mutually_exclusive_group(required=True)
    input_group.add_argument("--text", help="Input text to extract from")
    input_group.add_argument("--url", help="URL of document to fetch and extract from")
    input_group.add_argument("--file", help="Path to text file to extract from")

    parser.add_argument("--prompt", required=True, help="Extraction prompt description")
    parser.add_argument("--model", default="gemini-2.5-flash", help="Model ID (default: gemini-2.5-flash)")
    parser.add_argument("--model-url", help="Base URL for Ollama or custom endpoints")
    parser.add_argument("--api-key", help="API key (overrides env var)")
    parser.add_argument("--examples-file", help="Path to JSON file containing ExampleData-like objects")
    parser.add_argument("--passes", type=int, default=1, help="Extraction passes (default: 1)")
    parser.add_argument("--workers", type=int, default=1, help="Parallel workers (default: 1)")
    parser.add_argument("--char-buffer", type=int, default=None, help="Max chars per chunk")
    parser.add_argument("--output", default="results.jsonl", help="Output JSONL file (default: results.jsonl)")
    parser.add_argument("--visualize", action="store_true", help="Generate HTML visualization")
    parser.add_argument("--grounded-only", action="store_true", help="Drop extractions that cannot be grounded back to the source text")
    parser.add_argument("--fence", action="store_true", help="Use JSON fencing (for OpenAI/Ollama)")
    parser.add_argument("--no-schema-constraints", action="store_true", help="Disable schema constraints")
    args = parser.parse_args()

    try:
        import langextract as lx
    except ImportError:
        print("Error: langextract not installed. Run: pip install langextract", file=sys.stderr)
        sys.exit(1)

    # Determine input
    if args.text:
        input_data = args.text
    elif args.url:
        input_data = args.url
    else:
        with open(args.file, "r") as f:
            input_data = f.read()

    api_key = args.api_key or os.environ.get("LANGEXTRACT_API_KEY") or os.environ.get("OPENAI_API_KEY")
    examples = []
    if args.examples_file:
        with open(args.examples_file, "r") as f:
            payload = json.load(f)
        for item in payload:
            extractions = [
                lx.data.Extraction(
                    extraction_class=ext["extraction_class"],
                    extraction_text=ext["extraction_text"],
                    attributes=ext.get("attributes"),
                )
                for ext in item.get("extractions", [])
            ]
            examples.append(
                lx.data.ExampleData(
                    text=item["text"],
                    extractions=extractions,
                )
            )

    extract_kwargs = dict(
        text_or_documents=input_data,
        prompt_description=args.prompt,
        examples=examples,
        model_id=args.model,
        extraction_passes=args.passes,
        max_workers=args.workers,
    )
    if api_key:
        extract_kwargs["api_key"] = api_key
    if args.model_url:
        extract_kwargs["model_url"] = args.model_url
    if args.char_buffer:
        extract_kwargs["max_char_buffer"] = args.char_buffer
    if args.fence:
        extract_kwargs["fence_output"] = True
    if args.no_schema_constraints:
        extract_kwargs["use_schema_constraints"] = False

    print(f"Extracting with model={args.model}, passes={args.passes}, workers={args.workers}...")
    result = lx.extract(**extract_kwargs)

    extractions = result.extractions
    if args.grounded_only:
        extractions = [ext for ext in extractions if getattr(ext, "char_interval", None)]

    print(f"\nExtracted {len(extractions)} entities:\n")
    for ext in extractions:
        attrs = f" {ext.attributes}" if ext.attributes else ""
        print(f"  [{ext.extraction_class}] '{ext.extraction_text}' (chars {ext.start}–{ext.end}){attrs}")

    # Save
    output_dir = os.path.dirname(os.path.abspath(args.output)) or "."
    output_name = os.path.basename(args.output)
    if args.grounded_only and extractions is not result.extractions:
        result.extractions = extractions
    lx.io.save_annotated_documents([result], output_name=output_name, output_dir=output_dir)
    print(f"\nSaved to: {args.output}")

    if args.visualize:
        html = lx.visualize(args.output)
        html_path = args.output.replace(".jsonl", ".html")
        with open(html_path, "w") as f:
            f.write(html.data if hasattr(html, "data") else html)
        print(f"Visualization: {html_path}")


if __name__ == "__main__":
    main()
