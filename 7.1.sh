#!/bin/bash

# 변수 초기화
{
  "분류": "Host OS",
  "코드": "7.1",
  "위험도": "중요도 하",
  "진단_항목": "설정 파일 권한 설정",
  "대응방안": {
    "설명": "Kubernetes 설정 파일의 퍼미션이 잘못 설정된 경우 비인가자가 다양한 방법으로 Kubernetes 설정을 변경하여 침해사고를 일으킬 가능성이 있습니다. 따라서, root 사용자/그룹이 소유권을 가지고 있고 root 외 다른 사용자가 이 파일을 수정할 수 없도록 파일의 권한을 제한하여 파일의 무결성을 유지하여야 합니다.",
    "진단방법": [
      "파일 확인 후, 소유권 및 그룹 권한 확인",
      "# kubelet.conf 파일: stat -c %a /etc/kubernetes/kubelet.conf, stat -c %U:%G /etc/kubernetes/kubelet.conf",
      "# kubelet 서비스: stat -c %a /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf, stat -c %U:%G /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf",
      "# 프록시 kubeconfig 파일: stat -c %a <proxy kubeconfig file>, stat -c %U:%G <proxy kubeconfig file>",
      "# kubelet 설정 파일: stat -c %a /var/lib/kubelet/config.yaml, stat -c %U:%G /var/lib/kubelet/config.yaml"
    ],
    "설정방법": [
      "# kubelet.conf 파일: chmod 644 /etc/kubernetes/kubelet.conf, chown root:root /etc/kubernetes/kubelet.conf",
      "# kubelet 서비스: chmod 755 /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf, chown root:root /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf",
      "# 프록시 kubeconfig 파일: chmod 644 <proxy kubeconfig file>, chown root:root <proxy kubeconfig file>",
      "# kubelet 설정 파일: chmod 644 /var/lib/kubelet/config.yaml, chown root:root /var/lib/kubelet/config.yaml"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# 설정 파일 권한 검사 및 적용
echo "Kubelet의 설정 파일 권한을 검사 및 적용합니다..."
# 파일 권한 검사
if [ -f /etc/kubernetes/kubelet.conf ]; then
    stat -c %a /etc/kubernetes/kubelet.conf
    stat -c %U:%G /etc/kubernetes/kubelet.conf
fi

# 설정 변경
echo "Kubelet의 설정 파일 권한을 강화합니다..."
chmod 644 /etc/kubernetes/kubelet.conf
chown root:root /etc/kubernetes/kubelet.conf

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
