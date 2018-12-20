# Use an official Python runtime as a parent image
FROM ubuntu:18.04

# Set the working directory to /app

# Install any needed packages specified in requirements.txt
#RUN apt-get install openmpi-bin openmpi-common openmpi-doc libopenmpi-dev libboost1.62-all-dev libqt4-dev libqt4-dev-bin qt4-default libhdf5-dev libhypre-2.11.1 lib
#RUN pip install --trusted-host pypi.python.org -r requirements.txt

RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

RUN apt-get -qq update

RUN apt-get -y install sudo apt-utils

RUN sudo apt-get install -y \
 gfortran \
 psmisc \
 nano \
 vim \
 git \
 bc \
 autoconf \
 openmpi-bin openmpi-doc libopenmpi-dev openmpi-common \
 libcurl4-gnutls-dev \
 libhypre-dev \
 libsilo-bin libsilo-dev \
 libhdf5-openmpi-dev libhdf5-openmpi-100 hdf5-helpers \
 libpnetcdf-dev \
 tcl-dev tk-dev \
 build-essential gcc g++ make cmake cmake-curses-gui python2.7 python2.7-dev openssh-server openssh-client \
 python2.7-numpy python-pip \
 hwloc libhwloc-dev

 #libnetcdf-dev - install from source!
 #needed to control mapping of flowvr sharedmemory segments, daemons and modules.

RUN sudo pip install matplotlib pandas netCDF4

RUN sudo apt-get install -y swig

#openmpi. required for .netMPI plugin (high performance network support)


RUN echo ""
RUN echo "Installing graphics dependencies (tools and examples)."
RUN echo ""
# Graphics (fluid, primes examples..)
RUN sudo apt-get install -y \
 libxi-dev \
 libxmu-dev \
 freeglut3 \
 mesa-common-dev \
 freeglut3-dev

RUN echo ""
RUN echo "Installing flowvr-glgraph dependencies."
RUN echo ""
# FlowVR-glgraph dependencies (Qt4, graphviz)
RUN sudo apt-get install -y \
 libxml2-dev libxml2 \
 libxslt1.1 libxslt1-dev \
 libgraphviz-dev graphviz \
 qt4-default

# low: install netcdf4 from source with cmake in global install dir!
# TODO sudo problem:
#$ sudo oma
#sudo: no tty present and no askpass program specified
# TODO: install visit
