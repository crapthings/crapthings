#!/usr/bin/env bash

# Install Mongodb

function getMyIp () {
  curl ifconfig.me/ip
}

function generate_password () {
  openssl rand -base64 16
}

function install () {
  echo $1
  docker stop mongodb 2>/dev/null
  docker rm mongodb 2>/dev/null
  docker run --name mongodb \
    -e MONGO_INITDB_ROOT_USERNAME=root \
    -e MONGO_INITDB_ROOT_PASSWORD=$1 \
    -v $PWD/data/mongodb:/data/db \
    --network host \
    -d mongo
}

ip=$(getMyIp)
password=$(generate_password)

install $password

echo "username is root"
echo "password is ${password}"
echo "external: "
echo "mongodb://root:${password}@${ip}:27017/?authSource=admin"
echo "internal: "
echo "mongodb://root:${password}@localhost:27017/?authSource=admin"
