# Authz with Ledger 
Through this guide you gonna learn how to enable auto compounding with StakeLab using CLI and the Authz module.  
*Note that this is only for users managing their assets with a Ledger device.*  

## Prerequis:  
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
*  Now, obviously grab your Ledger device and open the Cosmos application

*Note that if you don't have one, you should buy one to start managing your assets in a secure way, just [here](https://www.ledger.com)*  

## Direct link to a chain:  
[Akash](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#akash)  
[Asset Mantle](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#asset-mantle)  
[Axelar](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#axelar)  
[Band Protocol](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#band-protocol)  
[Bitcanna](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#bitcanna)  
[Bitsong](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#bitsong)  
[Cerberus](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#cerberus)  
[Certik](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#certik)  
[Chihuahua](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#chihuahua)  
[Comdex](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#comdex)  
[Commercio](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#commercio)  
[Cosmos Hub](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#cosmos-hub)  
[Crescent](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#crescent)  
[Cudos](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#cudos)  
[Decentr](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#decentr)  
[Desmos](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#desmos)  
[Dig Chain](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#dig-chain)  
[Emoney](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#emoney)  
[Evmos](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#evmos)  
[Fetch Ai](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#fetch-ai)  
[Galaxy](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#galaxy)  
[Gravity Bridge](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#gravity-bridge) 
[Idep](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#idep)  
[Injective](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#injective)  
[Iris](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#iris)  
[Ixo](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#ixo)  
[Juno](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#juno)  
[Kava](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#kava)  
[Ki Chain](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#ki-chain)  
[Konstellation](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#konstellation)  
[Kujira](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#kujira)  
[Lum](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#lum)  
[Medibloc](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#medibloc)  
[Meme](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#meme)  
[Nomic](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#nomic)  
[Omniflix](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#omniflix)  
[Oraichain](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#oraichain)  
[Osmosis](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#osmosis)  
[Passage](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#passage)  
[Persistence](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#persistence)  
[Rebus](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#rebus)  
[Regen](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#regen)  
[Rizon](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#rizon)  
[Secret](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#secret)  
[Sentinel](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#sentinel)  
[Sifchain](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#sifchain)  
[Sommelier](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#sommelier)  
[Stargaze](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#stargaze)  
[Starname](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#starname)  
[Teritori](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#teritori)  
[Umee](https://github.com/StakeLab-Hub/Documentation/blob/main/CLI/Authz%20with%20Ledger/README.md#umee)  

## Supported networks:  

### _Akash_  
```shell
git clone https://github.com/ovrclk/akash/ restake_akash  && cd restake_akash && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
akash keys add akash --ledger
```  
It will generate your address under the wallet name "akash" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
akash tx authz grant akash1mjq48r6435aewerpruwc8up3tz3rzan2pznsc0 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from akash --ledger --chain-id akashnet-2 --node https://rpc.cosmos.directory:443/akash --gas auto --gas-prices 0.024999999999999998uakt --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
akash tx authz revoke akash1mjq48r6435aewerpruwc8up3tz3rzan2pznsc0 /cosmos.staking.v1beta1.MsgDelegate --from akash --ledger --chain-id akashnet-2 --node https://rpc.cosmos.directory:443/akash --gas auto --gas-prices 0.024999999999999998uakt --gas-adjustment 1.5
```  
----------------  

### _Asset Mantle_  
```shell
git clone https://github.com/AssetMantle/node.git restake_assetmantle && cd restake_assetmantle && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
mantleNode keys add assetmantle --ledger
```  
It will generate your address under the wallet name "assetmantle" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
mantleNode tx authz grant mantle1mjq48r6435aewerpruwc8up3tz3rzan2ja9j7l generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from assetmantle --ledger --chain-id mantle-1 --node https://rpc.cosmos.directory:443/assetmantle --gas auto --gas-prices 0.025umntl --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
mantleNode tx authz revoke mantle1mjq48r6435aewerpruwc8up3tz3rzan2ja9j7l /cosmos.staking.v1beta1.MsgDelegate --from assetmantle --ledger --chain-id mantle-1 --node https://rpc.cosmos.directory:443/assetmantle --gas auto --gas-prices 0.025umntl --gas-adjustment 1.5
```  
----------------  

### _Axelar_  
No Authz support yet.  

----------------  

### _Band Protocol_  
```shell
git clone https://github.com/bandprotocol/chain restake_bandchain  && cd restake_bandchain && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
bandd keys add bandprotocol --ledger
```  
It will generate your address under the wallet name "bandprotocol" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
bandd tx authz grant band1mjq48r6435aewerpruwc8up3tz3rzan24k74ea generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from bandprotocol --ledger --chain-id laozi-mainnet --node https://rpc.cosmos.directory:443/bandchain --gas auto --gas-prices 0.024999999999999998uband --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
bandd tx authz revoke band1mjq48r6435aewerpruwc8up3tz3rzan24k74ea /cosmos.staking.v1beta1.MsgDelegate --from bandprotocol --ledger --chain-id laozi-mainnet --node https://rpc.cosmos.directory:443/bandchain --gas auto --gas-prices 0.024999999999999998uband --gas-adjustment 1.5
```  
----------------  

### _Bitcanna_  
```shell
git clone https://github.com/BitCannaGlobal/bcna restake_bitcanna && cd restake_bitcanna && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
bcnad keys add bitcanna --ledger
```  
It will generate your address under the wallet name "bitcanna" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
bcnad tx authz grant bcna1mjq48r6435aewerpruwc8up3tz3rzan2kfwkf8 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from bitcanna --ledger --chain-id bitcanna-1 --node https://rpc.cosmos.directory:443/bitcanna --gas auto --gas-prices 0.001ubcna --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
bcnad tx authz revoke bcna1mjq48r6435aewerpruwc8up3tz3rzan2kfwkf8 /cosmos.staking.v1beta1.MsgDelegate --from bitcanna --ledger --chain-id bitcanna-1 --node https://rpc.cosmos.directory:443/bitcanna --gas auto --gas-prices 0.001ubcna --gas-adjustment 1.5
```  
----------------  

### _Bitsong_  
```shell
git clone https://github.com/bitsongofficial/go-bitsong restake_bitsong  && cd restake_bitsong && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
bitsongd keys add bitsong --ledger
```  
It will generate your address under the wallet name "bitsong" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
bitsongd tx authz grant bitsong1mjq48r6435aewerpruwc8up3tz3rzan2qsvlr6 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from bitsong --ledger --chain-id bitsong-2b --node https://rpc.cosmos.directory:443/bitsong --gas auto --gas-prices 0.0250ubtsg --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
bitsongd tx authz revoke bitsong1mjq48r6435aewerpruwc8up3tz3rzan2qsvlr6 /cosmos.staking.v1beta1.MsgDelegate --from bitsong --ledger --chain-id bitsong-2b --node https://rpc.cosmos.directory:443/bitsong --gas auto --gas-prices 0.0250ubtsg --gas-adjustment 1.5
```  
----------------  

### _Cerberus_  
```shell
git clone https://github.com/cerberus-zone/cerberus restake_cerberus  && cd restake_cerberus && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
cerberusd keys add cerberus --ledger
```  
It will generate your address under the wallet name "cerberus" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
cerberusd tx authz grant cerberus1mjq48r6435aewerpruwc8up3tz3rzan2s77757 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from cerberus --ledger --chain-id cerberus-chain-1 --node https://rpc.cosmos.directory:443/cerberus --gas auto --gas-prices 0.025ucrbrus --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
cerberusd tx authz revoke cerberus1mjq48r6435aewerpruwc8up3tz3rzan2s77757 /cosmos.staking.v1beta1.MsgDelegate --from cerberus --ledger --chain-id cerberus-chain-1 --node https://rpc.cosmos.directory:443/cerberus --gas auto --gas-prices 0.025ucrbrus --gas-adjustment 1.5
```  
----------------  

### _Certik_  
```shell
git clone https://github.com/ShentuChain/shentu restake_shentu && cd restake_shentu && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
certik keys add certik --ledger
```  
It will generate your address under the wallet name "certik" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
certik tx authz grant certik1mjq48r6435aewerpruwc8up3tz3rzan2t3zqq7 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from certik --ledger --chain-id shentu-2.2 --node https://rpc.cosmos.directory:443/shentu --gas auto --gas-prices 0.024999999999999998uctk --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
certik tx authz revoke certik1mjq48r6435aewerpruwc8up3tz3rzan2t3zqq7 /cosmos.staking.v1beta1.MsgDelegate --from certik --ledger --chain-id shentu-2.2 --node https://rpc.cosmos.directory:443/shentu --gas auto --gas-prices 0.024999999999999998uctk --gas-adjustment 1.5
```  
----------------  

### _Chihuahua_  
```shell
git clone https://github.com/ChihuahuaChain/chihuahua/ restake_chihuahua && cd restake_chihuahua && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
chihuahuad keys add chihuahua --ledger
```  
It will generate your address under the wallet name "chihuahua" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
chihuahuad tx authz grant chihuahua1mjq48r6435aewerpruwc8up3tz3rzan20vneqh generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from chihuahua --ledger --chain-id chihuahua-1 --node https://rpc.cosmos.directory:443/chihuahua --gas auto --gas-prices 1uhuahua --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
chihuahuad tx authz revoke chihuahua1mjq48r6435aewerpruwc8up3tz3rzan20vneqh /cosmos.staking.v1beta1.MsgDelegate --from chihuahua --ledger --chain-id chihuahua-1 --node https://rpc.cosmos.directory:443/chihuahua --gas auto --gas-prices 1uhuahua --gas-adjustment 1.5
```  

----------------  

### _Comdex_  
No Authz support yet.  

----------------  

### _Commercio_  
No Authz support yet.  

----------------  

### _Cosmos Hub_  
```shell
git clone https://github.com/cosmos/gaia restake_cosmoshub && cd restake_cosmoshub && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
gaiad keys add cosmoshub --ledger
```  
It will generate your address under the wallet name "cosmoshub" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
gaiad tx authz grant cosmos1mjq48r6435aewerpruwc8up3tz3rzan2ve7hp4 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from cosmoshub --ledger --chain-id cosmoshub-4 --node https://rpc.cosmos.directory:443/cosmoshub --gas auto --gas-prices 0.0025uatom --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
gaiad tx authz revoke cosmos1mjq48r6435aewerpruwc8up3tz3rzan2ve7hp4 /cosmos.staking.v1beta1.MsgDelegate --from cosmoshub --ledger --chain-id cosmoshub-4 --node https://rpc.cosmos.directory:443/cosmoshub --gas auto --gas-prices 0.0025uatom --gas-adjustment 1.5
```  
----------------  

### _Crescent_  
```shell
git clone https://github.com/crescent-network/crescent restake_crescent && cd restake_crescent && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
crescentd keys add crescent --ledger
```  
It will generate your address under the wallet name "crescent" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
crescentd tx authz grant cre1mjq48r6435aewerpruwc8up3tz3rzan2g3dj5c generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from crescent --ledger --chain-id crescent-1 --node https://rpc.cosmos.directory:443/crescent --gas auto --gas-prices 0.025ucre --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
crescentd tx authz revoke cre1mjq48r6435aewerpruwc8up3tz3rzan2g3dj5c /cosmos.staking.v1beta1.MsgDelegate --from crescent --ledger --chain-id crescent-1 --node https://rpc.cosmos.directory:443/crescent --gas auto --gas-prices 0.025ucre --gas-adjustment 1.5
```  
----------------  

### _Cudos_  
No Authz support yet.  

----------------  

### _Decentr_  
No Authz support yet.  

----------------  

### _Desmos_  
```shell
git clone https://github.com/desmos-labs/desmos restake_desmos && cd restake_desmos && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
desmos keys add desmos --ledger
```  
It will generate your address under the wallet name "desmos" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
desmos tx authz grant desmos1mjq48r6435aewerpruwc8up3tz3rzan2cpn8kd generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from desmos --ledger --chain-id desmos-mainnet --node https://rpc.cosmos.directory:443/desmos --gas auto --gas-prices 0.001udsm --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
desmos tx authz revoke desmos1mjq48r6435aewerpruwc8up3tz3rzan2cpn8kd /cosmos.staking.v1beta1.MsgDelegate --from desmos --ledger --chain-id desmos-mainnet --node https://rpc.cosmos.directory:443/desmos --gas auto --gas-prices 0.001udsm --gas-adjustment 1.5
```  
----------------  

### _Dig Chain_  
```shell
git clone https://github.com/notional-labs/dig restake_dig && cd restake_dig && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
digd keys add digchain --ledger
```  
It will generate your address under the wallet name "digchain" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
digd tx authz grant dig1mjq48r6435aewerpruwc8up3tz3rzan25dhurw generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from digchain --ledger --chain-id dig-1 --node https://rpc.cosmos.directory:443/dig --gas auto --gas-prices 0.01udig --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
digd tx authz revoke dig1mjq48r6435aewerpruwc8up3tz3rzan25dhurw /cosmos.staking.v1beta1.MsgDelegate --from digchain --ledger --chain-id dig-1 --node https://rpc.cosmos.directory:443/dig --gas auto --gas-prices 0.01udig --gas-adjustment 1.5
```  
----------------  

### _E money_  
No Authz support yet.  

----------------  

### _Evmos_  
```shell
git clone https://github.com/evmos/evmos restake_evmos && cd restake_evmos && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
evmosd keys add evmos --ledger
```  
It will generate your address under the wallet name "evmos" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
evmosd tx authz grant evmos175l97fdm2a6x5xp82psec52elzu8nsl7dmc7an generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from evmos --ledger --chain-id evmos_9001-2 --node https://rpc.cosmos.directory:443/evmos --gas auto --gas-prices 25000000000.0000aevmos --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
evmosd tx authz revoke evmos175l97fdm2a6x5xp82psec52elzu8nsl7dmc7an /cosmos.staking.v1beta1.MsgDelegate --from evmos --ledger --chain-id evmos_9001-2 --node https://rpc.cosmos.directory:443/evmos --gas auto --gas-prices 25000000000.0000aevmos --gas-adjustment 1.5
```  
----------------  

### _Fetch Ai_  
```shell
git clone https://github.com/fetchai/fetchd restake_fetchhub && cd restake_fetchhub && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
fetchd keys add fetchai --ledger
```  
It will generate your address under the wallet name "fetchai" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
fetchd tx authz grant fetch1mjq48r6435aewerpruwc8up3tz3rzan2lyhnrz generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from fetchai --ledger --chain-id fetchhub-4 --node https://rpc.cosmos.directory:443/fetchhub --gas auto --gas-prices 5000afet --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
fetchd tx authz revoke fetch1mjq48r6435aewerpruwc8up3tz3rzan2lyhnrz /cosmos.staking.v1beta1.MsgDelegate --from fetchai --ledger --chain-id fetchhub-4 --node https://rpc.cosmos.directory:443/fetchhub --gas auto --gas-prices 5000afet --gas-adjustment 1.5
```  
----------------  

### _Galaxy_  
No Authz support yet.  

----------------  

### _Gravity Bridge_  
```shell
git clone https://github.com/Gravity-Bridge/Gravity-Bridge restake_gravitybridge && cd restake_gravitybride && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
gravity keys add gravitybridge --ledger
```  
It will generate your address under the wallet name "gravitybridge" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
gravity tx authz grant gravity1mjq48r6435aewerpruwc8up3tz3rzan2gfv0ya generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from gravitybridge --ledger --chain-id gravity-bridge-3 --node https://rpc.cosmos.directory:443/gravitybridge --gas auto --gas-prices 0.025ugraviton --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
gravity tx authz revoke gravity1mjq48r6435aewerpruwc8up3tz3rzan2gfv0ya /cosmos.staking.v1beta1.MsgDelegate --from gravitybridge --ledger --chain-id gravity-bridge-3 --node https://rpc.cosmos.directory:443/gravitybridge --gas auto --gas-prices 0.025ugraviton --gas-adjustment 1.5
```  
----------------  

### _Idep_  
```shell
git clone https://github.com/IDEP-network/ion restake_idep && cd restake_idep && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
idep keys add idep --ledger
```  
It will generate your address under the wallet name "idep" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
idep tx authz grant idep1mjq48r6435aewerpruwc8up3tz3rzan2degr8u generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from idep --ledger --chain-id Antora --node https://rpc.cosmos.directory:443/idep --gas auto --gas-prices 0.0250idep --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
idep tx authz revoke idep1mjq48r6435aewerpruwc8up3tz3rzan2degr8u /cosmos.staking.v1beta1.MsgDelegate --from idep --ledger --chain-id Antora --node https://rpc.cosmos.directory:443/idep --gas auto --gas-prices 0.0250idep --gas-adjustment 1.5
```  
----------------  

### _Injective_  
```shell
git clone https://github.com/InjectiveLabs/injective-chain-releases restake_injective && cd restake_injective && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
injectived keys add injective --ledger
```  
It will generate your address under the wallet name "injective" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
injectived tx authz grant inj1mjq48r6435aewerpruwc8up3tz3rzan2xsfnnd generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from injective --ledger --chain-id injective-1 --node https://rpc.cosmos.directory:443/injective --gas auto --gas-prices 25000000000.0000inj --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
injectived tx authz revoke inj1mjq48r6435aewerpruwc8up3tz3rzan2xsfnnd /cosmos.staking.v1beta1.MsgDelegate --from injective --ledger --chain-id injective-1 --node https://rpc.cosmos.directory:443/injective --gas auto --gas-prices 25000000000.0000inj --gas-adjustment 1.5
```    

----------------  

### _Iris_  
No Authz support yet.  

----------------  

### _Ixo_  
No Authz support yet.  

----------------  

### _Juno_  
```shell
git clone https://github.com/CosmosContracts/juno restake_juno && cd restake_juno && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
junod keys add juno --ledger
```  
It will generate your address under the wallet name "juno" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
junod tx authz grant juno1mjq48r6435aewerpruwc8up3tz3rzan26tavxf generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from juno --ledger --chain-id juno-1 --node https://rpc.cosmos.directory:443/juno --gas auto --gas-prices 0.0025ujuno --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
junod tx authz revoke juno1mjq48r6435aewerpruwc8up3tz3rzan26tavxf /cosmos.staking.v1beta1.MsgDelegate --from juno --ledger --chain-id juno-1 --node https://rpc.cosmos.directory:443/juno --gas auto --gas-prices 0.0025ujuno --gas-adjustment 1.5
```  
----------------  

### _Kava_  
```shell
git clone https://github.com/kava-Labs/kava/ restake_kava && cd restake_kava && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
kava keys add kava --ledger
```  
It will generate your address under the wallet name "kava" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
kava tx authz grant kava1mjq48r6435aewerpruwc8up3tz3rzan2sv22hj generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from kava --ledger --chain-id kava_2222-10 --node https://rpc.cosmos.directory:443/kava --gas auto --gas-prices 0.00008ukava --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
kava tx authz revoke kava1mjq48r6435aewerpruwc8up3tz3rzan2sv22hj /cosmos.staking.v1beta1.MsgDelegate --from kava --ledger --chain-id kava_2222-10 --node https://rpc.cosmos.directory:443/kava --gas auto --gas-prices 0.00008ukava --gas-adjustment 1.5
```  
----------------  

### _Ki Chain_  
```shell
git clone https://github.com/KiFoundation/ki-tools restake_kichain && cd restake_kichain && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
kid keys add kichain --ledger
```  
It will generate your address under the wallet name "kichain" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
kid tx authz grant ki1mjq48r6435aewerpruwc8up3tz3rzan2a50c9p generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from kichain --ledger --chain-id kichain-2 --node https://rpc.cosmos.directory:443/kichain --gas auto --gas-prices 0.025uxki --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
kid tx authz revoke ki1mjq48r6435aewerpruwc8up3tz3rzan2a50c9p /cosmos.staking.v1beta1.MsgDelegate --from kichain --ledger --chain-id kichain-2 --node https://rpc.cosmos.directory:443/kichain --gas auto --gas-prices 0.025uxki --gas-adjustment 1.5
```  
----------------  

### _Konstellation_  
No Authz support yet.  

----------------  

### _Kujira_  
```shell
git clone https://github.com/Team-Kujira/core restake_kujira && cd restake_kujira && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
kujirad keys add kujira --ledger
```  
It will generate your address under the wallet name "kujira" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
kujirad tx authz grant kujira1mjq48r6435aewerpruwc8up3tz3rzan2a3u0vl generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from kujira --ledger --chain-id kaiyo-1 --node https://rpc.cosmos.directory:443/kujira --gas auto --gas-prices 0.0250ukuji --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
kujirad tx authz revoke kujira1mjq48r6435aewerpruwc8up3tz3rzan2a3u0vl /cosmos.staking.v1beta1.MsgDelegate --from kujira --ledger --chain-id kaiyo-1 --node https://rpc.cosmos.directory:443/kujira --gas auto --gas-prices 0.0250ukuji --gas-adjustment 1.5
```  
----------------  

### _Lum_  
```shell
git clone https://github.com/lum-network/chain restake_lumnetwork && cd restake_lumnetwork && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
lumd keys add lum --ledger
```  
It will generate your address under the wallet name "lum" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
lumd tx authz grant lum1mjq48r6435aewerpruwc8up3tz3rzan2enr75p generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from lum --ledger --chain-id lum-network-1 --node https://rpc.cosmos.directory:443/lumnetwork --gas auto --gas-prices 0.0250ulum --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
lumd tx authz revoke lum1mjq48r6435aewerpruwc8up3tz3rzan2enr75p /cosmos.staking.v1beta1.MsgDelegate --from lum --ledger --chain-id lum-network-1 --node https://rpc.cosmos.directory:443/lumnetwork --gas auto --gas-prices 0.0250ulum --gas-adjustment 1.5
```  
----------------  

### _Medibloc_  
No Authz support yet.  

----------------  

### _Meme_  
```shell
git clone https://github.com/memecosmos/meme/ restake_meme && cd restake_meme && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
memed keys add meme --ledger
```  
It will generate your address under the wallet name "meme" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
memed tx authz grant meme1mjq48r6435aewerpruwc8up3tz3rzan2jxgqxl generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from meme --ledger --chain-id meme-1 --node https://rpc.cosmos.directory:443/meme --gas auto --gas-prices 0.025umeme --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
memed tx authz revoke meme1mjq48r6435aewerpruwc8up3tz3rzan2jxgqxl /cosmos.staking.v1beta1.MsgDelegate --from meme --ledger --chain-id meme-1 --node https://rpc.cosmos.directory:443/meme --gas auto --gas-prices 0.025umeme --gas-adjustment 1.5
```  

----------------  

### _Nomic_  
No Authz support yet.  

----------------  

### _Omniflix_  
```shell
git clone https://github.com/OmniFlix/omniflixhub restake_omniflixhub && cd restake_omniflixhub && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
omniflixhubd keys add omniflix --ledger
```  
It will generate your address under the wallet name "omniflix" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
omniflixhubd tx authz grant omniflix1mjq48r6435aewerpruwc8up3tz3rzan2380wkt generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from omniflix --ledger --chain-id omniflixhub-1 --node https://rpc.cosmos.directory:443/omniflixhub --gas auto --gas-prices 0.0250uflix --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
omniflixhubd tx authz revoke omniflix1mjq48r6435aewerpruwc8up3tz3rzan2380wkt /cosmos.staking.v1beta1.MsgDelegate --from omniflix --ledger --chain-id omniflixhub-1 --node https://rpc.cosmos.directory:443/omniflixhub --gas auto --gas-prices 0.0250uflix --gas-adjustment 1.5
```  

----------------  

### _Oraichain_  
No Authz support yet.  

----------------  

### _Osmosis_  
```shell
git clone https://github.com/osmosis-labs/osmosis restake_osmosis && cd restake_osmosis && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
osmosisd keys add osmosis --ledger
```  
It will generate your address under the wallet name "osmosis" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
osmosisd tx authz grant osmo1mjq48r6435aewerpruwc8up3tz3rzan2yzd8h8 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from osmosis --ledger --chain-id osmosis-1 --node https://rpc.cosmos.directory:443/osmosis --gas auto --gas-prices 0.0025uosmo --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
osmosisd tx authz revoke osmo1mjq48r6435aewerpruwc8up3tz3rzan2yzd8h8 /cosmos.staking.v1beta1.MsgDelegate --from osmosis --ledger --chain-id osmosis-1 --node https://rpc.cosmos.directory:443/osmosis --gas auto --gas-prices 0.0025uosmo --gas-adjustment 1.5
```  
----------------  

### _Passage_  
```shell
git clone https://github.com/envadiv/Passage3D restake_passage && cd restake_passage && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
passage keys add passage --ledger
```  
It will generate your address under the wallet name "passage" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
passage tx authz grant pasg1mjq48r6435aewerpruwc8up3tz3rzan20p8dv2 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from passage --ledger --chain-id passage-1 --node https://rpc.cosmos.directory:443/passage --gas auto --gas-prices 0.0250upasg --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
passage tx authz revoke pasg1mjq48r6435aewerpruwc8up3tz3rzan20p8dv2 /cosmos.staking.v1beta1.MsgDelegate --from passage --ledger --chain-id passage-1 --node https://rpc.cosmos.directory:443/passage --gas auto --gas-prices 0.0250upasg --gas-adjustment 1.5
```  
----------------

### _Persistence_  
```shell
git clone https://github.com/persistenceOne/persistenceCore restake_persistence && cd restake_persistence && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
persistenceCore keys add persistence --ledger
```  
It will generate your address under the wallet name "persistence" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
persistenceCore tx authz grant persistence1mjq48r6435aewerpruwc8up3tz3rzan2z4cy03 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from persistence --ledger --chain-id core-1 --node https://rpc.cosmos.directory:443/persistence --gas auto --gas-prices 0.0250uxprt --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
persistenceCore tx authz revoke persistence1mjq48r6435aewerpruwc8up3tz3rzan2z4cy03 /cosmos.staking.v1beta1.MsgDelegate --from persistence --ledger --chain-id core-1 --node https://rpc.cosmos.directory:443/persistence --gas auto --gas-prices 0.0250uxprt --gas-adjustment 1.5
```  
----------------  

### _Rebus_  
```shell
git clone https://github.com/rebuschain/rebus.core restake_rebus && cd restake_rebus && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
rebusd keys add rebus --ledger
```  
It will generate your address under the wallet name "rebus" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
rebusd tx authz grant rebus1mjq48r6435aewerpruwc8up3tz3rzan2anaz4r generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from rebus --ledger --chain-id reb_1111-1 --node https://rpc.cosmos.directory:443/rebus --gas auto --gas-prices 25000000000.0000arebus --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
rebusd tx authz revoke rebus1mjq48r6435aewerpruwc8up3tz3rzan2anaz4r /cosmos.staking.v1beta1.MsgDelegate --from rebus --ledger --chain-id reb_1111-1 --node https://rpc.cosmos.directory:443/rebus --gas auto --gas-prices 25000000000.0000arebus --gas-adjustment 1.5
```  
---------------- 

### _Regen_  
```shell
git clone https://github.com/regen-network/regen-ledger restake_regen && cd restake_regen && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
regen keys add regen --ledger
```  
It will generate your address under the wallet name "regen" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
regen tx authz grant regen1mjq48r6435aewerpruwc8up3tz3rzan2nm4th3 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from regen --ledger --chain-id regen-1 --node https://rpc.cosmos.directory:443/regen --gas auto --gas-prices 0.03uregen --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
regen tx authz revoke regen1mjq48r6435aewerpruwc8up3tz3rzan2nm4th3 /cosmos.staking.v1beta1.MsgDelegate --from regen --ledger --chain-id regen-1 --node https://rpc.cosmos.directory:443/regen --gas auto --gas-prices 0.03uregen --gas-adjustment 1.5
```  
----------------  

### _Rizon_  
```shell
git clone https://github.com/rizon-world/rizon restake_rizon && cd restake_rizon && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
rizond keys add rizon --ledger
```  
It will generate your address under the wallet name "rizon" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
rizond tx authz grant rizon1mjq48r6435aewerpruwc8up3tz3rzan20yzxdd generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from rizon --ledger --chain-id titan-1 --node https://rpc.cosmos.directory:443/rizon --gas auto --gas-prices 0.0001uatolo --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
rizond tx authz revoke rizon1mjq48r6435aewerpruwc8up3tz3rzan20yzxdd /cosmos.staking.v1beta1.MsgDelegate --from rizon --ledger --chain-id titan-1 --node https://rpc.cosmos.directory:443/rizon --gas auto --gas-prices 0.0001uatolo --gas-adjustment 1.5
```  
----------------  

### _Secret_  
```shell
git clone https://github.com/scrtlabs/SecretNetwork restake_secretnetwork && cd restake_secretnetwork && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
secretd keys add secret --ledger
```  
It will generate your address under the wallet name "secret" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
secretd tx authz grant secret1mjq48r6435aewerpruwc8up3tz3rzan2wu27uf generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from secret --ledger --chain-id secret-4 --node https://rpc.cosmos.directory:443/secretnetwork --gas auto --gas-prices 0.025uscrt --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
secretd tx authz revoke secret1mjq48r6435aewerpruwc8up3tz3rzan2wu27uf /cosmos.staking.v1beta1.MsgDelegate --from secret --ledger --chain-id secret-4 --node https://rpc.cosmos.directory:443/secretnetwork --gas auto --gas-prices 0.025uscrt --gas-adjustment 1.5
```  
----------------  

### _Sentinel_  
```shell
git clone https://github.com/sentinel-official/hub restake_sentinel && cd restake_sentinel && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
sentinelhub keys add sentinel --ledger
```  
It will generate your address under the wallet name "sentinel" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
sentinelhub tx authz grant sent1mjq48r6435aewerpruwc8up3tz3rzan2hzgw96 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from sentinel --ledger --chain-id sentinelhub-2 --node https://rpc.cosmos.directory:443/sentinel --gas auto --gas-prices 0.02udvpn --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
sentinelhub tx authz revoke sent1mjq48r6435aewerpruwc8up3tz3rzan2hzgw96 /cosmos.staking.v1beta1.MsgDelegate --from sentinel --ledger --chain-id sentinelhub-2 --node https://rpc.cosmos.directory:443/sentinel --gas auto --gas-prices 0.02udvpn --gas-adjustment 1.5
```  
----------------  

### _Sifchain_  
```shell
git clone https://github.com/Sifchain/sifnode.git restake_sifchain && cd restake_sifchain && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
sifnoded keys add sifchain --ledger
```  
It will generate your address under the wallet name "sifchain" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
sifnoded tx authz grant sif1mjq48r6435aewerpruwc8up3tz3rzan2fy3pw7 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from sifchain --ledger --chain-id sifchain-1 --node https://rpc.cosmos.directory:443/sifchain --gas auto --gas-prices 1500000000000rowan --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
sifnoded tx authz revoke sif1mjq48r6435aewerpruwc8up3tz3rzan2fy3pw7 /cosmos.staking.v1beta1.MsgDelegate --from sifchain --ledger --chain-id sifchain-1 --node https://rpc.cosmos.directory:443/sifchain --gas auto --gas-prices 1500000000000rowan --gas-adjustment 1.5
```  

----------------  

### _Sommelier_  
```shell
git clone https://github.com/PeggyJV/sommelier restake_sommelier && cd restake_sommelier && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
sommelier keys add sommelier --ledger
```  
It will generate your address under the wallet name "sommelier" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
sommelier tx authz grant somm1mjq48r6435aewerpruwc8up3tz3rzan2q93msl generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from sommelier --ledger --chain-id sommelier-3 --node https://rpc.cosmos.directory:443/sommelier --gas auto --gas-prices 0.0250usomm --gas-adjustment 1.5
```  
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
sommelier tx authz revoke somm1mjq48r6435aewerpruwc8up3tz3rzan2q93msl /cosmos.staking.v1beta1.MsgDelegate --from sommelier --ledger --chain-id sommelier-3 --node https://rpc.cosmos.directory:443/sommelier --gas auto --gas-prices 0.0250usomm --gas-adjustment 1.5
```  
----------------  

### _Stargaze_  
```shell
git clone https://github.com/public-awesome/stargaze restake_stargaze && cd restake_stargaze && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
starsd keys add stargaze --ledger
```  
It will generate your address under the wallet name "stargaze" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
starsd tx authz grant stars1mjq48r6435aewerpruwc8up3tz3rzan2c9f22y generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from stargaze --ledger --chain-id stargaze-1 --node https://rpc.cosmos.directory:443/stargaze --gas auto --gas-prices 0.0250ustars --gas-adjustment 1.5
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
starsd tx authz revoke stars1mjq48r6435aewerpruwc8up3tz3rzan2c9f22y /cosmos.staking.v1beta1.MsgDelegate --from stargaze --ledger --chain-id stargaze-1 --node https://rpc.cosmos.directory:443/stargaze --gas auto --gas-prices 0.0250ustars --gas-adjustment 1.5
```  
----------------  

### _Starname_  
No Authz support yet.  
----------------  

### _Teritori_  
```shell
git clone https://github.com/TERITORI/teritori-chain restake_teritori && cd restake_teritori && make install
```  
You should already have the Cosmos application open, if not, open it! Then run: 
```shell
teritorid keys add teritori --ledger
```  
It will generate your address under the wallet name "teritori" to make it easier to remember using the chain name.  
Now we will enable StakeLab to auto-compound:  
```shell
teritorid tx authz grant tori1mjq48r6435aewerpruwc8up3tz3rzan2wdf769 generic --msg-type /cosmos.staking.v1beta1.MsgDelegate --from teritori --ledger --chain-id teritori-1 --node https://rpc.cosmos.directory:443/teritori --gas auto --gas-prices 0.0250utori --gas-adjustment 1.5
If you want to stop the auto-compounding, one command to revoke the access:  
```shell
teritorid tx authz revoke tori1mjq48r6435aewerpruwc8up3tz3rzan2wdf769 /cosmos.staking.v1beta1.MsgDelegate --from teritori --ledger --chain-id teritori-1 --node https://rpc.cosmos.directory:443/teritori --gas auto --gas-prices 0.0250utori --gas-adjustment 1.5
```  
----------------  

### _Umee_  
No Authz support yet.  
----------------  
