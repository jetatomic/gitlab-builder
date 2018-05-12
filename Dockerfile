FROM dorowu/ubuntu-desktop-lxde-vnc

RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y ca-certificates curl apt-transport-https software-properties-common linux-image-extra-`uname -r` linux-image-extra-virtual aufs-tools wget \
  && wget -qO- https://get.docker.com/ | sh
#  && echo 'DOCKER_CONF=\"--storage-driver=aufs\"' >> /etc/default/docker
#  && docker info | grep Storage

# Cleanup
RUN apt-get clean
