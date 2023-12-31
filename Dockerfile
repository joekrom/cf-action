# Download base image ubuntu 22.04
FROM ubuntu:22.04

# LABEL about the custom image
LABEL maintainer="joel.dfankam@yahoo.fr"
LABEL version="0.1"
LABEL description="This is a custom Docker Image for cloud foundry github action"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive
# Update Ubuntu Software repository
RUN apt-get update
RUN apt-get upgrade -y
# Install wget and gnupg
RUN apt-get install -y wget gnupg sudo apt-utils
#Add the Cloud Foundry Foundation public key and package repository to your system by
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -
# Add Cloud Foundry CLI repository
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo  tee /etc/apt/sources.list.d/cloudfoundry-cli.list
# install client cloud foundry
RUN apt-get update
RUN apt-get install cf8-cli -y

COPY entrypoint.sh /entrypoint.sh
# change permission to execute the script and
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
