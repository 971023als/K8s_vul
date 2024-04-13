#!/bin/bash

# 변수 초기화
{
  "분류": "Kubelet Configuration",
  "코드": "6.3",
  "위험도": "중요도 상",
  "진단_항목": "SSL/TLS 적용",
  "대응방안": {
    "설명": "Kubernetes에서는 SSL/TLS를 이용하여 네트워크상의 DATA 보호 및 각 구성요소에 접하는 클라이언트에 대한 검증을 위해 사용할 수 있습니다. SSL/TLS 통신 적용을 통해 네트워크 스니핑과 같은 방법으로 주요 정보가 노출되어 다른 공격에 이용되지 않도록 하고, API server에 접근하는 대상에 대해 검증할 수 있도록 설정하여야 합니다. 또한 SSL/TLS 통신 적용 시에는 주기적으로 인증서를 변경하고 안전한 버전의 암호화 방식을 사용하는 방법을 통해 위험을 최소화할 수 있는 정책 설정이 필요합니다.",
    "설정방법": [
      "1-1) kublet service 파일 사용하는 경우: /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf 파일 내 --client-ca-file=<client ca인증서 위치> 설정",
      "1-2) kubelet config 파일 사용하는 경우: /var/lib/kubelet/config.yaml 파일 내 authentication: x509: clientCAFile: client CA 파일 경로 설정",
      "인증서 관리(Kubelets): 1-1) /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf 파일 내 --tls-cert-file=<tls인증서 위치>, --tls-private-key-file=<tls키 파일 위치> 설정, 1-2) /var/lib/kubelet/config.yaml 파일 내 tlsCertFile: tls인증서 위치, tlsPrivateKeyFile: tls키 파일 위치 설정",
      "안전한 SSL/TLS 버전 사용: 1-1) /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf 파일 내 --tls-ciphersuites=<안전한 암호화 알고리즘 설정>, 1-2) /var/lib/kubelet/config.yaml 파일 내 TLSCipherSuites: <안전한 암호화 알고리즘 설정>"
    ]
  },
  "현황": [],
  "진단_결과": ""
}


# SSL/TLS 설정 확인 및 강화
echo "Kubelet SSL/TLS 설정을 확인 및 강화합니다..."
if [ -f /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf ]; then
    grep '--client-ca-file' /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf
    grep '--tls-cert-file' /usr/lib/systemd/system/kublet.service.d/10-kubeadm.conf
fi
if [ -f /var/lib/kubelet/config.yaml ]; then
    cat /var/lib/kubelet/config.yaml | grep 'clientCAFile'
    cat /var/lib/kubelet/config.yaml | grep 'tlsCertFile'
fi

# 설정 변경
echo "Kubelet SSL/TLS 설정을 강화합니다..."
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
