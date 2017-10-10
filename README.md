## docker-iop-node

Run a IoP HD wallet mining node within a Docker container.

#### Requirements
- A IoP mining licence
- A Linux host
- A [Docker](https://docs.docker.com/engine/installation/) install

#### Quick setup

> _Disclaimer: Make sure to properly protect your wallet and other sensitive data. None of the authors, contributors, administrators, or anyone else connected with this repository, in any way whatsoever, can be responsible for your use of this project._

- Build: `docker build -t naei/docker-iop-hd-node .`
- Run attached: `docker run -it -p 55001 -p 56001 -v /root/docker-iop-hd-node/data:/root/iop --name iop_hd_node naei/docker-iop-hd-node bash`
- Unlock wallet: `iop-cli --datadir=/root/iop/ walletpassphrase <YOUR_WALLET_PASSPHRASE> 300`
- Detach: ctrl+p / ctrl+q
- Re-attach: `docker exec -it iop_hd_node bash`
