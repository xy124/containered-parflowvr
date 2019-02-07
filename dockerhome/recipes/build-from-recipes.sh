#!/bin/bash
# This script will install flowvr and parflow
set -e

if [ "$HOME" != "/home/docker" ]
then
	echo This script must be run as docker user in a docker container!
	exit 1
fi

cd $HOME

if [ ! -d "flowvr-ex" ];
then
	git clone https://gitlab.inria.fr/flowvr/flowvr-ex.git
	cd flowvr-ex
	git checkout dev
fi

# install netcdf-c
mkdir -p $HOME/deps
cd $HOME/deps
project="netcdf-c"
if [ ! -d "$project" ];
then
	git clone "https://github.com/Unidata/netcdf-c" --depth=1
fi
cd $project
cd $HOME/deps/$project
autoreconf -i
mkdir -p build
cd build
CPPFLAGS=-I/usr/lib/x86_64-linux-gnu/hdf5/openmpi/include \
LDFLAGS=-L/usr/lib/x86_64-linux-gnu/hdf5/openmpi/lib \
CC=mpicc ../configure --enable-netcdf-4 \
--with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/openmpi --prefix=$HOME/install
make -j$N
make install

cd $HOME

if [ ! -d "parflow" ];
then
	git clone https://github.com/xy124/parflow.git
	cd parflow
	git checkout parFlowVR
fi

cd $HOME
wget -c http://portal.nersc.gov/project/visit/releases/2.13.3/visit2_13_3.linux-x86_64-ubuntu18.tar.gz
tar -xvf visit2_13_3.linux-x86_64-ubuntu18.tar.gz
cd

for project in flowvr-ex parflow;
do
	cd $HOME/$project
	mkdir -p build
	cd build
	cp -f ../../recipes/cmake/$project/CMakeCache.txt .
	cmake ..
	make install -j$N
done

# generate keypair to login without password
if [ ! -d "$HOME/.ssh/id_rsa" ]
then
	ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
	cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
fi


