#!/bin/bash
set -e
mkdir -p shared

docker build -t parflow-chocolate --build-arg userid=$(id -u $USER) .

