FROM ubuntu:16.04
MAINTAINER Lucas Pantanella

COPY IoP.conf.dist-miner /root/IoP-miner.conf.dist-miner

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
  # init conf if data path is empty
  if [ -z "$(ls -A /root/.IoP/)" ]; then \
    echo "No existing data. Creating a new mining configuration..." && \
    # run iop daemon to create a new wallet
    mkdir -p /root/.IoP/thread-1/ && \
    nohup IoPd -datadir=/root/.IoP/thread-1/ & sleep 5 && \
    # fetch the wallet public key
    IOP_ADDR=$(IoP-cli -datadir=/root/.IoP/thread-1 getaccountaddress "") && \
    # stop iop daemon
    IoP-cli -datadir=/root/.IoP/thread-1 stop && \
    # setup conf file
    IOP_CONF_PATH=/root/.IoP/thread-1/IoP.conf && \
    cp /root/IoP-miner.conf.dist-miner $IOP_CONF_PATH && \
    # add wallet address to conf
    sed -i "s/\(minewhitelistaddr *= *\).*/\1$IOP_ADDR/" $IOP_CONF_PATH && \
    sed -i "s/\(mineto *= *\).*/\1$IOP_ADDR/" $IOP_CONF_PATH && \
    # set random RPC credentials
    sed -i "s/\(rpcuser *= *\).*/\1$(head /dev/urandom | tr -dc A-Za-z_ | head -c 10 ; echo '')/" $IOP_CONF_PATH && \
    sed -i "s/\(rpcpassword *= *\).*/\1$(head /dev/urandom | tr -dc A-Za-z0-9_ | head -c 64 ; echo '')/" $IOP_CONF_PATH ; \
  fi && \
  i=1 && \
  while [ $i -le $CPU_THREADS ]; do \
    mkdir /root/.IoP/thread-$i && \
    cp /root/.IoP/thread-1/IoP.conf /root/.IoP/thread-$i/. && \
    cp /root/.IoP/thread-1/wallet.dat /root/.IoP/thread-$i/. && \
    # run iop daemon
    nohup IoPd -datadir=/root/.IoP/thread-$i & \
    i=$(($i + 1)); \
  done && \
  bash
