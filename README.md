# docker-iop-node

### Requirements
- A Linux host
- A [Docker](https://docs.docker.com/engine/installation/) install
- A [Docker Compose](https://docs.docker.com/compose/install/#install-compose) install (compatible with file version 3)

### Setup

1. Clone or download the current repository
2. Launch a terminal on the project's folder, and build the Docker container: 
```
docker-compose build
```
3. Edit the [IoP.conf](iop-blockchain/data/IoP.conf) file to setup, at least, the 4 following arguments:
```
rpcuser=<ANY_USERNAME>
rpcpassword=<ANY_LONG_RANDOM_PASSWORD>
minewhitelistaddr=<YOUR_PUBLIC_IOP_ADDRESS>
mineto=<YOUR_PUBLIC_IOP_ADDRESS>
```

### Run

To launch the node, run a terminal on the project's folder and execute the following command:
```
docker-compose up -d
```
