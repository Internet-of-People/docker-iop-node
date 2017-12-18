FROM ubuntu:16.04

MAINTAINER Lucas Pantanella

RUN \
    apt update && apt upgrade -y && \
    apt install -y wget nano && \
    wget -O ./iop-hd.deb https://github.com/Internet-of-People/iop-core/releases/download/v6.1.0/iop-core_6.1.0-ubuntu1604_amd64.deb && \
    dpkg -i ./iop-hd.deb ; \
    apt -fy install

VOLUME /root/.iop

ADD data/* /root/.iop/

ENTRYPOINT \
    nohup iopd --reindex 2>/dev/null & \
    bash
