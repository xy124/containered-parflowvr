#!/bin/bash
set -e

docker build -t xy124/parflowvr-deps:latest parflowvr-deps

docker build -t parflowvr-run --build-arg userid=$(id -u $USER) .

