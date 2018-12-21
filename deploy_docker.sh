#!/bin/bash
echo "Deploying..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_NAME" --password-stdin
docker run --rm -d parflowvr-deps --name parflowvr-deps
docker tag parflowvr-deps xy124/parflowvr-deps:latest
docker push xy124/parflowvr-deps:latest
