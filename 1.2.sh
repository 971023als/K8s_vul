#!/bin/bash

# 변수 초기화
분류="API Server Configuration"
코드="1.2"
위험도="중요도 상"
진단_항목="API Server 인증 제어"
대응방안="Kubernetes의 API Server는 다양한 인증 모듈을 지원하여, 필요한 최소한의 권한만을 부여합니다. 이를 통해 부주의하거나 악의적인 사용자로부터 다른 컨테이너의 작업에 미치는 영향을 최소화합니다. 설정방법: ABAC, RBAC, Node, Webhook과 같은 인증 모듈 활용, /etc/kubernetes/manifests/kube-apiserver.yaml에서 authorization-mode 설정 확인, 필요에 따라 ABAC, RBAC 설정 적용하여 역할 기반 및 속성 기반의 접근 제어 수행"
현황=""
진단_결과=""

# API Server 권한 설정 진단
echo "API Server 권한 설정 진단을 시작합니다..."

# 권한 모드 설정 확인
echo "kube-apiserver.yaml의 권한 모드 설정 확인:"
authorization_mode=$(grep "authorization-mode" /etc/kubernetes/manifests/kube-apiserver.yaml)

# 현황 업데이트
현황="$authorization_mode"

# 결과 CSV 출력
echo "분류,코드,위험도,진단_항목,대응방안,현황,진단_결과"
echo "\"$분류\",\"$코드\",\"$위험도\",\"$진단_항목\",\"$대응방안\",\"$현황\",\"$진단_결과\""
