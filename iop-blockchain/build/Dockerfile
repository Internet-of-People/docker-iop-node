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
    # run iop daemon to create a new wallet
    nohup IoPd & sleep 5 && \
    # fetch the wallet public key
    IOP_ADDR=$(IoP-cli getaccountaddress "") && \
    # stop iop daemon
    IoP-cli stop && \
    # setup conf file
    IOP_CONF_PATH=/root/.IoP/IoP.conf && \
    cp /root/IoP-miner.conf.dist-miner $IOP_CONF_PATH && \
    # add wallet address to conf
    sed -i "s/\(minewhitelistaddr *= *\).*/\1$IOP_ADDR/" $IOP_CONF_PATH && \
    sed -i "s/\(mineto *= *\).*/\1$IOP_ADDR/" $IOP_CONF_PATH && \
    # set random RPC credentials
    sed -i "s/\(rpcuser *= *\).*/\1$(head /dev/urandom | tr -dc A-Za-z_ | head -c 10 ; echo '')/" $IOP_CONF_PATH && \
    sed -i "s/\(rpcpassword *= *\).*/\1$(head /dev/urandom | tr -dc A-Za-z0-9_ | head -c 64 ; echo '')/" $IOP_CONF_PATH ; \
  fi && \
  # run iop daemon
  nohup IoPd & \
  bash
