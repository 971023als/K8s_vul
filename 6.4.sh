#!/bin/bash

# 변수 초기화
{
  "분류": "Kubelet Configuration",
  "코드": "6.4",
  "위험도": "중요도 하",
  "진단_항목": "로그 관리",
  "대응방안": {
    "설명": "Kubelet의 로그 관리를 통해 개별 사용자, 관리자 또는 시스템의 다른 구성 요소에 의해 시스템에 영향을 미친 활동 순서를 문서화해야 합니다. 담당자는 로그 기록을 정기적으로 확인·감독하여 사용자 접속과 관련하여 오류 및 부정행위가 발생하거나 예상되는 경우 즉각적인 보고 조치가 되도록 해야 합니다. 또한 로그 파일이 위·변조되지 않도록 하기 위해 별도 저장 장치에 백업 보관하고, 쓰기 권한을 제한하여 보관하는 것이 바람직하며, 그 외 수정이 가능하더라도 위·변조 여부를 확인할 수 있는 정보(HMAC 값 또는 전자서명 값) 등을 이용한 별도의 보호조치를 취할 수 있습니다.",
    "설정방법": [
      "1-1) kublet service 파일 사용하는 경우: /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf 파일 수정",
      "--event-qps=0 설정",
      "1-2) kubelet config 파일 사용하는 경우: /var/lib/kubelet/config.yaml 파일 수정",
      "eventRecordQPS: 0"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# 로그 관리 설정 확인
echo "Kubelet 로그 설정을 확인합니다..."
if [ -f /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf ]; then
    grep '--event-qps' /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf
elif [ -f /var/lib/kubelet/config.yaml ]; then
    cat /var/lib/kubelet/config.yaml | grep 'eventRecordQPS'
fi

# 설정 변경
echo "Kubelet 로그 설정을 강화합니다..."
# 필요한 명령어를 실행

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
