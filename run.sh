#!/bin/bash
if [ "$1" == "test" ];
then
  echo running in test mode...
  podman run \
    --rm \
    --name parflowvr-run-test \
    -v $PWD/dockerhome:/home/docker \
    parflowvr-run /bin/bash -c "/home/docker/recipes/build-from-recipes.sh && /home/docker/test.sh"
else
  echo running ...
  # use seccomp=unconfined to be able to use gdb in it for debugging.
  podman run \
    --network=host \
    -e DISPLAY=unix$DISPLAY \
    --privileged \
    --name parflowvr-run \
    -d -i \
    -v $PWD/dockerhome:/home/docker \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --security-opt seccomp=unconfined \
    -p 5600-6000:5600-6000 \
    -v /usr/lib/nvidia-340:/usr/lib/nvidia-340 -v /usr/lib32/nvidia-340:/usr/lib32/nvidia-340 --device /dev/dri \
    parflowvr-run
fi


