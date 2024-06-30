#!/bin/bash

docker-compose up -d --force-recreate
docker exec -i tidal-connect bash -c "echo 'deb http://legacy.raspbian.org/raspbian/ stretch main contrib non-free rpi firmware' > /etc/apt/sources.list && apt update && apt install libasound2-plugins -y"
docker-compose logs -f
