#!/usr/bin/env python3
"""Reusable prompt repetition transformer for lightweight model lanes."""

from dataclasses import dataclass
import re
from typing import Callable, Dict, List, Optional


MODEL_CONTEXT_WINDOWS: Dict[str, int] = {
    "claude-3-haiku": 200_000,
    "claude-haiku": 200_000,
    "gemini-flash": 1_000_000,
    "gemini-flash-lite": 1_000_000,
    "gemini-2.0-flash": 1_000_000,
    "gpt-4o-mini": 128_000,
    "gpt-low": 128_000,
}

AUTO_APPLY_MODELS: List[str] = list(MODEL_CONTEXT_WINDOWS.keys())

COT_PATTERNS: List[str] = [
    r"step by step",
    r"think through",
    r"let's think",
    r"reasoning:",
    r"chain of thought",
    r"\ub2e8\uacc4\ubcc4\ub85c",
    r"\ucc28\uadfc\ucc28\uadfc",
]

POSITION_PATTERNS: List[str] = [
    r"slot \d+",
    r"position \d+",
    r"index \d+",
    r"\d+\ubc88\uc9f8",
    r"item \d+",
    r"row \d+",
    r"column \d+",
    r"\uc2ac\ub86f \d+",
    r"\uc704\uce58 \d+",
]


@dataclass
class PromptRepetitionConfig:
    default_repetitions: int = 2
    position_repetitions: int = 3
    separator: str = "\n\n"
    max_context_ratio: float = 0.8
    applied_marker: str = "<!-- prompt-repetition-applied -->"


class PromptRepetitionTransformer:
    """Auto-apply repetition only where the workload supports it."""

    def __init__(self, config: Optional[PromptRepetitionConfig] = None):
        self.config = config or PromptRepetitionConfig()

    def should_apply(self, model: str, prompt: str) -> bool:
        if self.config.applied_marker in prompt:
            return False

        model_lower = model.lower()
        if not any(name in model_lower for name in AUTO_APPLY_MODELS):
            return False

        prompt_lower = prompt.lower()
        return not any(re.search(pattern, prompt_lower) for pattern in COT_PATTERNS)

    def determine_repetitions(self, prompt: str) -> int:
        prompt_lower = prompt.lower()
        if any(re.search(pattern, prompt_lower) for pattern in POSITION_PATTERNS):
            return self.config.position_repetitions
        return self.config.default_repetitions

    def estimate_tokens(self, text: str) -> int:
        # Conservative mixed-language estimate.
        return len(text) // 3

    def get_max_context(self, model: str) -> int:
        model_lower = model.lower()
        for name, tokens in MODEL_CONTEXT_WINDOWS.items():
            if name in model_lower:
                return tokens
        return 128_000

    def transform(self, prompt: str, model: str) -> str:
        if not self.should_apply(model, prompt):
            return prompt

        repetitions = self.determine_repetitions(prompt)
        max_allowed = int(self.get_max_context(model) * self.config.max_context_ratio)
        prompt_tokens = self.estimate_tokens(prompt)

        while prompt_tokens * repetitions > max_allowed and repetitions > 1:
            repetitions -= 1

        if repetitions <= 1:
            return prompt

        repeated_prompt = self.config.separator.join([prompt] * repetitions)
        return f"{self.config.applied_marker}\n{repeated_prompt}"

    def wrap_llm_call(self, llm_fn: Callable, model: str) -> Callable:
        def wrapped(prompt: str, **kwargs):
            return llm_fn(self.transform(prompt, model), **kwargs)

        return wrapped


def apply_prompt_repetition(prompt: str, times: int = 2, separator: str = "\n\n") -> str:
    if times <= 1:
        return prompt
    return separator.join([prompt] * times)


def is_lightweight_model(model: str) -> bool:
    model_lower = model.lower()
    return any(name in model_lower for name in AUTO_APPLY_MODELS)


def has_cot_pattern(prompt: str) -> bool:
    prompt_lower = prompt.lower()
    return any(re.search(pattern, prompt_lower) for pattern in COT_PATTERNS)


def has_position_pattern(prompt: str) -> bool:
    prompt_lower = prompt.lower()
    return any(re.search(pattern, prompt_lower) for pattern in POSITION_PATTERNS)
