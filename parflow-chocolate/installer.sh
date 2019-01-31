#!/bin/bash
export N=3
git clone https://github.com/Unidata/netcdf-c.git --depth 1
cd netcdf-c
mkdir build
cd build
CPPFLAGS=-I/usr/lib/x86_64-linux-gnu/hdf5/openmpi/include \\
LDFLAGS=-L/usr/lib/x86_64-linux-gnu/hdf5/openmpi/lib \\
CC=mpicc ../configure --enable-netcdf-4 --prefix=$PARFLOW_DIR \\
--with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/openmpi && make -j$N
make install
cd
git clone https://github.com/xy124/parflow.git
mkdir build
cd build
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$PARFLOW_DIR \
  -DPARFLOW_AMPS_LAYER=mpi1 \
  -DPARFLOW_ENABLE_HYPRE=ON \
  -DPARFLOW_ENABLE_NETCDF=ON \
  -DPARFLOW_HAVE_CLM=ON
make install -j$N


