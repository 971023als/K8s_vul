#!/bin/bash

# 변수 초기화
{
  "분류": "Host OS",
  "코드": "5.1",
  "위험도": "중요도 하",
  "진단_항목": "설정 파일 권한 설정",
  "대응방안": {
    "설명": "Kubernetes 설정 파일의 권한이 잘못 설정되어 있으면 비인가자가 시스템 설정을 변경할 수 있습니다. 이를 방지하기 위해 root 사용자/그룹만이 설정 파일을 소유하고 수정할 수 있도록 해야 합니다. 이를 통해 파일의 무결성을 보장합니다.",
    "설정방법": [
      "kube-apiserver.yaml 권한 설정: chmod 644 /etc/kubernetes/manifests/kube-apiserver.yaml 및 chown root:root /etc/kubernetes/manifests/kube-apiserver.yaml",
      "kube-controller-manager.yaml 권한 설정: chmod 644 /etc/kubernetes/manifests/kube-controller-manager.yaml 및 chown root:root /etc/kubernetes/manifests/kube-controller-manager.yaml",
      "kube-scheduler.yaml 권한 설정: chmod 644 /etc/kubernetes/manifests/kube-scheduler.yaml 및 chown root:root /etc/kubernetes/manifests/kube-scheduler.yaml",
      "etcd.yaml 권한 설정: chmod 644 /etc/kubernetes/manifests/etcd.yaml 및 chown root:root /etc/kubernetes/manifests/etcd.yaml",
      "Container Network Interface 파일 권한 설정: chmod 644 <path/to/cni/files> 및 chown root:root <path/to/cni/files>"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# Kubernetes 설정 파일 권한 확인
echo "Kubernetes 설정 파일 권한 확인을 시작합니다..."
stat -c %a /etc/kubernetes/manifests/kube-apiserver.yaml
stat -c %U:%G /etc/kubernetes/manifests/kube-apiserver.yaml

# 파일 권한 설정
chmod 644 /etc/kubernetes/manifests/kube-apiserver.yaml
chown root:root /etc/kubernetes/manifests/kube-apiserver.yaml

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
