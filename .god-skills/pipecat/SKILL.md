---
name: pipecat
description: >
  Agent engineering skill for Pipecat
license: BSD-2-Clause
compatibility: Requires Python >=3.10.
metadata:
  version: "1.0"
  source: pipecat-ai/pipecat
  tags: pipecat, voice-agent, python, ai-agent
allowed-tools: Bash Read Write Edit Glob Grep
---

# pipecat

Pipecat is a leading voice agent in the 2026 AI agent engineering landscape (13.1k★).

## When to use this skill

- Frame/processor/pipeline architecture for realtime voice + multimodal agents
- 40+ service plugins: STT/TTS/LLM providers, transports (Daily WebRTC, WebSocket, telephony)
- Pipecat Flows for structured conversation state machines
- Client SDKs: JS, React, iOS, Android + voice UI kit
- Vendor-neutral: swap any provider per pipeline stage
- Used by NVIDIA ACE and Daily production stacks
- Ecosystem overlap: Pairs with livekit-agents as the two OSS voice lanes

## Installation

```bash
uv add pipecat-ai   # extras: "pipecat-ai[option,...]"; pip also works
```

## Core API

```python
pipeline = Pipeline([
    transport.input(),
    stt,            # e.g. Deepgram
    context_aggregator.user(),
    llm,            # e.g. OpenAI
    tts,            # e.g. Cartesia
    transport.output(),
    context_aggregator.assistant(),
])
task = PipelineTask(pipeline)
await PipelineRunner().run(task)
```

## Instructions

### Step 1: Initialize the environment
Verify you have Python installed and set up properly. Use the correct package manager (pip, npm, pnpm, uv) as specified in the installation section.

### Step 2: Establish the agent flow
Architecture pattern: Dataflow pipeline: frames (audio/text/LLM messages) stream through processors; ultra-low-latency scheduling; transports abstract the realtime channel

### Step 3: Implement tool integrations and policies
Integrate necessary tools, environment keys, and safety gates according to your architectural needs. Position in the ecosystem: Composable pipeline lane of voice agents vs LiveKit's infrastructure lane; strongest provider neutrality

## Examples

### Example 1: Minimal Agent Run
```python
pipeline = Pipeline([
    transport.input(),
    stt,            # e.g. Deepgram
    context_aggregator.user(),
    llm,            # e.g. OpenAI
    tts,            # e.g. Cartesia
    transport.output(),
    context_aggregator.assistant(),
])
task = PipelineTask(pipeline)
await PipelineRunner().run(task)
```

## Best practices

1. Follow the primary installation commands for Pipecat to ensure dependencies are resolved correctly.
2. Configure model providers and API keys securely before starting the runtime.
3. Use appropriate sandboxing or permission isolation if executing AI-generated code.

## References

- [https://github.com/pipecat-ai/pipecat](https://github.com/pipecat-ai/pipecat)
- [https://docs.pipecat.ai](https://docs.pipecat.ai)
