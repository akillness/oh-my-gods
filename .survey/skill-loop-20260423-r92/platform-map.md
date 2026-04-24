# Platform Map: hourly skill candidate survey

## Settings

| Concern | Browser Search | GitHub API Metadata | Common Layer |
|---------|----------------|---------------------|--------------|
| Discovery query | 키워드별 검색 URL | `repos/{owner}/{repo}` 조회 | 증거 수집 |
| Result quality | 노이즈 높음 | 구조화 메타데이터 | 후보 정제 |
| Reliability | CAPTCHA/로그인 영향 가능 | 레이트리밋 영향 가능 | fallback 필요 |

## Rules

| Concern | Current Rule | Applied in r92 | Common Layer |
|---------|--------------|----------------|--------------|
| Mandatory keywords | 5개 키워드 고정 | 전부 수행 | 필수 계약 준수 |
| CLI candidates | 최소 3개 | 3개 이상 확보 | 실행별 최소치 |
| Duplicate check | 기존 skill 경로 확인 | `.god-skills/*/SKILL.md` 기준 분류 | 중복 방지 |
| Merge gate | all-pass only merge | 체크 실패 시 open 유지 | 안전한 릴리즈 |

## Hooks

| Lifecycle | Hook | Effect |
|-----------|------|--------|
| pre-research | backlog-first PR 상태 확인 | 무의미한 중복 작업 방지 |
| post-discovery | API metadata enrichment | 라이선스/활성도 검증 |
| post-change | validate_frontmatter.py 실행 | 문서/메타데이터 일관성 확인 |
| post-pr | `gh pr checks` 평가 | merge 가능 여부 판정 |

## Platform Gaps

- web_search API key 이슈가 있는 환경에서는 browser+GitHub API fallback이 사실상 필수.
- CI 체크가 없는 저장소는 `gh pr checks` 기준으로 merge gate pass를 확정하기 어렵다.
