#!/bin/bash

#xhost +local:docker

docker exec -t parflowvr-run \
  sudo service ssh start
docker exec -i \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -t parflowvr-run \
   /bin/bash
