FROM xy124/parflowvr-base:latest

ARG userid=1000
RUN export uid=$userid gid=$userid && \
    mkdir -p /home/developer && \
    echo "docker:x:${uid}:${gid}:Docker,,,:/home/docker:/bin/bash" >> /etc/passwd && \
    echo "docker:x:${uid}:" >> /etc/group && \
    echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer
# id -u hostusername --> 30601
#RUN useradd -u $userid docker
#RUN echo "docker:docker" | chpasswd

RUN adduser docker sudo

WORKDIR /home/docker
ADD ./installer.sh .
VOLUME /home/docker/shared
RUN chown -R docker:docker /home/docker

USER docker

ENV PREFIX /home/docker/install
ENV PARFLOW_DIR /home/docker/install

RUN chmod +x installer.sh && ./installer.sh

CMD ["bash"]

