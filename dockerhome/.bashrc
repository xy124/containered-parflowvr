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



export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib
# to let flowvr find libcgraph to build flowvr-glgraph
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu

# The following environment variables are needed during runtime
export PATH=$PREFIX/bin:$HOME/visit2_13_3.linux-x86_64/bin:$HOME/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$PREFIX/lib64:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$PREFIX/lib64/pkgconfig:$PKG_CONFIG_PATH

export PARFLOW_DIR=$PREFIX

# Actually this line is not necessary if one would enforce resourcing of bashrc after installing flowvr
export PYTHONPATH=$PYTHONPATH:$HOME/install/lib/flowvr/python

export PYTHONPATH=$PYTHONPATH:$HOME/install/lib/python2.7rc1
export PYTHONPATH=$PYTHONPATH:$HOME/visit2_13_3.linux-x86_64/2.13.3/linux-x86_64/lib/site-packages

# libsim needs to find libvisit
export DYLD_LIBRARY_PATH=$HOME/visit2_13_3.linux-x86_64/2.13.3/linux-x86_64/lib


export OMPI_MCA_btl="^vader"


# Activate nvidia graphics driver for visit use in the contianer
# (see https://github.com/jessfraz/dockerfiles/issues/253)
export PATH=/usr/lib/nvidia-340/bin:${PATH}
export LD_LIBRARY_PATH=/usr/lib/nvidia-340:/usr/lib32/nvidia-340:${LD_LIBRARY_PATH}
