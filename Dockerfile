FROM ubuntu:16.04

MAINTAINER Lucas Pantanella

RUN \
    apt update && apt upgrade -y && \
    apt install -y wget nano && \
    wget -O ./iop-hd.deb https://github.com/Internet-of-People/iop-hd/releases/download/v6.0.0b2/iop-hd_v6.0.0b2-ubuntu1604_amd64.deb && \
    dpkg -i ./iop-hd.deb ; \
    apt -fy install

VOLUME /root/iop

ADD data/* /root/iop/

ENTRYPOINT \
    nohup iopd --datadir=/root/iop/ 2>/dev/null & \
    bash
