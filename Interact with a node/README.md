# Interact with a Cosmos RPC node
Through this guide you gonna learn how to interact with a Cosmos node, from basic query to some advanced features using RPC.  
Remote procedure calls (RPCs) are frequently used in distributed computing and allow for inter-process communication (IPC). In most crypto ecosystem, there is public node (endpoint) existing, giving read/write access, that let you try for low amount of queries on it for free.  
On Cosmos, here are the few endpoints to remember:  
- **gRPC:** ```PORT:``` 9090
- **RPC:** ```PORT:``` 26657
- **Rest:** ```PORT:``` 1317

## Difference between Ethereum and Cosmos RPC's
There is no major differenciation between both of them.  
We could only see some delta if you are looking for an historic of all transaction of a specific account, and even on a specific module. In this case, in Ethereum side it would require an indexer, when it's way easier to get it from basic query using Cosmos RPC.  

## Summary
### Optionnal - Only if you wanna use your own endpoint in case of lot of queries
1. Prepare your machine
  - [Install the prerequies](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Install-the-prerequies)
2. Run your full node
  - [Install the binary](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Install-the-binary)
  - [Configure your network files](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Configure-your-network-files)
  - [Launch the chain](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Launch-the-chain)
  
### You can start here if you don't wanna run your own node
3. Query using RPC (CLI)
  - [Query the current status](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Query-the-current-status-CLI)
  - [Query the current block height](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Query-the-current-block-height-CLI)
  - [Query the balance of an account](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Query-the-balance-of-an-account-CLI)
  - [Send a transaction](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Send-a-transaction-CLI)
5. Query using RPC (CosmJS)
  - [Query the current status](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Query-the-current-status-CosmJS)
  - [Query the current block height](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Query-the-current-block-height-CosmJS)
  - [Query the balance of an account](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Query-the-balance-of-an-account-CosmJS)
  - [Send a transaction](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Send-a-transaction-CosmJS)
6. Query using RPC (JSON-RPC)
  - [Query the current status](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Query-the-current-status-JSON-RPC)
  - [Query the current block height](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Query-the-current-block-height-JSON-RPC)
  - [Query the balance of an account](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Query-the-balance-of-an-account-JSON-RPC)
  - [Send a transaction](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Send-a-transaction-JSON-RPC)

## Prepare your machine
### Install the prerequies
*  Linux Machine 20.4+  
*  Install few packages:  
```shell
apt update && apt upgrade -y 
```  

```shell
apt install build-essential git ufw curl jq unzip lz4 aria2 -y
```

```shell
wget -c https://go.dev/dl/go1.19.3.linux-amd64.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz && rm -rf go1.19.3.linux-amd64.tar.gz
```  

```shell
echo 'export GOROOT=/usr/local/go' >> $HOME/.bash_profile
echo 'export GOPATH=$HOME/go' >> $HOME/.bash_profile
echo 'export GO111MODULE=on' >> $HOME/.bash_profile
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> $HOME/.bash_profile && . $HOME/.bash_profile
```  
You can verify if it's well installed by using the following command:  
```shell
go version
#Should return: go version go1.19.3 linux/amd64
```  

## Run your full node
### Install the binary
Clone the repository on your ```$HOME``` to only have to ```git pull``` for future upgrade of binary and ```git checkout``` the last version:
```shell
git clone https://github.com/cosmos/gaia && cd gaia && git checkout v7.1.0 && make install
```  
You can verify if it's well installed by using the follow command:  
```shell
gaiad version
#Should return: v7.1.0
```  
You can now init the chain to create the ```.gaia```folder that will have everything related to your Blockchain (data, config, keys...):  
```shell
gaiad init <nameofyournode> --chain-id cosmoshub-4
```  
Replace ```<nameofyournode>```by the name you want to have your node appears on the network (public).  

