#!/bin/bash
echo "Deploying..."

if [ "$DOCKER_NAME" != "" ];
then
  # only log in automatically when env variables are set...
  echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_NAME" --password-stdin
fi

docker run --rm -d parflowvr-base --name parflowvr-base
docker tag parflowvr-base xy124/parflowvr-base:latest
docker push xy124/parflowvr-base:latest
