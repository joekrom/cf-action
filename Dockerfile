# Download base image ubuntu 22.04
FROM ubuntu:22.04

# LABEL about the custom image
LABEL maintainer="joel.dfankam@yahoo.fr"
LABEL version="0.1"
LABEL description="This is a custom Docker Image for cloud foundry github action"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive
# Update Ubuntu Software repository
RUN sudo apt update
RUN sudo apt upgrade -y
# Install wget and gnupg
RUN sudo apt-get update && apt-get install -y wget gnupg
#Add the Cloud Foundry Foundation public key and package repository to your system by
wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -
# Add Cloud Foundry CLI repository
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
# install client cloud foundry
RUN apt install cf8-cli

COPY entrypoint.sh /entrypoint.sh
# change permission to execute the script and
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
