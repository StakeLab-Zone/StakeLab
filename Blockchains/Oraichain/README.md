# Oraichain

## Install the prerequies
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

## Manual Setup of oraid binary

Install ```oraid``` binaries and moove it to the right path:
```shell
git clone https://github.com/oraichain/orai && git checkout v0.41.2 && go get ./... && make build LEDGER_ENABLED=false BUILD_TAGS=muslc GOMOD_FLAGS= VERSION=0.41.2 && mv /usr/bin/oraid ~/go/bin/
```

You can verify that the installation is correct by looking at the version:
```shell
oraid version
# should return v0.41.2
```

And verify the libwasm version using:
```shell
oraid query wasm libwasmvm-version
# should return 1.1.2
```

## 
