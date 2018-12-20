#!/bin/bash
if [ "$1" == "test" ];
then
  echo running in test mode...
  docker run \
    --rm \
    --name parflowvr-run-test \
    -v $PWD/dockerhome:/home/docker \
    parflowvr-run /bin/bash -c "/home/docker/recipes/build-from-recipes.sh && /home/docker/test.sh"
else
  echo running ...
  docker run \
    -e DISPLAY=$DISPLAY \
    --name parflowvr-run \
    -d -i \
    -v $PWD/dockerhome:/home/docker \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    parflowvr-run
fi
