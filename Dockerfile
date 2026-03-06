# Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application - skip tests to speed up the build on Render
RUN mvn clean package -DskipTests

# Stage 2: Create a lightweight image for running the application
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port
EXPOSE 8084

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
