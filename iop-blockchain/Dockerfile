FROM ubuntu:16.04
MAINTAINER Lucas Pantanella

RUN \
  # add iop repository
  echo "deb [arch=amd64] http://repo.iop.cash/ 16.04 main" > /etc/apt/sources.list.d/IoP.list && \
  # import the sign key
  gpg --keyserver keys.gnupg.net --recv-keys 0CC9EB6DA69C84F4 && \
  gpg -a --export A69C84F4 | apt-key add - && \
  # install iop-blockchain
  apt-get update && \
  apt-get install -y iop-blockchain

ENTRYPOINT \
  # update and upgrade packages, including iop-blockchain
  apt-get update && \
  apt-get upgrade -y && \
    #if [ -f /root/shared/IoP.conf ]; then cp /root/shared/IoP.conf /root/.IoP/IoP.conf; else touch /root/.IoP/IoP.conf; fi && \
    #if [ -f /root/shared/wallet.dat ]; then cp /root/shared/wallet.dat /root/.IoP/wallet.dat; fi && \
  # run iop daemon
  nohup IoPd & \
    #ln -sf /root/.IoP/IoP.conf /root/shared/IoP.conf && \
    #ln -sf /root/.IoP/wallet.dat /root/shared/wallet.dat && \
  bash
