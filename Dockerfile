# Use an official Ubuntu base image
FROM ubuntu:latest

# Labels for the Dockerfile
LABEL maintainer="adam.g.lowery@gmail.com"
LABEL description="DevSecOps Networking and Security Tools Container"

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install networking and security tools
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nmap \
    tshark \
    metasploit-framework \
    nikto \
    sqlmap \
    openssl \
    iputils-ping \
    net-tools \
    curl \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Additional setup or configuration commands here

# Set the default command or entry point
CMD ["/bin/bash"]
