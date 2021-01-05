#!/bin/bash
set -e

#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
# DOCKER
echo '--> Updating list of packages...'
sudo apt update

echo '--> Installing a few prerequisite packages'
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common

echo '--> Adding the GPG key for the official Docker repository'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo '--> Adding the Docker repository to APT sources'
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

echo '--> Updating the package database with the Docker packages from the newly added repo'
sudo apt update

echo '--> Making sure you are about to install from the Docker repo instead of the default Ubuntu repo'
apt-cache policy docker-ce

echo '--> Installing Docker'
sudo apt -y install docker-ce

echo '--> Checking docker'
docker ps


# DOCKER-COMPOSE
#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04

echo '--> Downloading release and saving the executable file'
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo '--> Setting docker-compose executable'
sudo chmod +x /usr/local/bin/docker-compose

echo '--> Checking Docker-compose version'
docker-compose --version

