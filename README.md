# docker-iop-node

### Requirements
- A Linux host
- A [Docker](https://docs.docker.com/engine/installation/) install
- A [Docker Compose](https://docs.docker.com/compose/install/#install-compose) install (compatible with file version 3)

### Quick setup

1. Clone or download the current repository
2. Launch a terminal on the project's folder, and build the Docker container: 
```
docker-compose build
docker-compose up -d
```
3. Open the IoP.conf file in `iop-blockchain/data/thread-1/`, copy the address next to `minewhitelistaddr=` (this is you wallet public address) and give it to an IoP admin in order to be added in the miner list.

__*Congratulation! You're mining!*__

To stop the process, execute from the terminal on the project's folder: `docker-compose down`.

All the blockchain data, conf and wallet are is the [data](iop-blockchain/data/). It is strongly advised to not touch these files unless you know what you do. Also, don't forget to backup your `wallet.dat` file.

If you want to access your Docker container, `docker-compose exec iop-blockchain bash` will open a bash shell inside your container. You will be then able to use any `IoP-cli` command by specifying the data directory as it: `IoP-cli -datadir="/root/.IoP/thread-1" <your_command>`.  
Type `exit` to quit the container.

