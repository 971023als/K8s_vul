#!/bin/bash

# 변수 초기화
{
  "분류": "PodSecurityPolicy Configuration",
  "코드": "4.1",
  "위험도": "중요도 상",
  "진단_항목": "컨테이너 권한 제어",
  "대응방안": {
    "설명": "Pod Security Policy(PSP)는 Kubernetes 클러스터에서 Pod의 보안 정책을 설정하고, 컨테이너의 권한을 제어합니다. 이는 컨테이너가 과도한 권한을 가지지 않도록 하며, 네트워크 및 포트 정책 설정을 통한 접근 제어를 구현합니다.",
    "설정방법": [
      "Privileged 컨테이너 실행 제한: .spec.allowPrivilegeEscalation=false 설정",
      "Root 사용자 실행 제한: .spec.runAsUser.rule 설정으로 MustRunAsNonRoot 또는 MustRunAs 적용",
      "NET_RAW 기능 제한: requiredDropCapabilities에 NET_RAW 또는 ALL 추가",
      "기타 컨테이너 권한 설정 검토 및 조정"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# Pod Security Policy 설정 검증 시작
echo "Pod Security Policy 설정 검증을 시작합니다..."

# PSP 설정 확인
echo "PSP 설정 확인 중..."
kubectl get psp <name> -o=jsonpath='{.spec.allowPrivilegeEscalation}'
kubectl get psp <name> -o=jsonpath='{.spec.privileged}'
kubectl get psp <name> -o=jsonpath='{.spec.runAsUser.rule}'
kubectl get psp <name> -o=jsonpath='{.spec.requiredDropCapabilities}'

# 결과 JSON 출력
echo "{
  \"분류\": \"$분류\",
  \"코드\": \"$코드\",
  \"위험도\": \"$위험도\",
  \"진단_항목\": \"$진단_항목\",
  \"대응방안\": \"$대응방안\",
  \"현황\": $현황,
  \"진단_결과\": \"$진단_결과\"
}"