### Configure your network files  
Depending on your usage, you will either choose to run one of the three below nodes. We will use a ```snapshot``` to synch faster with the chain:   
- **Archive node:** all historic states will be saved, nothing will be deleted (High storage requirement - 4TB size)  
```shell
URL=`curl -L https://quicksync.io/cosmos.json|jq -r '.[] |select(.file=="cosmoshub-4-archive")|.url'` && cd $HOME/.gaia && aria2c -x5 $URL
```  
- **Full node:** the last 100 states are kept in addition to every 500th state; pruning at 10 block intervals (Average storage requirement - 2TB size)  
```shell
URL=`curl -L https://quicksync.io/cosmos.json|jq -r '.[] |select(.file=="cosmoshub-4-default")|.url'` && cd $HOME/.gaia && aria2c -x5 $URL
```  
- **Pruned node:** determine with your own custom values (Low storage requirement - 50GB size)  
```shell
URL=`curl -L https://quicksync.io/cosmos.json|jq -r '.[] |select(.file=="cosmoshub-4-pruned")|.url'` && cd $HOME/.gaia && aria2c -x5 $URL
```  
Once you have your data folder loaded, you can change some files value in the config folder:  
- **app.toml:** 
- **config.toml:** 

### Launch the chain
Once everything is setup on the configuration side, you can run using different way the Blockchain:  
- **CLI command (prefered to launch on a different screen):**  
```shell
gaiad start
```  
To stop the Blockchain, you just have to press ```CTRL```+```C```  

- **Systemctl service:**  
Create the service file by copy/paste the below command:  
```shell
tee <<EOF >/dev/null /etc/systemd/system/gaiad.service
[Unit]
Description=Teritori Cosmos daemon
After=network-online.target

[Service]
User=$USER
ExecStart=/home/$USER/go/bin/gaiad start
Restart=on-failure
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF
```  
Once done, you just have to copy/past the three below commands to enable, load and launch your node:  
```shell
systemctl enable gaiad
systemctl daemon-reload
systemctl restart gaiad
```  
As it's running the back, you can check the log using:  
```shell
journalctl -u gaiad.service -f -n 100
```  
To stop the Blockchain, you can run:  
```shell
systemctl stop gaiad
```  

- **Cosmovisor (Recommended):**  
Install Cosmovisor on your machine:  
```shell
go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@latest
```  
Source your profile with the daemon configuration:  
```shell
export DAEMON_NAME=gaiad
export DAEMON_HOME=$HOME/.gaia
source ~/.profile
```  
Create the folders to store future binaries for future upgrades:  
```shell
mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
mkdir -p $DAEMON_HOME/cosmovisor/upgrades
```  
Copy the actual binary into Cosmovisor folder:  
```shell
cp $HOME/go/bin/gaiad $DAEMON_HOME/cosmovisor/genesis/bin
```  
Create the service file by copy/paste the below command:  
```shell
tee <<EOF >/dev/null /etc/systemd/system/gaiad.service
[Unit]
Description=Cosmos Daemon (cosmovisor)

After=network-online.target

[Service]
User=$USER
ExecStart=/home/$USER/go/bin/cosmovisor run start
Restart=always
RestartSec=3
LimitNOFILE=4096
Environment="DAEMON_NAME=gaiad"
Environment="DAEMON_HOME=/home/$USER/.gaia"
Environment="DAEMON_ALLOW_DOWNLOAD_BINARIES=false"
Environment="DAEMON_RESTART_AFTER_UPGRADE=true"
Environment="DAEMON_LOG_BUFFER_SIZE=512"

