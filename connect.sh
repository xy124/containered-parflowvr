#!/bin/bash
docker exec -i \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -t parflowvr-run \
  /bin/bash
