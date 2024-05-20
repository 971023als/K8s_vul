#!/bin/bash

# 변수 초기화
분류="API Server Configuration"
코드="1.1"
위험도="중요도 상"
진단_항목="API Server 인증 제어"
대응방안="API Server는 Kubernetes의 중심이며, 올바른 인증 구현이 필수적입니다. 서비스 계정과 사용자 계정을 통한 인증 관리, 안전한 인증 방식 사용, 비인증 서비스 접근 차단 등을 통해 API Server의 보안을 강화합니다. 설정방법: 외부 인증 서비스를 사용하여 사용자 계정 관리, 비인증 접근 차단을 위해 kube-apiserver.yaml 설정 수정, 취약한 인증 방식 사용 금지, 서비스 API의 외부 노출 금지, OAuth나 Webhook과 같은 계정 연동 서비스 활용"
현황=""
진단_결과=""

# API Server 설정 진단
echo "API Server 설정 진단을 시작합니다..."

# 비인증 접근 차단 설정 확인
echo "kube-apiserver.yaml 설정 확인:"
anonymous_auth=$(grep "anonymous-auth" /etc/kubernetes/manifests/kube-apiserver.yaml)
insecure_allow_any_token=$(grep "insecure-allow-any-token" /etc/kubernetes/manifests/kube-apiserver.yaml)

# 현황 업데이트
현황="$anonymous_auth\n$insecure_allow_any_token"

# 결과 CSV 출력
echo "분류,코드,위험도,진단_항목,대응방안,현황,진단_결과"
echo "\"$분류\",\"$코드\",\"$위험도\",\"$진단_항목\",\"$대응방안\",\"$현황\",\"$진단_결과\""