[Install]
WantedBy=multi-user.target
EOF
```  
Once done, you just have to copy/past the three below commands to enable, load and launch your node:  
```shell
systemctl enable gaiad
systemctl daemon-reload
systemctl restart gaiad
```  
As it's running the back, you can check the log using:  
```shell
journalctl -u gaiad.service -f -n 100
```  
To stop the Blockchain, you can run:  
```shell
cosmovisor run stop
```  

You can verify if your chain is synched with the last block by using the below command:  
```shell
gaiad status
#Should return the following result if synched: "catching_up":false
```  

## Query using RPC (CLI)
### Query the current status (CLI)  
To use the RPC (Remote Procedure Call) feature with the Gaia binary from the Cosmos Hub, you will need to install the binary of the chain you wanna use, here for Cosmos Hub: ```gaiad```:  
- If you followed the optionnal part and you are running your full node, you shoud already have ```gaiad```installed properly and can moove to the next step.  
- If you don't, please refer to the [part I](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Install-the-prerequies) and [part II](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Install-the-binary) to install both prerequies and binary.  
To query the current status of the blockchain, you can use the ```status``` command, like this:  
```shell
gaiad query status --node tcp://ip:port
```  

See the below example format:  
```shell
# If you use your own full node
gaiad query status --node tcp://localhost:26657

# If you use a public endpoint
gaiad query status --node https://cosmos-mainnet-rpc.allthatnode.com:26657/
 ```  
This will send a status RPC request to the server, which will return the current status of the blockchain. 

### Query the current block height (CLI)  
To query the current block height of the blockchain, you can use the ```block``` query command, like this:  
```shell
gaiad query block <HEIGHT> --node tcp://ip:port
```  

See the below example format:  
```shell
# If you use your own full node
gaiad query block 13069963 --node tcp://localhost:26657

# If you use a public endpoint
gaiad query block 13069963 --node https://cosmos-mainnet-rpc.allthatnode.com:26657/
 ```  
Replace ```<HEIGHT>``` with the block of the blockchain you want to query. This will return the current block height of the blockchain, along with other information about the block, such as the timestamp and the list of transactions included in the block.  

### Query the balance of an account (CLI)
To query the balance of an account on the blockchain, you can use the ```bank balances``` query account command, like this:
```shell
gaiad query bank balances <ADDRESS> --node tcp://ip:port
 ```  
 
See the below example format:  
```shell
# If you use your own full node
gaiad query bank balances cosmos1gpx52r9h3zeul45amvcy2pysgvcwddxrdjwdll --node tcp://localhost:26657

# If you use a public endpoint
gaiad query bank balances cosmos1gpx52r9h3zeul45amvcy2pysgvcwddxrdjwdll --node https://cosmos-mainnet-rpc.allthatnode.com:26657/
 ```  
Replace ```<ADDRESS>``` with the address of the account you want to query. This will return the current balance of the account, along with other information about the account, such as the sequence number and the list of account tokens.  

### Send a transaction (CLI)  
To send a transaction on the blockchain, you can use the ```tx bank send``` command, like this:  
```shell
gaiad tx bank send <SENDER_KEY> <RECIPIENT_ADDRESS> <AMOUNT> --chain-id=cosmoshub-4 --node tcp://ip:port
```  
See the below example format:  
```shell
# If you use your own full node
gaiad tx bank send cosmos1gpx52r9h3zeul45amvcy2pysgvcwddxrdjwdll cosmos1nm50zycnm9yf33rv8n6lpks24usxzahkhyfj88 1000000uatom --chain-id=cosmoshub-4 --node tcp://localhost:26657

