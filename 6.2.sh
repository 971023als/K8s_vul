#!/bin/bash

# 변수 초기화
{
  "분류": "Kubelet Configuration",
  "코드": "6.2",
  "위험도": "중요도 상",
  "진단_항목": "Kubelet 권한 제어",
  "대응방안": {
    "설명": "Kubelets는 Kubernetes Master의 API 서버에서 전달되는 요청을 기본적으로 권한 검사 없이 허용하고 있습니다. 이를 개선하기 위해 Kubelet의 설정을 변경하여 권한 검증을 수행하도록 해야 합니다.",
    "설정방법": [
      "1-1) kublet service 파일 사용하는 경우: /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf 파일 수정",
      "--authorization-mode=Webhook 설정",
      "1-2) kubelet config 파일 사용하는 경우: /var/lib/kubelet/config.yaml 파일 수정",
      "authorization: { mode: Webhook }"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# Kubelet 권한 설정 확인
echo "Kubelet 설정 파일을 확인합니다..."
if [ -f /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf ]; then
    grep -- '--authorization-mode' /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf
elif [ -f /var/lib/kubelet/config.yaml ]; then
    cat /var/lib/kubelet/config.yaml | grep 'authorization' -A 1
fi

# 설정 변경
echo "Kubelet 권한 설정을 강화합니다..."
# 필요한 명령어를 실행

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
