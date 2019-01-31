#!/bin/bash
set -e

git clone https://github.com/parflow/parflow.git
cd parflow
mkdir build
cd build
cmake .. \
  -DCMAKE_INSTALL_PREFIX:PATH=$PARFLOW_DIR \
  -DPARFLOW_AMPS_LAYER:STRING=mpi1 \
  -DPARFLOW_AMPS_SEQUENTIAL_IO:BOOL=ON \
  -DPARFLOW_ENABLE_HYPRE:BOOL=ON \
  -DPARFLOW_HAVE_CLM:BOOL=ON \
  -DPARFLOW_AMPS_SEQUENTIAL_IO:BOOL=ON

make install -j9
