# Use an official Java image as the base image
FROM openjdk:14-jdk-alpine

# Set the environment variables
ENV CHATBOT_NAME=GreetingsBot
ENV CHATBOT_DEFINITION=

# Install Git
RUN apk add git maven

# Set the working directory in the image
WORKDIR /app

# Clone your repository
RUN git clone https://github.com/joszamama/xatkit-main.git

# Set the working directory to the cloned repository
WORKDIR /app/xatkit-main

# Build the project using Maven
RUN git submodule update --init --recursive
RUN mvn clean install -DskipTests

# Set the working directory to the example project
WORKDIR /app/xatkit-main/xatkit-examples/GreetingsBots/GreetingsBot
RUN mvn clean compile

# Specify the command to run the compiled application
CMD ["sh", "-c", "mvn exec:java -e -Dexec.mainClass=\"com.xatkit.example.${CHATBOT_NAME}\""]