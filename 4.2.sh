#!/bin/bash

# 변수 초기화
{
  "분류": "PodSecurityPolicy Configuration",
  "코드": "4.2",
  "위험도": "중요도 중",
  "진단_항목": "네임스페이스 관리",
  "대응방안": {
    "설명": "Kubernetes에서는 네임스페이스를 통해 물리적 클러스터 내 여러 논리적 가상 클러스터를 생성하며, 이를 통한 리소스 관리와 접근 제어가 가능합니다. 네임스페이스 설정을 통해 각 네임스페이스에서 실행되는 컨테이너의 권한을 제어하여 과도한 권한을 방지할 수 있습니다.",
    "설정방법": [
      "네임스페이스에서 Pod의 HostPID 공유 금지: .spec.hostPID=false 설정",
      "네임스페이스에서 Pod의 HostIPC 공유 금지: .spec.hostIPC=false 설정",
      "네임스페이스에서 Pod의 HostNetwork 사용 금지: .spec.hostNetwork=false 설정"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# Pod Security Policy 설정 검증 시작
echo "네임스페이스 설정 검증을 시작합니다..."

# 네임스페이스 설정 확인
echo "PSP 내 네임스페이스 설정 확인 중..."
kubectl get psp <name> -o=jsonpath='{.spec.hostPID}'
kubectl get psp <name> -o=jsonpath='{.spec.hostIPC}'
kubectl get psp <name> -o=jsonpath='{.spec.hostNetwork}'

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
