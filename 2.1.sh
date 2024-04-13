#!/bin/bash

# 변수 초기화
{
  "분류": "etcd Configuration",
  "코드": "2.1",
  "위험도": "중요도 상",
  "진단_항목": "SSL/TLS 적용",
  "대응방안": {
    "설명": "etcd는 Kubernetes에서 중요 데이터를 저장하는 key-value 저장소로, SSL/TLS를 통해 데이터 보호 및 클라이언트 검증을 수행해야 합니다. 네트워크 스니핑 방지 및 클라이언트 인증을 통한 접근 제어가 중요합니다.",
    "설정방법": [
      "클라이언트 인증을 위한 SSL/TLS 적용: etcd의 client-cert-auth 및 peer-client-cert-auth 설정 활성화",
      "인증서 관리: etcd의 cert-file, key-file, peer-cert-file 및 peer-key-file 설정",
      "API 서버 연결 인증서 설정: kube-apiserver의 etcd-certfile, etcd-keyfile, etcd-cafile 설정",
      "자체 서명 인증서 사용 금지: etcd의 auto-tls 및 peer-auto-tls 비활성화, trusted-ca-file 설정"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# etcd SSL/TLS 설정 검토 시작
echo "etcd SSL/TLS 설정 검토를 시작합니다..."

# etcd 설정 파일 검토
echo "etcd.yaml의 SSL/TLS 설정 확인:"
grep "client-cert-auth" /etc/kubernetes/manifests/etcd.yaml
grep "peer-client-cert-auth" /etc/kubernetes/manifests/etcd.yaml
grep "cert-file" /etc/kubernetes/manifests/etcd.yaml
grep "key-file" /etc/kubernetes/manifests/etcd.yaml
grep "peer-cert-file" /etc/kubernetes/manifests/etcd.yaml
grep "peer-key-file" /etc/kubernetes/manifests/etcd.yaml

# kube-apiserver etcd 연결 인증서 설정 검토
echo "kube-apiserver의 etcd 연결 인증서 설정 확인:"
grep "etcd-certfile" /etc/kubernetes/manifests/kube-apiserver.yaml
grep "etcd-keyfile" /etc/kubernetes/manifests/kube-apiserver.yaml
grep "etcd-cafile" /etc/kubernetes/manifests/kube-apiserver.yaml

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
