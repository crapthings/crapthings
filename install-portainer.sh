#!/usr/bin/env bash

# Install Portainer

# Prompt the user to enter a port number
echo "Please enter a port number (default: 9443): "

# Read the user input
read port

# Display the entered port number
echo "The entered port number is: $port"

if [ -z "$port" ]; then
  port=9443
fi

install()

function install () {
  docker volume create portainer_data
  docker run -d -p $port:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
  docker ps  
}
