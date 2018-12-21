#!/bin/bash
# Builds all images. If fast is given as command line argument it will pull the latest
# parflowvr-base image from dockerhub. This saves a lot of build time.
set -e

if [ "$1" == "fast" ];
then
  docker pull xy124/parflowvr-base:latest
else
  docker build --pull -t xy124/parflowvr-base:latest parflowvr-base
fi

docker build -t parflowvr-run --build-arg userid=$(id -u $USER) .

