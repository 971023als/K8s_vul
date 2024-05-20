#!/bin/bash

# 변수 초기화
분류="API Server Configuration"
코드="1.5"
위험도="중요도 하"
진단_항목="로그 관리"
대응방안="Kubernetes API Server의 로그 관리는 시스템 내 모든 활동을 문서화하여 오류 및 부정 행위 감지에 중요합니다. 로그 파일은 변조 방지를 위해 보호 조치가 필요하며, 정기적인 로그 검토가 필요합니다. 설정방법: 로그 디렉터리 및 파일 설정: /etc/kubernetes/manifests/kube-apiserver.yaml 파일 내 필요한 파라미터 설정, 로그 저장 주기 설정: audit-log-maxage 파라미터를 통해 로그 유지 기간 설정, 고급 감사(auditing) 활성화: audit-policy-file을 통해 정책 파일 지정"
현황=""
진단_결과=""

# 로그 관리 설정 검토 시작
echo "Kubernetes API Server 로그 관리 설정 검토를 시작합니다..."

# 로그 설정 검토
echo "kube-apiserver.yaml의 로그 설정 확인:"
audit_log_path=$(grep "audit-log-path" /etc/kubernetes/manifests/kube-apiserver.yaml)
audit_log_maxbackup=$(grep "audit-log-maxbackup" /etc/kubernetes/manifests/kube-apiserver.yaml)
audit_log_maxsize=$(grep "audit-log-maxsize" /etc/kubernetes/manifests/kube-apiserver.yaml)
audit_log_maxage=$(grep "audit-log-maxage" /etc/kubernetes/manifests/kube-apiserver.yaml)
audit_policy_file=$(grep "audit-policy-file" /etc/kubernetes/manifests/kube-apiserver.yaml)

# 현황 업데이트
현황="$audit_log_path\n$audit_log_maxbackup\n$audit_log_maxsize\n$audit_log_maxage\n$audit_policy_file"

# 결과 CSV 출력
echo "분류,코드,위험도,진단_항목,대응방안,현황,진단_결과"
echo "\"$분류\",\"$코드\",\"$위험도\",\"$진단_항목\",\"$대응방안\",\"$현황\",\"$진단_결과\""
