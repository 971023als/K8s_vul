#!/bin/bash

# 변수 초기화
{
  "분류": "Kubelet Configuration",
  "코드": "6.1",
  "위험도": "중요도 상",
  "진단_항목": "Kubelet 인증 제어",
  "대응방안": {
    "설명": "Kubelet은 각 Worker Node에서 실행되는 주요 에이전트로, PodSpec에 따라 컨테이너를 실행하고 관리합니다. 잘못된 인증 구현으로 인한 비인증 접근이 발생하지 않도록, 인증 설정을 강화하는 것이 필수적입니다.",
    "설정방법": [
      "1-1) kublet service 파일 사용하는 경우: /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf 파일 수정",
      "--anonymous-auth=false --read-only-port=0 설정",
      "--cadvisor-port=0 설정",
      "1-2) kubelet config 파일 사용하는 경우: /var/lib/kubelet/config.yaml 파일 수정",
      "authentication: { anonymous: { enabled: false } }, readOnlyPort: 0"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# Kubelet 인증 설정 확인
echo "Kubelet 설정 파일을 확인합니다..."
if [ -f /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf ]; then
    grep -- '--anonymous-auth' /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf
    grep -- '--read-only-port' /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf
    grep -- '--cadvisor-port' /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf
elif [ -f /var/lib/kubelet/config.yaml ]; then
    cat /var/lib/kubelet/config.yaml | grep 'authentication' -A 2
    cat /var/lib/kubelet/config.yaml | grep 'readOnlyPort'
fi

# 설정 변경
echo "Kubelet 인증 설정을 강화합니다..."
# 여기에 필요한 명령어를 실행

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
