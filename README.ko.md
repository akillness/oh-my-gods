# oh-my-gods

<div align="center">

[![Skills](https://img.shields.io/badge/Skills-28-blue?style=for-the-badge)](https://github.com/akillness/oh-my-gods)
[![Platform](https://img.shields.io/badge/Platform-Claude%20%7C%20Gemini%20%7C%20Codex%20%7C%20OpenCode-orange?style=for-the-badge)](https://github.com/akillness/oh-my-gods)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-orange?logo=buy-me-a-coffee)](https://www.buymeacoffee.com/akillness3q)

</div>

```
  ██████╗ ██╗  ██╗      ███╗   ███╗██╗   ██╗      ██████╗  ██████╗ ██████╗ ███████╗
 ██╔═══██╗██║  ██║      ████╗ ████║╚██╗ ██╔╝     ██╔════╝ ██╔═══██╗██╔══██╗██╔════╝
 ██║   ██║███████║█████╗██╔████╔██║ ╚████╔╝█████╗██║  ███╗██║   ██║██║  ██║███████╗
 ██║   ██║██╔══██║╚════╝██║╚██╔╝██║  ╚██╔╝ ╚════╝██║   ██║██║   ██║██║  ██║╚════██║
 ╚██████╔╝██║  ██║      ██║ ╚═╝ ██║   ██║         ╚██████╔╝╚██████╔╝██████╔╝███████║
  ╚═════╝ ╚═╝  ╚═╝      ╚═╝     ╚═╝   ╚═╝          ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝
```

<div align="center">

**LLM 에이전트를 만들고, 평가하고, 운영하기 위한 에이전트 엔지니어링 스킬셋**

*28개 집중 스킬 · [jeo-skills](https://github.com/akillness/jeo-skills)와 중복 없음 · 크로스 플랫폼*

[빠른 시작](#-빠른-시작) · [스킬 카탈로그](#-스킬-카탈로그) · [설치](#-설치) · [English](README.md)

</div>

---

## 🎯 oh-my-gods 란?

`oh-my-gods`는 **에이전트 자체를 만들 때** 필요한 레이어에 집중한 가벼운 스킬셋입니다 — 아키텍처, 메모리, 툴 라우팅, 가드레일, 평가, 관측성, 멀티 에이전트 프로토콜.

[`jeo-skills`](https://github.com/akillness/jeo-skills)와 **중복되지 않도록** 의도적으로 범위를 좁혔습니다. 일반 개발 워크플로우, 오케스트레이션(`omg`/`omc`/`omx`/`ohmg`), 기획, 프론트/백엔드, 콘텐츠 스킬은 모두 그쪽에 있습니다. oh-my-gods는 그 컬렉션을 보완하는 **에이전트 중심 28개 스킬**만 유지합니다.

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

### 코어 에이전트 (11)

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

### 에이전트 아키텍처 & 운영 (10)

| 스킬 | 설명 |
|------|------|
| `agent-observability` | LangSmith/Langfuse/Phoenix 선택, 노드 단위 트레이스, 리플레이 |
| `agent-memory-architecture` | mem0/Letta/Zep 선택, core/recall/archival 계층, 시계열 vs 스냅샷 |
| `mcp-server-design` | MCP 서버 — Server Card, 무상태 전송, 레지스트리 준수 |
| `agent-guardrails` | NeMo Colang + Lakera/LLM Guard — 프롬프트 인젝션, 유출, 툴 오용 |
| `agent-system-design` | 에이전트 SLA: MAX_LOOPS, 비용 예산, 서킷 브레이커, 경계 |
| `agent-tool-routing` | 툴 레지스트리, 역량 탐색, 스키마, 라우터 정책, 폴백 |
| `multi-agent-eval-harness` | 역할 단위 메트릭, 협업 실패 테스트, 트랜스크립트 채점 |
| `a2a-protocol` | Agent-to-Agent 수평 메시징 (Linux Foundation AAIF 2026 표준) |
| `reflexion-pattern` | 비평 노드 + 실패 언어 기억, 안정적 루브릭 채점, 재시도 예산 |
| `agent-benchmarking` | SWE-bench/WebArena/OSWorld + 커스텀 회귀 팩으로 역량 매핑 |

### 에이전트 인접 (7)

| 스킬 | 설명 |
|------|------|
| `agent-development-principles` | `agent-principles`의 호환 별칭 (그쪽으로 라우팅) |
| `ai-research-skills` | 자율 ML 연구용 86개 스킬 — 파인튜닝, RLHF, RAG, 논문 |
| `cli-oss-scout` | 에이전트 툴링용 OSS CLI 후보 근거 기반 발굴/심사 |
| `frouter` | OpenCode / OpenClaw용 무료 AI 모델 라우터/벤치마커 |
| `langextract` | LLM 기반 출처 근거 구조화 추출 |
| `openclone` | 다중 전문가 관점 대화를 위한 AI 페르소나 클론 |
| `pm-skills` | 제품 관리 OS — 8개 플러그인의 65개 스킬, 36개 커맨드 |

---

## 📦 설치

```bash
# 사전 조건
npm install -g skills

# 권장 — 한 줄
curl -fsSL https://raw.githubusercontent.com/akillness/oh-my-gods/main/install.sh | bash

# 또는 28개 스킬 전체
npx skills add -g https://github.com/akillness/oh-my-gods --skill '*' --yes
```

**환경**: `node >= 18`, `git`, `bash`. 스킬은 `~/.agent-skills`에 복사된 뒤 `~/.claude/skills`, `~/.codex/skills`, `~/.gemini/skills`, `~/.opencode/skills`로 배포됩니다.

전체 LLM 위임 설치/검증 절차는 [`setup-all-skills-prompt.md`](setup-all-skills-prompt.md)를 참고하세요.

---

## 📎 참조 & 출처

| 스킬 | 출처 | 라이선스 |
|------|------|----------|
| `ralph` | [Q00/ouroboros](https://github.com/Q00/ouroboros) | MIT |
| `deepagents` | [langchain-ai/deepagents](https://github.com/langchain-ai/deepagents) | MIT |
| `langextract` | [google/langextract](https://github.com/google/langextract) | Apache-2.0 |
| `agent-manager` | [fractalmind-ai/agent-manager-skill](https://github.com/fractalmind-ai/agent-manager-skill) | MIT |
| `pm-skills` | [phuryn/pm-skills](https://github.com/phuryn/pm-skills) | MIT |
| `ai-research-skills` | [Orchestra-Research/AI-Research-SKILLs](https://github.com/Orchestra-Research/AI-Research-SKILLs) | MIT |
| `frouter` | [jyoung105/frouter](https://github.com/jyoung105/frouter) | MIT |
| `agent-development-principles` | [ykdojo/claude-code-tips](https://github.com/ykdojo/claude-code-tips) | MIT |
| `a2a-protocol` | Linux Foundation AAIF | — |
| Agent Skills Spec | [agentskills.io](https://agentskills.io/specification) | — |

---

<div align="center">

oh-my-gods가 도움이 되었다면 후원을 고려해 주세요!

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/akillness3q)

<img src="qr-code.png" alt="Buy Me A Coffee QR Code" width="180">

Made with ❤️ by [JEO-tech-ai](https://github.com/JEO-tech-ai) — ⭐ 도움이 됐다면 별을 눌러주세요!

</div>
