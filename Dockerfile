# Use Maven 3.9.0 with JDK 17 as the base image
FROM maven:3.9.0-jdk-17

# Update system and install curl
RUN apt-get update && \
    apt-get install -y curl

# Download and install Maven 3.9.2
RUN curl -O https://dlcdn.apache.org/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz && \
    tar -zxvf apache-maven-3.9.2-bin.tar.gz -C /usr/share/ && \
    ln -s /usr/share/apache-maven-3.9.2/bin/mvn /usr/bin/mvn && \
    rm apache-maven-3.9.2-bin.tar.gz

# Use Maven as the default command
CMD ["mvn"]