# If you use a public endpoint
gaiad tx bank send myprivatecosmoskey cosmos1nm50zycnm9yf33rv8n6lpks24usxzahkhyfj88 1000000uatom --chain-id=cosmoshub-4 --node https://cosmos-mainnet-rpc.allthatnode.com:26657/
```   
Replace ```<SENDER_KEY>``` with the private key of the sender, ```<RECIPIENT_ADDRESS>``` with the address of the recipient, ```<AMOUNT>``` with the amount of tokens to send (not thate it's using all the decimal and ```u``` or ```a```before the denom - here 1000000uatom = 1 ATOM). This will broadcast the transaction to the network and return the result of the transaction, such as whether it was successful or not.  

## Query using RPC (CosmJS)
### Query the current status (CosmJS)  
To use the RPC (Remote Procedure Call) feature with CosmJS from the Cosmos Hub, you first need to install CosmJS by running the following command:  
```shell
npm install -g @cosmjs/cosmjs
```  
Once CosmJS is installed, you can use the cosmjs command-line tool to send RPC requests to the Cosmos Hub. The cosmjs tool uses the gaia-13002 network by default, but you can specify a different network by using the --network flag, like this:
```shell
cosmjs --network <NETWORK> <COMMAND>
```  
Replace ```<NETWORK>``` with the ID of the network you want to use (e.g. cosmoshub-4), and ```<COMMAND>``` with the CosmJS command you want to run.  

```shell
cosmjs query status --network cosmoshub-4
```  
This will send a status RPC request to the server, which will return the current status of the blockchain.  

### Query the current block height (CosmJS)   
To query the current block height of the blockchain, you can use the cosmjs query block command, like this:
```shell
cosmjs query block --network cosmoshub-4
```  
This will return the current block height of the blockchain, along with other information about the block, such as the timestamp and the list of transactions included in the block.  

### Query the balance of an account (CosmJS)  
To query the balance of an account on the blockchain, you can use the cosmjs query account command, like this:
```shell
cosmjs query account <ADDRESS> --network cosmoshub-4
```  
Replace ```<ADDRESS>``` with the address of the account you want to query. This will return the current balance of the account, along with other information about the account, such as the sequence number and the list of account tokens.  

### Send a transaction (CosmJS)  
To send a transaction on the blockchain, you can use the cosmjs tx send command, like this:  

```shell
cosmjs tx send <SENDER_KEY> <RECIPIENT_ADDRESS> <AMOUNT> --chain-id=cosmoshub-4
```  
Replace ```<SENDER_KEY>``` with the private key of the sender, ```<RECIPIENT_ADDRESS>``` with the address of the recipient, ```<AMOUNT>``` with the amount of tokens to send. This will broadcast the transaction to the network and return the result of the transaction, such as whether it was successful or not.  

## Query using RPC (JSON-RPC)
### Query the current status (JSON-RPC)  
To use the RPC (Remote Procedure Call) feature with the Gaia binary from the Cosmos Hub, you need to first start the Gaia server following [this procedure](https://github.com/StakeLab-Hub/StakeLab/blob/main/Interact%20with%20a%20node/README.md#Install-the-prerequies), or use a public endpoint.  
Once the Gaia server is running, you can use any JSON-RPC compatible client to send requests to the server. For example, you can use the curl command-line tool to send an RPC request to the server, like this:  
```shell
curl -X POST http://localhost:26657 -d '{"jsonrpc":"2.0","method":"status","params":[],"id":1}'
```  
This will send a status RPC request to the server, which will return the current status of the blockchain.  

### Query the current block height (JSON-RPC)  
To query the current block height of the blockchain, you can use the block RPC endpoint, like this:  

```shell
curl -X POST http://localhost:26657 -d '{"jsonrpc":"2.0","method":"block","params":[],"id":1}'
```  
This will return the current block height of the blockchain, along with other information about the block, such as the timestamp and the list of transactions included in the block.  

### Query the balance of an account (JSON-RPC)  
To query the balance of an account on the blockchain, you can use the account RPC endpoint, like this:  

```shell
curl -X POST http://localhost:26657 -d '{"jsonrpc":"2.0","method":"account","params":[{"address":"<ADDRESS>"}],"id":1}'
```  
Replace ```<ADDRESS>``` with the address of the account you want to query. This will return the current balance of the account, along with other information about the account, such as the sequence number and the list of account tokens.  

### Send a transaction (JSON-RPC)  
To send a transaction on the blockchain, you can use the broadcast_tx_sync RPC endpoint, like this:  

```shell
curl -X POST http://localhost:26657 -d '{"jsonrpc":"2.0","method":"broadcast_tx_sync","params":[{"tx": "<TRANSACTION>"}],"id":1}'
```  
Replace ```<TRANSACTION>``` with the transaction you want to send, encoded in the appropriate format (e.g. Amino or JSON). This will broadcast the transaction to the network and return the result of the transaction, such as whether it was successful or not.  
