#!/bin/bash

# 변수 초기화
{
  "분류": "Host OS",
  "코드": "5.3",
  "위험도": "중요도 하",
  "진단_항목": "인증서 파일 권한 설정",
  "대응방안": {
    "설명": "Kubernetes는 네트워크상 데이터 보호와 사용자 인증을 위해 여러 인증서를 사용합니다. 이 인증서들은 반드시 보호되어야 하며, 접근 권한은 엄격하게 제한되어야 합니다.",
    "설정방법": [
      "PKI 인증 디렉터리의 소유권을 root 사용자/그룹에게 설정: chown -R root:root /etc/kubernetes/pki/",
      "PKI 인증서 파일의 권한을 읽기 전용으로 설정: chmod -R 644 /etc/kubernetes/pki/*.crt",
      "PKI 키 파일의 권한을 root 사용자만 수정 가능하도록 설정: chmod -R 600 /etc/kubernetes/pki/*.key"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# 인증서 파일 권한 확인
echo "인증서 파일의 권한을 확인합니다..."
ls -laR /etc/kubernetes/pki/*.crt
ls -laR /etc/kubernetes/pki/*.key

# 파일 권한 설정
chown -R root:root /etc/kubernetes/pki/
chmod -R 644 /etc/kubernetes/pki/*.crt
chmod -R 600 /etc/kubernetes/pki/*.key

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
