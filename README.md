# Kubernetes 취약점 진단 자동화 스크립트

이 프로젝트는 Kubernetes 클러스터의 보안 취약점을 자동으로 진단하고 평가하는 스크립트를 제공합니다. 스크립트는 클러스터 설정, 네트워크 보안, 인증 및 권한 관리 영역을 점검하여 보안 수준을 강화할 수 있는 권장 사항을 제공합니다.

## 주요 기능

### 1. 클러스터 설정 점검
- **API 서버 설정**:
  - 익명 인증(Anonymous Authentication) 비활성화 여부 확인.
  - Secure Port(6443) 활성화 확인.
  - `--kubelet-https` 옵션 사용 여부 확인.
  - `--audit-log-path` 설정 활성화 여부 확인.

- **Etcd 데이터 저장소**:
  - SSL/TLS로 데이터 암호화 여부 점검.
  - `--client-cert-auth` 옵션 활성화 여부 확인.
  - 백업 및 복구 정책 점검.

---

### 2. 네트워크 보안 점검
- **네트워크 정책(Network Policies)**:
  - 모든 네임스페이스에 적절한 네트워크 정책이 설정되었는지 점검.
  - Pod-to-Pod 및 Pod-to-Service 간 통신 제한 여부 확인.

- **불필요한 서비스 및 리소스 점검**:
  - 기본 네임스페이스의 불필요한 서비스 및 Deployment 확인.
  - LoadBalancer 및 NodePort 서비스의 최소화 여부 점검.

---

### 3. 인증 및 권한 관리 점검
- **Role 및 ClusterRole**:
  - 최소 권한 원칙(Principle of Least Privilege, PoLP) 준수 여부 확인.
  - `system:masters` 그룹의 불필요한 사용자 점검.

- **ServiceAccount 관리**:
  - ServiceAccount 토큰 자동 생성 비활성화 여부 점검.
  - 사용하지 않는 ServiceAccount 및 관련 리소스 제거 권장.

---

### 4. 결과 리포트
- **JSON 형식의 점검 결과 제공**:
  - 점검 항목별 상태(안전/취약/경고) 표시.
  - 권장 조치 방안 포함.

- **HTML 및 Markdown 보고서 출력**:
  - 클러스터 보안 상태를 직관적으로 확인할 수 있는 시각화된 리포트 제공.
  - Markdown 포맷으로 팀 내 공유 가능한 간결한 리포트 생성.

