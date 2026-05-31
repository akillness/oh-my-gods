# AI Research Skills — Reference

> Source: [Orchestra-Research/AI-Research-SKILLs](https://github.com/Orchestra-Research/AI-Research-SKILLs)
> Fork: [akillness/AI-Research-SKILLs](https://github.com/akillness/AI-Research-SKILLs)
> License: MIT

## Repository Structure

```
AI-Research-SKILLs/
├── 0-autoresearch-skill/        # Central orchestration layer
├── 01-model-architecture/       # LitGPT, Mamba, RWKV, NanoGPT, TorchTitan
├── 02-tokenization/             # HuggingFace Tokenizers, SentencePiece
├── 03-fine-tuning/              # Axolotl, LLaMA-Factory, PEFT, Unsloth
├── 04-mechanistic-interpretability/ # TransformerLens, SAELens, pyvene, nnsight
├── 05-data-processing/          # NeMo Curator, Ray Data
├── 06-post-training/            # TRL, GRPO, OpenRLHF, SimPO, verl, slime, miles, torchforge
├── 07-safety-alignment/         # Constitutional AI, LlamaGuard, NeMo Guardrails, Prompt Guard
├── 08-distributed-training/     # Megatron-Core, DeepSpeed, FSDP, Accelerate, Lightning, Ray Train
├── 09-infrastructure/           # Modal, Lambda Labs, SkyPilot
├── 10-optimization/             # Flash Attention, bitsandbytes, GPTQ, AWQ, HQQ, GGUF
├── 11-evaluation/               # lm-eval-harness, BigCode, NeMo Evaluator
├── 12-inference-serving/        # vLLM, TensorRT-LLM, llama.cpp, SGLang
├── 13-mlops/                    # W&B, MLflow, TensorBoard
├── 14-agents/                   # LangChain, LlamaIndex, CrewAI, AutoGPT
├── 15-rag/                      # Chroma, FAISS, Pinecone, Qdrant, Sentence Transformers
├── 16-prompt-engineering/       # DSPy, Instructor, Guidance, Outlines
├── 17-observability/            # LangSmith, Phoenix
├── 18-multimodal/               # CLIP, Whisper, LLaVA, BLIP-2, SAM, Stable Diffusion, AudioCraft
├── 19-emerging-techniques/      # MoE, Model Merging, Long Context, Speculative Decoding, Distillation, Pruning
├── 20-ml-paper-writing/         # LaTeX templates for NeurIPS, ICML, ICLR, ACL, AAAI, COLM
├── 21-research-ideation/        # Research Brainstorming, Creative Thinking
├── CLAUDE.md                    # Claude Code configuration
├── CONTRIBUTING.md              # Contribution guide
├── WELCOME.md                   # Agent bootstrap instructions
└── package.json                 # npm package config
```

## Skill Quality Standards

Each skill provides:
- **200–600 line SKILL.md** with expert guidance
- **references/** directory with:
  - Official documentation
  - API reference
  - Step-by-step tutorials
  - Real GitHub issues with solutions
  - Version history / release notes
- **Production-ready code examples**
- **Troubleshooting guides**

## Autoresearch: Two-Loop Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Outer Loop (Synthesis)                    │
│  Research Question → Literature Survey → Hypothesis Design  │
│         ↓ Route to domain skills ↓                          │
│  ┌───────────────────────────────────────────────────────┐  │
│  │              Inner Loop (Optimization)                │  │
│  │  Run Experiment → Collect Results → Analyze → Adjust  │  │
│  │  ↑ Git ratchet: only commit improvements ↑           │  │
│  └───────────────────────────────────────────────────────┘  │
│         ↓ Synthesize findings ↓                             │
│  Paper Writing → LaTeX → Submission-Ready PDF               │
└─────────────────────────────────────────────────────────────┘
```

## Key Commands

```bash
# Install all 86 skills
npx @orchestra-research/ai-research-skills install --all

# List installed skills
npx @orchestra-research/ai-research-skills list

# Update skills
npx @orchestra-research/ai-research-skills update

# Interactive installer
npx @orchestra-research/ai-research-skills
```

## Demos (Published Research)

| Paper | Skills Used | Key Finding |
|-------|-------------|-------------|
| Norm Heterogeneity → LoRA Brittleness | Autoresearch, PEFT, SAELens | Norm heterogeneity predicts fine-tuning difficulty (r=-0.99) |
| RL Algorithm Brain Scan | Autoresearch, GRPO, TRL, TransformerLens | DPO is a rank-1 perturbation (95.6% recovery from one SVD direction) |

## External Links

- [GitHub (upstream)](https://github.com/Orchestra-Research/AI-Research-SKILLs)
- [GitHub (fork)](https://github.com/akillness/AI-Research-SKILLs)
- [npm package](https://www.npmjs.com/package/@orchestra-research/ai-research-skills)
- [Orchestra Research](http://orchestra-research.com)
- [Blog post](https://www.orchestra-research.com/perspectives/ai-research-skills)
- [Slack community](https://join.slack.com/t/orchestrarese-efu1990/shared_invite/zt-3iu6gr8io-zJvpkZTPToEviQ9KFZvNSg)
