# Use an official Eclipse Temurin runtime as a parent image
FROM eclipse-temurin:17-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the built jar file
COPY target/*.jar app.jar

# Expose the port the app runs on
EXPOSE 8084

# Run the jar file
ENTRYPOINT ["java","-jar","app.jar"]
