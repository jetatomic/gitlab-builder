FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y ca-certificates curl apt-transport-https software-properties-common \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  && apt-get update \
  && apt-cache policy docker-ce \
  && apt-get install -y docker-ce \
  && docker info | grep Storage

#  && echo 'DOCKER_CONF=\"--storage-driver=aufs\"' >> /etc/default/docker \

# Cleanup
RUN apt-get clean
