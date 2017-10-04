## docker-iop-node

Run a IoP mining node within a Docker container.

#### Requirements
- A IoP mining licence
- A Linux host
- A [Docker](https://docs.docker.com/engine/installation/) install
- A [Docker Compose](https://docs.docker.com/compose/install/#install-compose) install (compatible with file version 3)

#### Quick setup

> _Disclaimer: Make sure to properly protect your wallet and other sensitive data. None of the authors, contributors, administrators, or anyone else connected with this repository, in any way whatsoever, can be responsible for your use of this project._

1. Clone or download the current repository
2. Launch a terminal on the project's folder, build the Docker image and run the container: 
```
docker-compose build
docker-compose up -d
```
3. Open the IoP.conf file in `iop-blockchain/data/thread-1/`, copy the address next to `minewhitelistaddr=` (this is your wallet public address) and give it to an IoP admin in order to be added in the miner list.

__*Congratulation! You're mining!*__

To stop the process, execute from the terminal on the project's folder: `docker-compose down`.

All the blockchain data, conf and wallet are in the [data](iop-blockchain/data/) folder. It is strongly advised to not touch these files unless you know what you do. Also, don't forget to backup your `wallet.dat` file.

If you want to access your node shell `docker-compose exec iop-blockchain bash` will open a bash shell inside your container. You will be then able to use any `IoP-cli` command by specifying the data directory as it: `IoP-cli -datadir="/root/.IoP/thread-1" <your_command>`.  
Type `exit` to quit the container.

#### Run multiple threads

By default, only 1 thread is launched, using 1 CPU code. 
If you want to run multiple thread: 
- stop your current process first: `docker-compose down`
- in [docker-compose.yml](docker-compose.yml) set the number of wanted threads (8 max) next to `CPU_THREADS`
- restart the node: `docker-compose up -d`

#### Use an existing wallet

Once the node has been setup and launched a first time:
- stop it `docker-compose down`
- replace the `iop-blockchain/data/thread-1/wallet.dat` file by your IoP wallet.dat
- open the `iop-blockchain/data/thread-1/IoP.conf` file, then replace the values of `minewhitelistaddr` and `mineto` by your wallet address
- restart the node `docker-compose up -d`. All existing conf and wallets in the others threads folders will be automatically updated.

#### Useful commands for non-initiated persons

Before all, you must access your Docker container: `docker-compose exec iop-blockchain bash`.

Then, you will be able to execute some useful commands. These examples are given for the thread 1 but can be applied for any thread you have launched.

- Get 100 last logs for thread 1: `tail -100 /root/.IoP/thread-1/output.log`
- Get wallet info: `IoP-cli -datadir=/root/.IoP/thread-1 getwalletinfo`
- Get mining info: `IoP-cli -datadir=/root/.IoP/thread-1 getmininginfo`
- List all transactions: `IoP-cli -datadir=/root/.IoP/thread-1 listtransactions`

Most of the commands from the [Bitcoin API call list](https://en.bitcoin.it/wiki/Original_Bitcoin_client/API_calls_list) will work.

