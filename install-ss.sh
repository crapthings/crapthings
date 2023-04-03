#!/usr/bin/env bash

# Install Docker

function clean_first () {
  docker stop shadowsocks 2>/dev/null
  docker rm shadowsocks 2>/dev/null
  echo "stop and remove shadowsocks"
}

function install () {
  echo $1 $2
  docker run -d -it \
    -e SERVER_PORT='8899' \
    -e METHOD='xchacha20-ietf-poly1305' \
    -e PASSWORD=$1 \
    -p $2:8899 \
    --name shadowsocks shadowsocks/shadowsocks-libev
}

function generate_password () {
  openssl rand -base64 16
}

clean_first || true

password=$(generate_password)

echo "input a port (default: 8899): "

read port

if [ -z "$port" ]; then
  port=8899
fi

install $password $port

echo "port is $port"
echo "password is $password"
