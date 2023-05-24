# Use an official Java runtime as the base image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the executable JAR file to the container
COPY target/ExamThourayaS2-0.0.1-SNAPSHOT.jar ExamThourayaS2-0.0.1-SNAPSHOT.jar

COPY src/main/resources/application.properties application.properties

# Expose the port on which your application listens
EXPOSE 8088

# Set the entry point to run your application
ENTRYPOINT ["java", "-jar", "ExamThourayaS2-0.0.1-SNAPSHOT.jar"]


