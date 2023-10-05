#!/bin/bash

DEPLOY_MODE=$1

git pull

docker pull soltanireza65/me.rezasoltani.info:latest

docker volume create caddy_data
docker volume create portainer_data

sudo docker compose up -d --build