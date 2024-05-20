#!/bin/bash

# 변수 초기화
분류="API Server Configuration"
코드="1.4"
위험도="중요도 중"
진단_항목="Admission Control Plugin 설정"
대응방안="Admission Control 플러그인은 클러스터 사용 방식을 제어하며, PodSecurityPolicy, 이미지 접근 제어, webhook을 통한 보안 기능 수행 등을 지원합니다. 이를 통해 네임스페이스 또는 클러스터 수준의 보안 기준을 수립하고, 자동 주석 추가, 리소스 제한 등의 구성 관리도 가능합니다. 설정방법: Admission Control이 정책을 적용하도록 설정: enable-admission-plugins에 적절한 플러그인 추가, privileged pod에서 exec 및 attach 사용 금지 설정: enable-admission-plugins에 DenyEscalatingExec 추가, PodSecurityPolicy 적용으로 클러스터 보안 수준 강화, API 서버의 요청 승인 속도 제한을 위한 EventRateLimit 플러그인 추가"
현황=""
진단_결과=""

# API Server Admission Control 설정 검토
echo "API Server Admission Control 설정 검토를 시작합니다..."

# Admission Control 설정 확인
echo "kube-apiserver.yaml의 Admission Control 설정 확인:"
enable_admission_plugins=$(grep "enable-admission-plugins" /etc/kubernetes/manifests/kube-apiserver.yaml)
disable_admission_plugins=$(grep "disable-admission-plugins" /etc/kubernetes/manifests/kube-apiserver.yaml)
admission_control_config_file=$(grep "admission-control-config-file" /etc/kubernetes/manifests/kube-apiserver.yaml)

# 현황 업데이트
현황="$enable_admission_plugins\n$disable_admission_plugins\n$admission_control_config_file"

# 결과 CSV 출력
echo "분류,코드,위험도,진단_항목,대응방안,현황,진단_결과"
echo "\"$분류\",\"$코드\",\"$위험도\",\"$진단_항목\",\"$대응방안\",\"$현황\",\"$진단_결과\""
