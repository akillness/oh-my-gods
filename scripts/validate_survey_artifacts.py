#!/usr/bin/env python3
"""Validate changed .survey artifacts for required headings + provenance labels."""

from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

ALLOWED_PROVENANCE = {
    'direct page retrieval',
    'indexed snippet',
    'browser-rendered retrieval',
    'browser-rendered indexed snippet',
    'feed recovery',
    'thin evidence',
}

REQUIRED_HEADINGS_BY_NAME = {
    'triage.md': ['# Triage', '- Problem:', '- Audience:', '- Why now:'],
    'context.md': [
        '## Workflow Context',
        '## Affected Users',
        '## Current Workarounds',
        '## Adjacent Problems',
        '## User Voices',
    ],
    'solutions.md': [
        '## Solution List',
        '## Categories',
        '## What People Actually Use',
        '## Frequency Ranking',
        '## Key Gaps',
        '## Contradictions',
        '## Key Insight',
    ],
    'platform-map.md': [
        '## Settings',
        '## Rules',
        '## Hooks',
        '## Platform Gaps',
    ],
}


def git_changed_files() -> list[Path]:
    base_ref = os.environ.get('GITHUB_BASE_REF')
    if base_ref:
        merge_base = subprocess.check_output(
            ['git', 'merge-base', f'origin/{base_ref}', 'HEAD'],
            cwd=ROOT,
            text=True,
        ).strip()
        diff_args = ['diff', '--name-only', merge_base, 'HEAD']
    else:
        # Local/dev fallback: include staged + unstaged changes without requiring HEAD~1.
        diff_args = ['status', '--porcelain']

    output = subprocess.check_output(['git', *diff_args], cwd=ROOT, text=True)

    if diff_args[0] == 'status':
        changed = [Path(line[3:].strip()) for line in output.splitlines() if len(line) >= 4]
    else:
        changed = [Path(line.strip()) for line in output.splitlines() if line.strip()]

    return changed


def contains_provenance(text: str) -> bool:
    lower = text.lower()
    return any(label in lower for label in ALLOWED_PROVENANCE)


def validate_file(path: Path) -> list[str]:
    rel = path.relative_to(ROOT)
    errors: list[str] = []

    if path.name not in REQUIRED_HEADINGS_BY_NAME:
        return errors

    text = path.read_text(encoding='utf-8')
    required = REQUIRED_HEADINGS_BY_NAME[path.name]
    for marker in required:
        if marker not in text:
            errors.append(f'{rel}: missing required marker: {marker}')

    if not contains_provenance(text):
        errors.append(
            f'{rel}: missing provenance label (allowed: {sorted(ALLOWED_PROVENANCE)})'
        )

    return errors


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('--changed-only', action='store_true')
    args = parser.parse_args()

    if args.changed_only:
        candidates = [
            ROOT / p
            for p in git_changed_files()
            if str(p).startswith('.survey/') and p.name in REQUIRED_HEADINGS_BY_NAME
        ]
    else:
        candidates = sorted(
            p
            for p in ROOT.glob('.survey/**/*.md')
            if p.name in REQUIRED_HEADINGS_BY_NAME
        )

    if not candidates:
        print('No survey contract files changed; skipping.')
        return 0

    errors: list[str] = []
    for path in candidates:
        if path.exists():
            errors.extend(validate_file(path))

    print(f'Validated {len(candidates)} survey artifact files')
    if errors:
        print('Survey contract validation failed:')
        for err in errors:
            print(f' - {err}')
        return 1

    print('Survey artifact contract passed.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
