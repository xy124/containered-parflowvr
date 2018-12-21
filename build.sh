#!/bin/bash
set -e

docker build --pull -t xy124/parflowvr-base:latest parflowvr-base

docker build -t parflowvr-run --build-arg userid=$(id -u $USER) .

