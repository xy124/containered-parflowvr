#!/bin/bash

# Stores the current CMake configuration of flowvr-ex, parflow and deps/netcdf-c as recipes.

mkdir -p cmake/flowvr-ex
cp -f ../flowvr-ex/build/CMakeCache.txt cmake/flowvr-ex/

mkdir -p cmake/parflow
cp -f ../parflow/build/CMakeCache.txt cmake/parflow/

mkdir -p cmake/netcdf-c
cp -f ../deps/netcdf-c/build/CMakeCache.txt cmake/netcdf-c/
