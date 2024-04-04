# Use an official Ubuntu base image
FROM ubuntu:latest

# Labels for the Dockerfile
LABEL maintainer="adam.g.lowery@gmail.com"
LABEL description="DevSecOps Networking and Security Tools Container"

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install networking and security tools
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    nmap \
    tshark

RUN apt-get install -y \
    netcat \
    tcpdump \
    mtr

RUN apt-get install -y \
    nikto \
    sqlmap

RUN apt-get install -y \
    openssl \
    iputils-ping

RUN apt-get install -y \
    net-tools \
    curl \
    wget \
    git

# install metasploit
RUN wget http://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run

RUN chmod +x metasploit-latest-linux-x64-installer.run 

RUN apt-get install apache2 -y

RUN rm -rf /var/lib/apt/lists/*

WORKDIR var/www/html

COPY index.html index.html


#now start the server
CMD ["apachectl", "-D", "FOREGROUND"]
