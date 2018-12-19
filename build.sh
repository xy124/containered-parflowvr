#!/bin/bash
set -e

docker build -t parflowvr-deps parflowvr-deps
docker build -t parflowvr-run --build-arg userid=$(id -u $USER) .

