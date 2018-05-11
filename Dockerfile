FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y wget \
  && wget -qO- https://get.docker.com/ | sh

# Cleanup
RUN apt-get clean
