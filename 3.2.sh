#!/bin/bash

# 변수 초기화
{
  "분류": "Controller Manager Configuration",
  "코드": "3.2",
  "위험도": "중요도 중",
  "진단_항목": "SSL/TLS 적용",
  "대응방안": {
    "설명": "Kubernetes에서 SSL/TLS를 이용하여 네트워크 상의 DATA를 보호하고 클라이언트 인증을 통한 보안 강화가 필요합니다. 이를 통해 네트워크 스니핑과 같은 방법으로 주요 정보가 노출되어 다른 공격에 이용되는 것을 방지하고, API server에 접근하는 대상을 검증할 수 있습니다.",
    "설정방법": [
      "클라이언트 인증을 위해 SSL/TLS 적용: /etc/kubernetes/manifests/kube-controller-manager.yaml 파일 내 --root-ca-file=/etc/kubernetes/pki/ca.crt 설정",
      "인증서 교환주기 설정: /etc/kubernetes/manifests/kube-controller-manager.yaml 파일 내 --feature-gates=RotateKubeletServerCertificate=true 추가"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# Controller Manager SSL/TLS 설정 검증 시작
echo "Controller Manager SSL/TLS 설정 검증을 시작합니다..."

# kube-controller-manager.yaml SSL/TLS 설정 파일 검증
echo "kube-controller-manager.yaml의 SSL/TLS 인증 설정 확인:"
grep "root-ca-file" /etc/kubernetes/manifests/kube-controller-manager.yaml
grep "feature-gates" /etc/kubernetes/manifests/kube-controller-manager.yaml

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
