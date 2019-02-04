#!/bin/bash

# Stores the current CMake configuration of flowvr-ex, parflow and deps/netcdf-c as recipes.

mkdir -p cmake/flowvr-ex
cp -f ../flowvr-ex/build/CMakeCache.txt cmake/flowvr-ex/

mkdir -p cmake/parflow
cp -f ../parflow/build/CMakeCache.txt cmake/parflow/

T="$PWD/git-revisions"
echo ParFlowVR: > $T
cd ../parflow
git rev-parse HEAD >> $T
echo FlowVR: >> $T
cd ../flowvr-ex
git rev-parse HEAD >> $T
cd ../deps/netcdf-c
echo netcdf-c: >> $T
git rev-parse HEAD >> $T
