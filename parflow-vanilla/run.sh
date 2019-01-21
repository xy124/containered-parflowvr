#!/bin/bash
docker run -it --rm --name parflow-vanilla-run \
  -v $PWD/shared:/home/docker/shared \
  parflow-vanilla /bin/bash
