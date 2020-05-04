#! /bin/bash

# Docker
apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" > /etc/apt/sources.list.d/docker-ce.list
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
systemctl enable --now docker containerd

# Download docker-compose (**NOTE**: Check for newest version at https://github.com/docker/compose/releases)
#   If there is a new release, update line below
curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Test docker-ce
docker run --rm hello-world

# Test docker machine
docker --version

# Test docker-compose
docker-compose --version

# Removing hello-world image
docker rmi hello-world:latest > /dev/null
