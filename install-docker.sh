#!/usr/bin/env bash

# Install Docker

function install () {
  sudo apt-get update

  sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg

  sudo mkdir -m 0755 -p /etc/apt/keyrings

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update

  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

function checkDockerVersion () {
  clear

  echo "docker installed"

  docker --version
  docker compose version
}

install
checkDockerVersion
