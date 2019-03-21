FROM xy124/parflowvr-base:latest


ENV PREFIX /home/docker/install
ENV PARFLOW_DIR /home/docker/install

# reset home dir of root user to /home/docker
RUN sed -i -e 's/\/root/\/home\/docker/g' /etc/passwd

VOLUME /home/docker
WORKDIR /home/docker

CMD ["bash"]

