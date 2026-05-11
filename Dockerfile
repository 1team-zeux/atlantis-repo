# 아틀란티스 공식 이미지 기반 (가볍고 안정적인 alpine 버전)
FROM runatlantis/atlantis:latest

# 루트 권한으로 도구 설치
USER root

# AWS CLI 및 필요한 유틸리티 설치
RUN apk add --no-cache \
    python3 \
    py3-pip \
    curl \
    unzip \
    && pip3 install --upgrade pip \
    && pip3 install awscli

# (선택) 특정 버전의 테라폼이 필요하다면 여기서 추가 설치 가능
# 기본적으로 아틀란티스 이미지에 최신 버전이 포함되어 있습니다.

# 다시 atlantis 사용자로 전환 (보안 권한 준수)
USER atlantis

# 아틀란티스가 데이터를 저장할 디렉토리 설정
WORKDIR /home/atlantis

# 실행 명령어는 부모 이미지의 것을 그대로 따름