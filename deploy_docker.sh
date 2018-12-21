#!/bin/bash
echo "Deploying..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_NAME" --password-stdin
docker run --rm -d parflowvr-base --name parflowvr-base
docker tag parflowvr-base xy124/parflowvr-base:latest
docker push xy124/parflowvr-base:latest
