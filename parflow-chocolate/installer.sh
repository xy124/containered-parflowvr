#!/bin/bash
set -e

export N=3

# Remove old versions...
rm -rf parflow
rm -rf install

mkdir deps
cd deps
git clone https://github.com/Unidata/netcdf-c.git --depth 1
cd netcdf-c
autoreconf -i
mkdir build
cd build
CPPFLAGS=-I/usr/lib/x86_64-linux-gnu/hdf5/openmpi/include \
LDFLAGS=-L/usr/lib/x86_64-linux-gnu/hdf5/openmpi/lib \
CC=mpicc ../configure --enable-netcdf-4 \
--with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/openmpi && make -j$N
make -j$N
sudo make install

cd

git clone https://github.com/xy124/parflow.git
cd parflow
mkdir build
cd build
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$PARFLOW_DIR \
  -DPARFLOW_AMPS_LAYER=mpi1 \
  -DPARFLOW_ENABLE_HYPRE=ON \
  -DPARFLOW_ENABLE_NETCDF=ON \
  -DPARFLOW_HAVE_CLM=ON
make install -j$N


