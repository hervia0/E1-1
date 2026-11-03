# 기존 베이스: 공식 NGINX 경량 이미지
FROM nginx:alpine

# 커스텀 1: 작성자 정보
LABEL maintainer="hervia"

# 커스텀 2: 기본 페이지를 내 정적 콘텐츠로 교체
COPY app/ /usr/share/nginx/html/

# 커스텀 3: 사용하는 포트 문서화
EXPOSE 80

# 커스텀 4: 헬스체크 (웹 서버 응답 확인)
HEALTHCHECK --interval=30s --timeout=3s CMD wget -q -O /dev/null http://localhost/ || exit 1
