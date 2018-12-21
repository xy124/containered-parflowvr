#!/bin/bash
# This script should only be used within travis-ci !

$(git diff --name-only ${TRAVIS_COMMIT_RANGE} | grep parflowvr-base/Dockerfile > /dev/null)
dockerfile_status=$?

set -e
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_NAME" --password-stdin

if [[ ${dockerfile_status} == "0" ]]
then
  echo "New docker image is required, building new image"
  ./build.sh
else
  echo "New docker image is not required. Pulling it from dockerhub."
  ./build.sh fast
fi
