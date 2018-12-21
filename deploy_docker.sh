#!/bin/bash
echo "Deploying..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_NAME" --password-stdin
docker run --rm -d parflowvr-deps --name parflowvr-deps
docker tag parflowvr-deps docker.io/xy124/parflowvr-deps
docker push docker.io/xy124/parflowvr-deps
