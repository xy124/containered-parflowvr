#!/bin/bash
set -e
source /home/docker/.bashrc
echo Running test....
cd /home/docker/parflow/flowvr/testcases/netcdfwriter
./do.sh
#cd /home/docker/parflow/flowvr/testcases/steering-Python
#./do.sh
