# oh-my-gods

<div align="center">

[![Skills](https://img.shields.io/badge/Skills-42-blue?style=for-the-badge)](https://github.com/akillness/oh-my-gods)
[![Platform](https://img.shields.io/badge/Platform-Claude%20%7C%20Gemini%20%7C%20Codex%20%7C%20OpenCode-orange?style=for-the-badge)](https://github.com/akillness/oh-my-gods)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-orange?logo=buy-me-a-coffee)](https://www.buymeacoffee.com/akillness3q)

</div>

<div align="center">

**LLM 에이전트를 만들고, 평가하고, 운영하기 위한 에이전트 엔지니어링 스킬셋**

*42개 집중 스킬 · [jeo-skills](https://github.com/akillness/jeo-skills)와 중복 없음 · 크로스 플랫폼*

<img src="assets/project-features.svg" alt="oh-my-gods 프로젝트 특징 맵" width="840">

[빠른 시작](#-빠른-시작) · [스킬 카탈로그](#-스킬-카탈로그) · [설치](#-설치) · [English](README.md)

</div>

---

## 🎯 oh-my-gods 란?

`oh-my-gods`는 **에이전트 자체를 만들 때** 필요한 레이어에 집중한 가벼운 스킬셋입니다 — 아키텍처, 메모리, 툴 라우팅, 가드레일, 평가, 관측성, 멀티 에이전트 프로토콜.

[`jeo-skills`](https://github.com/akillness/jeo-skills)와 **중복되지 않도록** 의도적으로 범위를 좁혔습니다. 일반 개발 워크플로우, 오케스트레이션(`omg`/`omc`/`omx`/`ohmg`), 기획, 프론트/백엔드, 콘텐츠 스킬은 모두 그쪽에 있습니다. oh-my-gods는 그 컬렉션을 보완하는 **에이전트 중심 42개 스킬**만 유지합니다.

| 하려는 일 | 사용 |
|-----------|------|
| 에이전트 메모리·툴·가드레일·평가 설계 | **oh-my-gods** (이 저장소) |
| 개발 작업 오케스트레이션·기획·배포·문서 | [jeo-skills](https://github.com/akillness/jeo-skills) |

---

## 🚀 빠른 시작

> **사전 조건**: `skills` CLI

```bash
npm install -g skills
```

```bash
# 한 줄 설치
curl -fsSL https://raw.githubusercontent.com/akillness/oh-my-gods/main/install.sh | bash
```

```bash
# 또는 LLM 위임 설치 가이드 전달
curl -s https://raw.githubusercontent.com/akillness/oh-my-gods/main/setup-all-skills-prompt.md
```

```bash
# 또는 전체 직접 설치
npx skills add -g https://github.com/akillness/oh-my-gods --skill '*' --yes
```

---

## 📚 스킬 카탈로그

### 코어 에이전트 & 프레임워크 (20)

| 스킬 | 설명 |
|------|------|
| `agent-configuration` | AGENTS.md, 훅, 권한, 스킬/플러그인/MCP 설정 |
| `agent-evaluation` | 평가 시스템: 그레이더, CI 게이트, 프로덕션 모니터링 |
| `agent-manager` | tmux + Python 라이프사이클 — 시작/중지/모니터/스케줄/하트비트 |
| `agent-principles` | 핵심 AI 에이전트 협업: 컨텍스트, 계획/실행, 검증 |
| `agent-workflow` | 일상 코딩 에이전트 루프: 세션 복구, 워크트리, 핸드오프 |
| `agents-cli` | Google Cloud 에이전트 라이프사이클 — 스캐폴드, 평가, 배포 |
| `deepagents` | LangGraph 올인원 하니스 — 파일 툴, 서브에이전트, HITL |
| `langchain-bmad` | BMAD 단계 게이트 ↔ LangChain / LangGraph / Deep Agents 라우팅 |
| `langgraph-workflow` | StateGraph, 체크포인트, 조건 분기, 병렬 노드 |
| `ralph` | 우로보로스 스펙 우선 루프 — 인터뷰 → 시드 → 실행 → 평가 → 진화 |
| `ralphmode` | 장기 실행 에이전트 루프용 샌드박스 + 승인 프로파일 |
| `crewai` | 역할 기반 멀티 에이전트 프레임워크 — 크루, 플로우, 태스크, 툴 |
| `agno` | 고성능 멀티 에이전트 프레임워크 (구 phidata) — AgentOS 런타임 |
| `smolagents` | HuggingFace 최소형 코드 우선 에이전트 — CodeAgent가 Python 코드로 액션 작성 |
| `mastra` | TypeScript 에이전트 프레임워크 — 에이전트, 워크플로우, RAG, 평가, 관측성 |
| `letta` | 자체 편집 메모리를 지닌 상태 저장 에이전트 (MemGPT 계보) — 메모리 블록 |
| `claude-agent-sdk` | Claude Code 하니스 상에서 에이전트를 구축하는 Anthropic 공식 SDK |
| `google-adk` | Google Agent Development Kit — 코드 우선 멀티 에이전트 |
| `openclaw` | 개인용 AI 비서/에이전트 런타임 — 게이트웨이, 채널, 스킬, 노드 모드 |
| `pi-agent` | 최소형 코딩 에이전트 + TypeScript 툴킷 모노레포 |

### 에이전트 아키텍처 & 운영 (10)

| 스킬 | 설명 |
|------|------|
| `agent-observability` | LangSmith/Langfuse/Phoenix 선택, 노드 단위 트레이스, 리플레이, 트레이스 내 평가 |
| `agent-memory-architecture` | mem0/Letta/Zep 선택, core/recall/archival 계층, 시계열 vs 스냅샷 |
| `mcp-server-design` | MCP 서버 — Server Card, 무상태 전송, 레지스트리 준수 |
| `agent-guardrails` | NeMo Colang + Lakera/LLM Guard — 프롬프트 인젝션, 유출, 툴 오용 |
| `agent-system-design` | 에이전트 SLA 규율: MAX_LOOPS, 비용 예산, 서킷 브레이커, 주권 |
| `agent-tool-routing` | 툴 레지스트리, 역량 탐색, 스키마, 라우터 정책, 폴백 |
| `multi-agent-eval-harness` | 역할 단위 메트릭, 협업 실패 테스트, 트랜스크립트 채점 |
| `a2a-protocol` | Agent-to-Agent 수평 메시징 (Linux Foundation AAIF 2026 standard) |
| `reflexion-pattern` | 비평 노드 + 실패 언어 기억, 안정적 루브릭 채점, 재시도 예산 |
| `agent-benchmarking` | SWE-bench/WebArena/OSWorld + 커스텀 회귀 팩으로 역량 매핑 |

### 샌드박스, 브라우저, 음성, 메모리 & 프로토콜 (11)

| 스킬 | 설명 |
|------|------|
| `browser-use` | AI 에이전트가 웹사이트에 액세스하도록 지원 — 자율 브라우징, DOM extraction |
| `stagehand` | 코드와 자연어가 혼합된 프로덕션 브라우저 자동화 SDK |
| `mem0` | AI 에이전트용 범용 메모리 레이어 — 메모리 추가/검색, 그래프 메모리 |
| `graphiti` | 에이전트 메모리용 실시간 시계열 지식 그래프 |
| `e2b` | AI 코드 실행용 오픈소스 클라우드 샌드박스 — Firecracker microVM |
| `daytona` | AI 생성 코드 실행을 위한 안전하고 탄력적인 인프라 — 90ms 미만 샌드박스 |
| `livekit-agents` | LiveKit WebRTC 상의 실시간 음성 AI 에이전트 — STT/LLM/TTS pipelines |
| `pipecat` | 실시간 음성 및 멀티모달 대화형 에이전트를 위한 오픈소스 프레임워크 |
| `ag-ui` | Agent-User Interaction 프로토콜 — 이벤트 기반 에이전트↔프론트엔드 스트리밍 |
| `goose` | 확장 가능한 로컬 AI 에이전트 (Rust), MCP 네이티브 확장, CLI + 데스크톱 |
| `openhands` | 소프트웨어 개발 에이전트 플랫폼 — CLI, GUI, GitHub 액션, 샌드박스 런타임 |

### 호환성 별칭 (1)

| 스킬 | 설명 |
|------|------|
| `agent-development-principles` | `agent-principles`의 호환 별칭 (그쪽으로 라우팅) |
---

## 🤝 협업 에이전트 생태계 (jeo-skills와의 연계)

<div align="center">
  <img src="assets/agent-companions.png" alt="jeo-code 마스코트에서 영감을 받은 네온 해양생물 AI 동료들" width="760">
</div>

개발자 워크스페이스는 여러 자율 AI 에이전트가 조화롭게 협업하는 팀을 전제로 합니다. 동료 이미지는 [`jeo-code`](https://github.com/akillness/jeo-code)의 네온 마스코트 페르소나를 참고해, 가재·꽃게·새우·조개·소라·소라게 전문가 캐릭터로 재해석했습니다.

이 저장소(`oh-my-gods`)와 [`jeo-skills`](https://github.com/akillness/jeo-skills)는 가장 강력한 에이전트 개발 듀오를 이룹니다:

| 계층 | 역할 범위 | 관련 프로젝트 |
|---|---|---|
| **에이전트 엔지니어링** | 샌드박싱, memory 레이어, 툴 라우팅, 가드레일, 평가, 프로토콜 | **oh-my-gods** (본 저장소) |
| **워크플로우 및 태스크 운영** | 태스크 기획, Git 워크플로우, 문서화, 멀티 에이전트 오케스트레이션 (`omg`/`omc`/`omx`/`ohmg`) | [jeo-skills](https://github.com/akillness/jeo-skills) |

두 프로젝트를 연계함으로써, 개발을 자율적으로 수행하고 배포할 수 있는 에이전트 연합(Syndicate)의 완벽하고 강력한 기반을 제공합니다.

---
## 📦 설치

```bash
# 사전 조건
npm install -g skills

# 권장 — 한 줄
curl -fsSL https://raw.githubusercontent.com/akillness/oh-my-gods/main/install.sh | bash

npx skills add -g https://github.com/akillness/oh-my-gods --skill '*' --yes
```

**환경**: `node >= 18`, `git`, `bash`. 스킬은 `~/.agent-skills`에 복사된 뒤 `~/.claude/skills`, `~/.codex/skills`, `~/.gemini/skills`, `~/.opencode/skills`로 배포됩니다.

전체 LLM 위임 설치/검증 절차는 [`setup-all-skills-prompt.md`](setup-all-skills-prompt.md)를 참고하세요.

---

## 📎 참조 & 출처

| 스킬 | 출처 | 라이선스 |
| `ralph` | [Q00/ouroboros](https://github.com/Q00/ouroboros) | MIT |
| `deepagents` | [langchain-ai/deepagents](https://github.com/langchain-ai/deepagents) | MIT |
| `agent-manager` | [fractalmind-ai/agent-manager-skill](https://github.com/fractalmind-ai/agent-manager-skill) | MIT |
| `agent-development-principles` | [ykdojo/claude-code-tips](https://github.com/ykdojo/claude-code-tips) | MIT |
| `a2a-protocol` | Linux Foundation AAIF | — |
| `openclaw` | [openclaw/openclaw](https://github.com/openclaw/openclaw) | MIT |
| `pi-agent` | [earendil-works/pi](https://github.com/earendil-works/pi) | MIT |
| `goose` | [aaif-goose/goose](https://github.com/aaif-goose/goose) | Apache-2.0 |
| `openhands` | [OpenHands/OpenHands](https://github.com/OpenHands/OpenHands) | MIT |
| `claude-agent-sdk` | [anthropics/claude-agent-sdk-python](https://github.com/anthropics/claude-agent-sdk-python) | MIT |
| `google-adk` | [google/adk-python](https://github.com/google/adk-python) | Apache-2.0 |
| `crewai` | [crewAIInc/crewAI](https://github.com/crewAIInc/crewAI) | MIT |
| `agno` | [agno-agi/agno](https://github.com/agno-agi/agno) | Apache-2.0 |
| `smolagents` | [huggingface/smolagents](https://github.com/huggingface/smolagents) | Apache-2.0 |
| `mastra` | [mastra-ai/mastra](https://github.com/mastra-ai/mastra) | Elastic-2.0 |
| `letta` | [letta-ai/letta](https://github.com/letta-ai/letta) | Apache-2.0 |
| `browser-use` | [browser-use/browser-use](https://github.com/browser-use/browser-use) | MIT |
| `stagehand` | [browserbase/stagehand](https://github.com/browserbase/stagehand) | MIT |
| `mem0` | [mem0ai/mem0](https://github.com/mem0ai/mem0) | Apache-2.0 |
| `graphiti` | [getzep/graphiti](https://github.com/getzep/graphiti) | Apache-2.0 |
| `e2b` | [e2b-dev/E2B](https://github.com/e2b-dev/E2B) | Apache-2.0 |
| `daytona` | [daytonaio/daytona](https://github.com/daytonaio/daytona) | AGPL-3.0 / Apache-2.0 |
| `livekit-agents` | [livekit/agents](https://github.com/livekit/agents) | Apache-2.0 |
| `pipecat` | [pipecat-ai/pipecat](https://github.com/pipecat-ai/pipecat) | BSD-2-Clause |
| `ag-ui` | [ag-ui-protocol/ag-ui](https://github.com/ag-ui-protocol/ag-ui) | MIT |
| Agent Skills Spec | [agentskills.io](https://agentskills.io/specification) | — |

---

<div align="center">

oh-my-gods가 도움이 되었다면 후원을 고려해 주세요!

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/akillness3q)

<img src="qr-code.png" alt="Buy Me A Coffee QR Code" width="180">

Made with ❤️ by [JEO-tech-ai](https://github.com/JEO-tech-ai) — ⭐ 도움이 됐다면 별을 눌러주세요!

</div>
