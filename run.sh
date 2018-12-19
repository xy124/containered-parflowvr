#!/bin/bash
docker run -e DISPLAY=$DISPLAY --name parflowvr-run -d -i -v $PWD/dockerhome:/home/docker -v /tmp/.X11-unix:/tmp/.X11-unix parflowvr-run
