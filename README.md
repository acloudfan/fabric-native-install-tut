Tutorial: Fabric Native Install
===============================

http://www.acloudfan.com

Shows step by step how to install Fabric without using Docker containers
a.k.a.  Native Install

For instructions
================

Please refer to my blog available at

http://www.ACloudFan.com/hlf-native-install-tut

cryptogen generate --config=crypto-config.yaml --output=crypto-config

export FABRIC_CFG_PATH=$PWD

configtxgen -profile AcmeOrdererGenesis -channelID ordererchannel -outputBlock acme-genesis.block

Launch orderer
export ORDERER_FILELEDGER_LOCATION=$HOME/orderer/ledger
orderer


Create the channel

configtxgen -outputCreateChannelTx ./acme-channel.tx  -profile AcmeChannel -channelID acmechannel
peer channel create -o localhost:7050 -c acmechannel -f ./acme-channel.tx

Launch peer
export CORE_PEER_FILESYSTEMPATH=$HOME/peer/ledger
peer node start


Join the channel
peer channel list

peer channel join -o localhost:7050 -b ./acmechannel.block

peer channel list


Test
peer chaincode install  -n nodecc5 -p ./chaincode -v 1.0 -l node
peer chaincode list --installed

peer chaincode instantiate -C acmechannel -n nodecc5  -v 1.0 -c '{"Args":["init","a","100","b","200"]}'  -o localhost:7050

peer chaincode list --instantiated -C acmechannel
docker ps

set the gopath properly
peer chaincode install  -n gocc -p chaincode_example02 -v 1.0
peer chaincode instantiate -C acmechannel -n gocc  -v 1.0 -c '{"Args":["init","a","100","b","200"]}'  -o localhost:7050

 peer chaincode query -C acmechannel -n gocc  -c '{"Args":["query","a"]}'

 peer chaincode invoke -C acmechannel -n gocc  -c '{"Args":["invoke","a","b","5"]}'