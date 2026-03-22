# .omg 프로젝트 관리 시스템 (OMG Project Management)

OMG 워크플로우 실행을 위한 장기계획, 단기계획, 진행 추적, 히스토리를 관리하는 폴더입니다.

---

## Purpose

`.omg/` 폴더는 OMG(Oh-My-Gods) 에이전트 플로우가 프로젝트의 맥락을 유지하고,
계획을 추적하며, 작업 히스토리를 아카이브하기 위해 사용하는 프로젝트 관리 시스템입니다.

---

## Folder Structure

```
.omg/
├── README.md              # 이 파일 — 사용 가이드
├── long-term/             # 장기계획 (변경 빈도 낮음)
│   ├── concept.md         # 기획 컨셉, 비전, 목표
│   ├── rules.md           # 규칙, 제약조건, 정책
│   └── validation.md      # 유효성 검증 기준, 품질 게이트
├── short-term/            # 단기계획 (스프린트 단위)
│   ├── system.md          # 시스템 설계, 아키텍처 결정
│   ├── unit-tests.md      # 단위 테스트 계획
│   └── flow-tests.md      # 플로우/통합 테스트 계획
├── backlog.md             # 계획된 작업 (todo)
├── progress.md            # 진행 중인 작업 (in-progress)
└── history.md             # 완료된 작업 히스토리 (archive)
```

---

## How OMG Agent Flow Uses These Docs

OMG 에이전트는 작업 시작 시 다음 순서로 문서를 참조합니다:

1. **`long-term/concept.md`** — 비전과 핵심 목표를 확인하여 방향성 정렬
2. **`long-term/rules.md`** — 절대 규칙과 제약조건 확인 (위반 방지)
3. **`long-term/validation.md`** — 품질 게이트 기준 확인
4. **`short-term/system.md`** — 현재 아키텍처 결정 참조
5. **`backlog.md`** — 다음 작업 선택
6. **`progress.md`** — 현재 진행 중인 작업 확인

작업 완료 시 에이전트는:
- `progress.md`에서 해당 항목을 제거하고
- `history.md`에 완료 기록을 추가합니다.

---

## Lifecycle: Backlog → Progress → History

```
[backlog.md]  →  [progress.md]  →  [history.md]
  (todo)          (in-progress)      (archive)
```

- **backlog.md**: 새 작업 추가. 우선순위(P0~P3) 태그 사용.
- **progress.md**: 작업 시작 시 backlog에서 이동. 완료 시 history로 아카이브.
- **history.md**: 완료된 작업의 영구 기록. 참조용으로만 사용.

> 파일 정리(pruning): history.md가 너무 커지면 오래된 항목을 `history-archive-YYYY.md`로 분리.

---

## How to Add New Plans

### 새 백로그 항목 추가

`backlog.md`에 다음 형식으로 추가:

```markdown
- [ ] [P0] 항목 설명 (추가일: YYYY-MM-DD)
```

우선순위:
- `P0` — 긴급/블로커
- `P1` — 높음
- `P2` — 보통
- `P3` — 낮음/나중에

### 장기계획 업데이트

`long-term/` 파일의 frontmatter `updated` 날짜를 갱신하고 내용을 수정합니다.

### 단기계획 업데이트

`short-term/` 파일의 `sprint` 값을 현재 스프린트로 갱신합니다.

---

## File Format Conventions

- **Frontmatter**: YAML frontmatter (`---`) 사용. `updated`, `status`, `sprint` 필드 유지.
- **날짜 형식**: `YYYY-MM-DD`
- **체크박스**: `- [ ]` (미완료), `- [x]` (완료)
- **우선순위 태그**: `[P0]`, `[P1]`, `[P2]`, `[P3]`
- **섹션 구분**: `##` 헤더로 카테고리 분류
- **언어**: 한국어 우선, 기술 용어는 영어 병기

---

## Notes

- 이 폴더의 파일들은 OMG 에이전트가 자동으로 읽고 업데이트합니다.
- 수동으로 편집할 때는 frontmatter의 `updated` 날짜를 반드시 갱신하세요.
- `long-term/rules.md`의 **절대 규칙**은 에이전트가 절대 위반하지 않습니다.
