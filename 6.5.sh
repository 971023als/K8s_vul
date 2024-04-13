#!/bin/bash

# 변수 초기화
{
  "분류": "Kubelet Configuration",
  "코드": "6.5",
  "위험도": "중요도 중",
  "진단_항목": "Kubelet 파라미터 설정",
  "대응방안": {
    "설명": "리눅스의 Kernel 파라미터의 Tuning 작업을 통해 기본적인 IP Forwarding이나 ip_forward_directed_broadcasts, arp 관련 ip_forward_src_routed들에 대한 Tuning과 같은 보안 기능을 적용하여 서비스 거부 공격(DOS)의 경유지에 이용, Spoofing(IP Address 변조 등의 공격)등을 사전에 차단할 수 있습니다. Kubernetes에서는 기본으로 설정된 Kernel 파라미터가 존재하며 기본적으로 적용되어 있습니다. 만일 이기본값이 조직 운영 정책과 다른 경우 원하지 않는 커널 기능이 존재하는 포드가 실행될 수 있습니다.",
    "설정방법": [
      "1-1) kublet service 파일 사용하는 경우: /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf 파일 내 --protect-kernel-defaults=true 설정",
      "1-2) kubelet config 파일 사용하는 경우: /var/lib/kubelet/config.yaml 파일 내 protectKernelDefaults: true 설정"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# Kernel 파라미터 설정 검사 및 적용
echo "Kubelet의 Kernel 파라미터 설정을 검사 및 적용합니다..."
if [ -f /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf ]; then
    grep '--protect-kernel-defaults' /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf
fi
if [ -f /var/lib/kubelet/config.yaml ]; then
    cat /var/lib/kubelet/config.yaml | grep 'protectKernelDefaults'
fi

# 설정 변경
echo "Kubelet의 Kernel 파라미터 설정을 강화합니다..."
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
