#!/bin/bash

# PWD=$(pwd)
# export PWD=$PWD

DEPLOY_MODE=$1


git pull

[ ! -d "apps/bookmarks" ] && git clone git@github.com:pondersource/solidBookmarker.git apps/bookmarks
[ ! -d "apps/profile" ] && git clone git@github.com:pondersource/solidProfileEditor.git apps/profile

# find . -type d -depth 2 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin main \;

git --git-dir=apps/bookmarks/.git --work-tree=./apps/bookmarks pull origin main
git --git-dir=apps/profile/.git --work-tree=./apps/profile pull origin main

if [ "$DEPLOY_MODE" == "--clean" ]; then
    sudo docker stop $(docker ps -a -q)
    sudo docker rm $(docker ps -a -q)
fi

docker volume create caddy_data
docker volume create portainer-data

sudo docker compose up -d --build