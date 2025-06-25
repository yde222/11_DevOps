FROM --platform=linux/amd64 eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY build/libs/*jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]