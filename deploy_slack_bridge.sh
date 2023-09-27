#!/bin/bash

# PWD=$(pwd)
# export PWD=$PWD

# DEPLOY_MODE=$1


git pull

[ ! -d "apps/solid-slack-bridge" ] && git clone https://github.com/pondersource/solid-slack-bridge apps/solid-slack-bridge

git --git-dir=apps/solid-slack-bridge/.git --work-tree=./apps/solid-slack-bridge pull origin main


docker volume create caddy_data
docker volume create portainer-data

sudo docker compose up -d solid-slack-bridge --build