# containered-parflowvr
*ParFlowVR in containers!*

[![Travis build icon](https://travis-ci.com/xy124/containered-parflowvr.svg?branch=master)](https://travis-ci.com/xy124/containered-parflowvr)

This project is used to install parflow with FlowVR extension (parFlowVR) comfortably
into a docker environment

## HowTo:
**tested on ubuntu 16**

1. install docker
```bash
sudo apt-get install docker.io
sudo groupadd docker
sudo usermod -aG docker $USER
```
now log out and in again and check that you are in the docker group (`id`)
Also check that your docker API version is at least 1.25 (`docker version`).

2. clone this repository and run the build script. The build script will take some time
(up to hours depending on your internet connection and hard drive speed)
```bash
git clone https://github.com/xy124/containered-parflowvr.git
cd containered-parflowvr
./build.sh fast
```

3. run the built image to create the container (only needed to be done once after build)
```bash
./run.sh
```

4. connect into the container
```bash
./connect.sh
```
  - **All data stored to folders other than /home/docker in the container will be deleted if the container is deleted.**
  - **The dockerhome/ dir is common between the container and the host machine. In the container it is mounted as /home/docker**


you should now be in the docker container having a shell prompt that looks like this:
```bash
docker@410aef2ef73e:~$
```

5. install the last things in the docker container (netcdf-c, flowvr-ex, parflow)
```bash
cd /home/docker/recipes
./build-from-recipes.sh
```
Before running the testcases you need to log out and in again so that the just
installed envrionment scripts for flowvr will be loaded.

6. Here you are! Play the testcases:
```bash
cd /home/docker/parflow/flowvr/testcases/netcdfwriter
./do.sh
```
or
```
cd /home/docker/parflow/flowvr/testcases/steering-Python
./do.sh
```

Bonus: Start/Stop the container (on the host)
```bash
./start.sh
./stop.sh
```

## Compile and install own versions of parflow / flowvr-ex
- we assume you are on the docker container
- parflow code is in /home/docker/parflow
- flowvr-ex code is in /home/docker/flowvr-ex
- to build:
  - go to the code dir (/home/docker/{parflow|flowvr-ex})
  - go into the build dir
  - _optional:_ if you want to reconfigure with cmake: `ccmake ..`
    - remember to keep the **CMAKE_INSTALL_PREFIX=/home/docker/install** intact!
  - to compile and install: `make install -j$N`

## Troubleshooting
- ./stop.sh, ./start.sh, ./run.sh
- sudo systemctl restart docker
- killall dockerd
- docker rm parflowvr-run
- Installing docker on debian can be more complicated. Sometimes manually downloading the docker.deb files helps.

### build - run - start - stop
- build.sh builds the docker container image without running it
- run.sh initializes a docker container and starts it
- stop.sh stops a docker container
- start.sh starts a stopped docker container

In general it is enough to call build.sh and run.sh once. If something went wrong or you just want to stop
the docker container to have e.g. more RAM available execute ./stop.sh
To start it later again: use ./start.sh


## Container structure
- An image (parflow-base) is created on build containing ubuntu with all the necessary dependencies
installable through the package manager
- On top of this an other Dockerfile creates the image parflowvr-run which then is instantiated in the run.sh script.
- This allows to change settings and other stuff without reinstalling all the packages again.
