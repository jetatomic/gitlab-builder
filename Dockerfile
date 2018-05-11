FROM ubuntu:16.04

# Install things
RUN apt-get update && apt-get install -y \

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce

# Cleanup
RUN apt-get clean
