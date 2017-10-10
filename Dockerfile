FROM ubuntu:16.04

MAINTAINER Lucas Pantanella

RUN \
    apt update && apt upgrade -y && \
    apt install -y wget nano && \
    wget -O ./iop-hd.deb https://github.com/Internet-of-People/iop-hd/releases/download/v6.0.0b2/iop-hd_v6.0.0b2-ubuntu1604_amd64.deb && \
    dpkg -i ./iop-hd.deb ; \
    apt -fy install

VOLUME /root/iop

ENTRYPOINT \
    nohup iopd --datadir=/root/iop/ 2>/dev/null & \
    bash

# docker build -t naei/docker-iop-hd-node .
# docker run -it -p 55001 -p 56001 -v /root/docker-iop-hd-node/data:/root/iop --name iop_hd_node naei/docker-iop-hd-node bash
# ctrl p + ctrl q
# docker exec -it iop_hd_node bash