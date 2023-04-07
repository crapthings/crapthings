#!/usr/bin/env bash

port=61001
method=xchacha20-ietf-poly1305

# Install Docker

function getMyIp () {
  curl ifconfig.me/ip
}

function clean_first () {
  docker stop shadowsocks 2>/dev/null
  docker rm shadowsocks 2>/dev/null
  echo "stop and remove shadowsocks"
}

function install () {
  docker run -d -it \
    -e SERVER_PORT=8899 \
    -e METHOD=$1 \
    -e PASSWORD=$2 \
    -p $3:8899 \
    --name shadowsocks shadowsocks/shadowsocks-libev
}

function generate_password () {
  openssl rand -base64 16
}

clean_first

ip=$(getMyIp)
password=$(generate_password)

install $method $password $port

clear

echo "config\n"

echo "ip is $ip"
echo "port is $port"
echo "method is $method"
echo "password is $password"

echo "\npm2 config"

echo `pm2 delete ss-local && pm2 start --name "ss-local" ss-local -- -s $ip -p $port -l 1086 -k $password -m $method`
