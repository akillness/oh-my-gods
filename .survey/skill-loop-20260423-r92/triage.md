# Triage

- Problem: `oh-my-gods` 정기 루프에서 키워드 기반 후보 조사, 중복 분류, PR 생성/품질 게이트 판정까지 한 번에 자동화해야 한다.
- Audience: `oh-my-gods` 유지보수자 및 스킬 카탈로그 운영자.
- Why now: 직전 루프(`r91`) 이후 open PR이 없는 상태라, 신규 후보를 다시 수집하고 즉시 반영 가능한 변경(신규 스킬 + 기존 스킬 개선)을 PR로 올릴 필요가 있다.

## Backlog-first 확인

- Open PR: 없음 (`gh pr list --state open`)
- 최근 merge PR: #80 까지 확인
- 미처리 합의 항목: 명시적 pending 없음
- 처리 결론: 신규 조사/신규 PR 생성 진행
