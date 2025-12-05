FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY target/demo-0.0.1.jar /app

ENTRYPOINT ["java"]
CMD ["-jar","demo-0.0.1.jar"]