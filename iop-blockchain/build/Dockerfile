FROM ubuntu:16.04
MAINTAINER Lucas Pantanella

RUN \
  # add iop repository
  echo "deb [arch=amd64] http://repo.iop.cash/ 16.04 main" > /etc/apt/sources.list.d/IoP.list && \
  # import and add GPG key 
  gpg --keyserver keys.gnupg.net --recv-keys 0CC9EB6DA69C84F4 && \
  gpg -a --export A69C84F4 | apt-key add - && \
  # install iop-blockchain package
  apt-get update && \
  apt-get install -y iop-blockchain

ENTRYPOINT \
  # update packages list
  apt-get update && \
  # upgrade iop-blockchain to the latest version 
  apt-get install -y --only-upgrade iop-blockchain && \
  # run iop daemon
  nohup IoPd & \
  bash
