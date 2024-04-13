#!/bin/bash

# 변수 초기화
{
  "분류": "Host OS",
  "코드": "7.2",
  "위험도": "중요도 하",
  "진단_항목": "인증서 파일 권한 설정",
  "대응방안": {
    "설명": "Kubernetes는 SSL/TLS 구성을 통한 네트워크상 DATA 보호 및 사용자 인증을 위해 많은 인증서를 사용합니다. 해당 인증서와 인증서가 포함된 디렉터리가 root 사용자/그룹이 소유권을 가지고 있고 root 외 다른 사용자가 이 파일 및 디렉터리에 접근할 수 없도록 파일의 권한을 제한하여 파일의 무결성을 유지하여야 합니다.",
    "진단방법": [
      "1) 'ps -ef | grep kubelet' 실행 후 '-client-ca-file' 인자 사용하는 설정 파일 확인",
      "2) 해당 파일 소유권 및 그룹 권한 확인: 'stat -c %a <client ca인증서 파일>', 'stat -c %U:%G <client ca인증서 파일>'"
    ],
    "설정방법": [
      "chmod 644 <client ca인증서 파일>",
      "chown root:root <client ca인증서 파일>"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# 인증서 파일 권한 검사 및 적용
echo "Kubelet의 인증서 파일 권한을 검사 및 적용합니다..."
# 파일 권한 검사
client_ca_file="<client ca인증서 파일>" # 이 부분을 실제 파일 경로로 대체하세요.
if [ -f $client_ca_file ]; then
    stat -c %a $client_ca_file
    stat -c %U:%G $client_ca_file
fi

# 설정 변경
echo "Kubelet의 인증서 파일 권한을 강화합니다..."
chmod 644 $client_ca_file
chown root:root $client_ca_file

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
