# Use an official Java image as the base image
FROM openjdk:14-jdk-alpine

# Install Git
RUN apk add git maven

# Set the working directory in the image
WORKDIR /app

# Copy the project files to the image
COPY . .

# Build the project using Maven
RUN git submodule update --init --recursive
RUN mvn clean install -DskipTests

# Set the working directory to the example project
WORKDIR /app/xatkit-examples/GreetingsBots/GreetingsBot
RUN mvn clean compile

# Specify the command to run the compiled application
CMD ["/bin/sh", "-c", "mvn exec:java -e -Dexec.mainClass=\"com.xatkit.example.GreetingsBot\""]