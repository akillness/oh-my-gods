# Solution Landscape: skill loop r92

## Solution List

| Name | Approach | Strengths | Weaknesses | Notes |
|------|----------|-----------|------------|-------|
| addyosmani/agent-skills | Agent skill catalog | 대규모 채택, 최근 업데이트, MIT | 범용 카탈로그라 현 repo 맞춤화 필요 | https://github.com/addyosmani/agent-skills |
| zarazhangrui/frontend-slides | Frontend slide generation skill | 스타/활성도 높음, MIT | 특정 사용례 편향 | https://github.com/zarazhangrui/frontend-slides |
| andreasbm/web-skills | Web skill map | 학습 맵으로 참고 가치 | NOASSERTION 라이선스 | https://github.com/andreasbm/web-skills |
| jeremylongshore/claude-code-plugins-plus-skills | CLI + skills marketplace | 활발한 업데이트, MIT | 범위가 넓어 선별 필요 | https://github.com/jeremylongshore/claude-code-plugins-plus-skills |
| duthaho/claudekit | Claude CLI toolkit | 최근 활동, MIT | 채택 지표 낮음 | https://github.com/duthaho/claudekit |
| skrun-dev/skrun | agent runtime CLI | MIT, 최근 활동 | 상대적으로 작은 생태계 | https://github.com/skrun-dev/skrun |
| godotengine/godot | game dev ecosystem anchor | 대규모 채택, MIT, 매우 활발 | 범용 엔진이라 skill 범위 정의 필요 | https://github.com/godotengine/godot |
| GodotSteam/Skillet | game plugin/tooling | 게임 개발 연관성 | archived + license null | https://github.com/GodotSteam/Skillet |

## Categories

- Agentic AI skill catalog: addyosmani/agent-skills
- Web frontend/backend skill references: frontend-slides, web-skills
- CLI OSS skill candidates: claude-code-plugins-plus-skills, claudekit, skrun
- Game development candidate sources: godot, skillet

## What People Actually Use

- 실제 운영 가능성이 높은 후보는 라이선스 명확 + 최근 push + non-archived 조건을 만족하는 저장소에 집중됨.
- 검색어 자체(`* skill`)는 학습용/홍보성 저장소를 다수 포함하므로 API 메타데이터 보강이 필수.

## Frequency Ranking

1. addyosmani/agent-skills
2. zarazhangrui/frontend-slides
3. jeremylongshore/claude-code-plugins-plus-skills

## Key Gaps

- 기존 `.god-skills`에는 “CLI OSS 후보 발굴/평가 전용” 스킬이 없음.
- 기존 표준화 스킬에는 OSS 리스크 게이트(라이선스/활성도/리스크 명시) 지시가 약함.

## Contradictions

- 검색 상위 노출 ≠ 즉시 채택 가능. (예: archived 저장소, license null)

## Key Insight

이번 루프에서는 신규 후보를 더 늘리는 것보다, "CLI OSS 후보를 반복적으로 검증하는 절차"를 스킬화하고, 기존 표준화 스킬에 OSS 리스크 게이트를 보강하는 편이 품질 게이트 충족 가능성이 가장 높다.
