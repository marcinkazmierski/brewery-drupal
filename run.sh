#!/bin/sh

docker-compose up -d

sleep 3
xdg-open http://localhost:8631/
docker-compose exec app bash