echo Welcome!
export TERM=xterm

export PREFIX=$HOME/install

source $HOME/install/bin/flowvr-suite-config.sh

export PYTHON="python2.7"

export MPICC=`which mpicc`
export MPICXX=`which mpicxx`
export MPIF90=`which mpif90`
export WGET="wget -c --no-check-certificate"
export N=4



# The following environment variables are needed during runtime
export PATH=$PREFIX/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$PREFIX/lib64:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$PREFIX/lib64/pkgconfig:$PKG_CONFIG_PATH

export PARFLOW_DIR=$PREFIX

export PYTHONPATH=$PYTHONPATH:$HOME/install/lib/python2.7rc1
