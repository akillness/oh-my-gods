# Context: hourly skill candidate loop (r92)

## Workflow Context

이번 실행은 다음 고정 키워드를 대상으로 브라우저 검색을 수행했다.

1. `agentic ai skill`
   - https://github.com/search?q=agentic+ai+skill&type=repositories
2. `web frontend skill`
   - https://github.com/search?q=web+frontend+skill&type=repositories
3. `web backend skill`
   - https://github.com/search?q=web+backend+skill&type=repositories
4. `cli open source skill`
   - https://github.com/search?q=cli+open+source+skill&type=repositories
5. `game development skill`
   - https://github.com/search?q=game+development+skill&type=repositories

검색 결과는 노이즈가 커서(학습용 저장소/개인 포트폴리오 혼합), GitHub API 메타데이터로 라이선스/활성도/아카이브 상태를 보강했다.

## Affected Users

| Role | Responsibility | Skill Level |
|------|----------------|-------------|
| Maintainer | 신규/개선 스킬 채택 및 머지 판단 | Advanced |
| Skill author | SKILL.md 작성/개선 | Intermediate |
| Automation runner | 시간 기반 조사/리포트 생성 | Advanced |

## Current Workarounds

1. 검색 결과 상위 항목을 수동으로 선별한다.
2. 라이선스/활성도를 수동 확인해 중복 판단을 한다.
3. PR 없이 제안만 남겨 다음 실행으로 이월한다.

## Adjacent Problems

- web_search API key 오류(401) 시 조사 중단 위험
- 검색 키워드가 넓어 후보 품질 편차가 큼
- 라이선스 불명(NOASSERTION) 저장소를 실수로 포함할 수 있음

## User Voices

- 잡 스펙상 `CLI 오픈소스 후보 최소 3개`는 매 실행 필수
- 품질 게이트에서 링크 근거/리스크 명시가 누락되면 merge 금지
