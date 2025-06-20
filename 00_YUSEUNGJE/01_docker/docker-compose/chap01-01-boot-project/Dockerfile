# OpenJDK 17이 설치된 Alpine Linux 이미지를 기반으로 한다.
FROM openjdk:17-alpine

# 빌드된 JAR 파일을 컨테이너의 루트 디렉토리에 app.jar로 복사한다.
COPY build/libs/*.jar app.jar

# 컨테이너 시작 시 app.jar 파일을 실행하는 명령을 설정한다.
ENTRYPOINT ["java", "-jar", "app.jar"]