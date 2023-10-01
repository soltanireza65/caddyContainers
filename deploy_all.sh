#!/bin/bash

DEPLOY_MODE=$1

git pull

# add app to list
[ ! -d "apps/profile" ] && git clone git@github.com:pondersource/solidProfileEditor.git apps/profile

# add app to list
git --git-dir=apps/profile/.git --work-tree=./apps/profile pull origin main

docker volume create caddy_data
docker volume create portainer_data

sudo docker compose up -d --build