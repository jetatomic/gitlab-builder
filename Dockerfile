FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y sudo nano apt-transport-https ca-certificates curl software-properties-common \
#  && useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
  && adduser --disabled-password --gecos '' docker \
  && adduser docker sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
  && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  && sudo apt-get update \
  && sudo apt-cache policy docker-ce \
  && sudo apt-get install -y docker-ce

# Cleanup
RUN apt-get clean
