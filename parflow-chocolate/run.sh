#!/bin/bash
docker run -it --rm --name parflow-chocolate-run \
  -v $PWD/shared:/home/docker/shared \
  parflow-chocolate /bin/bash
