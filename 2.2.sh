#!/bin/bash

# 변수 초기화
{
  "분류": "etcd Configuration",
  "코드": "2.2",
  "위험도": "중요도 중",
  "진단_항목": "etcd 암호화",
  "대응방안": {
    "설명": "etcd는 Kubernetes에서 사용하는 중요 데이터를 저장하는 분산 key-value 저장소입니다. 데이터는 안전한 알고리즘을 사용하여 암호화되어야 하며, 사용된 암호화 기법은 고급 보안 표준을 충족해야 합니다.",
    "설정방법": [
      "kube-apiserver의 YAML 설정 파일에 experimental-encryption-provider-config 옵션 추가",
      "암호화 설정 파일에 안전한 암호화 방식 적용, 예: AESCBC",
      "암호화 설정 파일 경로 지정: /etc/kubernetes/manifests/kube-apiserver.yaml 파일 내 설정 추가"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# etcd 암호화 설정 검토 시작
echo "etcd 암호화 설정 검토를 시작합니다..."

# kube-apiserver 설정 파일 검토
echo "kube-apiserver.yaml의 암호화 설정 확인:"
grep "experimental-encryption-provider-config" /etc/kubernetes/manifests/kube-apiserver.yaml

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
