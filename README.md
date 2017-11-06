## docker-iop-node

Run a IoP wallet mining node within a Docker container.

#### Requirements
- A IoP mining licence
- A Linux host
- A [Docker](https://docs.docker.com/engine/installation/) install

#### Quick setup

> _Disclaimer: Make sure to properly protect your wallet and other sensitive data. None of the authors, contributors, administrators, or anyone else connected with this repository, in any way whatsoever, can be responsible for your use of this project._

1. Clone or download the current repository.
```
cd ~/
git clone https://github.com/naei/docker-iop-node.git
```  

2. Inside the `data` folder edit `iop.conf` to add your IoP address and specify the number of threads you want to use. If you have a `wallet.dat` file, add it here too.

3. Launch a terminal on the project's folder, build the Docker image and run the container:

```
cd ~/docker-iop-node
# build
docker build -t naei/docker-iop-node .
# run attached
docker run -it -p 55001:56001 -p 56001:56001 -v ~/docker-iop-node/data:/root/.iop --name iop_node naei/docker-iop-node
# if your wallet is encrypted, unlock wallet to start mining
iop-cli walletpassphrase <YOUR_WALLET_PASSPHRASE> 30
```

> Note: if you are testing this Docker setup on Windows, or if you want your conf and blockchain data to stay in the container only, do not expose the volume when running the container:  
`
docker run -it -p 55001:56001 -p 56001:56001 --name iop_node naei/docker-iop-node
`  
Be aware that any further modification on the iop.conf or wallet.dat must be done inside your Docker volume!

- To detach without exiting the container, use the following keyboard shortcuts: ctrl+p / ctrl+q
- To re-attach the running container: `docker exec -it iop_node bash`
- To restart the stopped container: `docker restart iop_node && docker exec -ti iop_node bash`
