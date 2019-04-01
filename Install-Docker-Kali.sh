#!/bin/bash

# Helpful Link: https://medium.com/@airman604/installing-docker-in-kali-linux-2017-1-fbaa4d1447fe

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get remove docker docker-engine docker.io
apt-get install docker-ce docker-compose
docker run hello-world
systemctl enable docker
docker rmi -f hello-world:latest > /dev/null
