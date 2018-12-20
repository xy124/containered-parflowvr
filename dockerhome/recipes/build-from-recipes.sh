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
cd $HOME/deps
project="netcdf-c"
if [ ! -d "$project" ];
then
	git clone "https://github.com/Unidata/netcdf-c" --depth=1
fi
cd $project
cd $HOME/deps/$project
mkdir -p build
cd build
cp -f ../../../recipes/cmake/$project/CMakeCache.txt .
cmake ..
make install -j$N

cd $HOME

if [ ! -d "parflow" ];
then
	git clone https://github.com/xy124/parflow.git
	cd parflow
	git checkout melissa
fi

for project in flowvr-ex parflow;
do
	cd $HOME/$project
	mkdir -p build
	cd build
	cp -f ../../recipes/cmake/$project/CMakeCache.txt .
	cmake ..
	make install -j$N
done

