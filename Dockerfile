# Use OpenJDK 17 as the base image
FROM openjdk:17

# Update system and install curl and AWS CLI
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl "https://d1wn8e93y1gh8o.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm awscliv2.zip

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Use Maven as the default command to run when the container starts
CMD ["mvn", "-version"]
