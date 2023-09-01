#!/bin/bash


APP_NAME=$1
DEPLOY_MODE=$2
REPOURI=""

git pull

docker volume create caddy_data
docker volume create portainer-data

deployApp() {
    case $APP_NAME in
        profile)
            [ ! -d "apps/profile" ] && git clone git@github.com:pondersource/solidProfileEditor.git apps/profile
            git --git-dir=apps/profile/.git --work-tree=./apps/profile pull origin main
            if [ "$DEPLOY_MODE" == "--clean" ]; then
                sudo docker stop profile
                sudo docker rm profile
            fi
            sudo docker compose up -d --build profile
            ;;

        *)
            echo -n "unknown";;
    esac
}

deploySingle() {
    [ ! -d "apps/$APP_NAME" ] && git clone git@github.com:pondersource/solidProfileEditor.git apps/profile
}

deployApp