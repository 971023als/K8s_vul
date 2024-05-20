#!/bin/bash

# 변수 초기화
분류="API Server Configuration"
코드="1.3"
위험도="중요도 상"
진단_항목="SSL/TLS 적용"
대응방안="TLS는 데이터를 암호화하여 송수신하는 프로토콜입니다. Kubernetes의 API Server와 kubelet 간 통신, 사용자 인증에 TLS를 적용하여 네트워크 스니핑으로부터 정보를 보호하고, API Server의 클라이언트를 검증합니다. 인증서는 주기적으로 변경하며, 안전한 암호화 방식을 사용해야 합니다. 설정방법: API 서버 및 kubelet 인증서 설정: kubelet-certificate-authority, kubelet-client-certificate, kubelet-client-key 설정, API 서버 TLS 설정: tls-cert-file, tls-private-key-file, client-ca-file 설정, 안전한 TLS 버전 사용 설정, 인증서 교체 주기 설정 및 관리"
현황=""
진단_결과=""

# API Server SSL/TLS 설정 진단
echo "API Server SSL/TLS 설정 진단을 시작합니다..."

# TLS 설정 확인
echo "kube-apiserver.yaml의 TLS 설정 확인:"
tls_cert_file=$(grep "tls-cert-file" /etc/kubernetes/manifests/kube-apiserver.yaml)
tls_private_key_file=$(grep "tls-private-key-file" /etc/kubernetes/manifests/kube-apiserver.yaml)
client_ca_file=$(grep "client-ca-file" /etc/kubernetes/manifests/kube-apiserver.yaml)

# 현황 업데이트
현황="$tls_cert_file\n$tls_private_key_file\n$client_ca_file"

# 결과 CSV 출력
echo "분류,코드,위험도,진단_항목,대응방안,현황,진단_결과"
echo "\"$분류\",\"$코드\",\"$위험도\",\"$진단_항목\",\"$대응방안\",\"$현황\",\"$진단_결과\""
