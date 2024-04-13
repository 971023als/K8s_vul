#!/bin/bash

# 변수 초기화
{
  "분류": "Controller Manager Configuration",
  "코드": "3.1",
  "위험도": "중요도 중",
  "진단_항목": "Controller 인증 제어",
  "대응방안": {
    "설명": "Kubernetes의 Controller Manager는 클러스터의 다양한 컨트롤러를 모니터링하며, 이들 컨트롤러가 시스템의 상태를 원하는 상태로 유지하도록 도와줍니다. 이를 위해 각 컨트롤러는 적절한 인증을 통해 안전하게 작동해야 합니다.",
    "설정방법": [
      "각 컨트롤러에 대해 개별 서비스 계정 자격 증명을 사용하도록 설정: --use-service-account-credentials=true",
      "컨트롤러 계정 자격증명에 사용되는 인증서 관리: --service-account-private-key-file=/etc/kubernetes/pki/sa.key"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# Controller Manager 설정 검증 시작
echo "Controller Manager 설정 검증을 시작합니다..."

# kube-controller-manager.yaml 설정 파일 검증
echo "kube-controller-manager.yaml의 인증 설정 확인:"
grep "use-service-account-credentials" /etc/kubernetes/manifests/kube-controller-manager.yaml
grep "service-account-private-key-file" /etc/kubernetes/manifests/kube-controller-manager.yaml

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
