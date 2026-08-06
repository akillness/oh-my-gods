#!/usr/bin/env python3
"""Validate all .god-skills/**/evals/evals.json files are valid JSON."""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def main() -> int:
    files = sorted(ROOT.glob('.god-skills/**/evals/evals.json'))
    if not files:
        print('No evals.json files found. Skipping.')
        return 0

    failures = []
    for path in files:
        try:
            json.loads(path.read_text(encoding='utf-8'))
        except Exception as exc:  # noqa: BLE001
            failures.append((path, exc))

    print(f'Checked {len(files)} evals.json files')
    if failures:
        print('Invalid JSON detected:')
        for path, exc in failures:
            print(f' - {path.relative_to(ROOT)} :: {exc}')
        return 1

    print('All evals.json files are valid JSON.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
