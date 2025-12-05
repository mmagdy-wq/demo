# ====== Stage 1: Build the application using Maven ======
FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /app

# Copy only pom.xml first to leverage Docker cache
COPY pom.xml .

# Download dependencies (cached)
RUN mvn -B dependency:go-offline

# Copy the rest of the project
COPY src ./src

# Build the jar
RUN mvn -B clean package -DskipTests


# ====== Stage 2: Run the application using tiny JRE ======
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copy the built jar from stage 1
COPY --from=builder /app/target/*.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]