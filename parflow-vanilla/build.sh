#!/bin/bash
set -e
mkdir -p shared

docker pull xy124/parflowvr-base:latest

docker build -t parflow-vanilla --build-arg userid=$(id -u $USER) .

