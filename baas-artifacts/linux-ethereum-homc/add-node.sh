#!/bin/bash

# print commands and arguments as they are executed
set -x

echo "initializing geth installation"
date
ps axjf

#############
# Parameters
#############

AZUREUSER=$1
HOMEDIR="/home/$AZUREUSER"
VMNAME=`hostname`
echo "User: $AZUREUSER"
echo "User home dir: $HOMEDIR"
echo "vmname: $VMNAME"

# Fetch Genesis and scripts
cd $HOMEDIR
wget https://raw.githubusercontent.com/marleyg/MSFTLabs/master/DevTestBaaS/linux-go-ethereum/lab-seed.json
wget https://raw.githubusercontent.com/marleyg/MSFTLabs/master/DevTestBaaS/linux-go-ethereum/seed-blockchain.sh
wget https://raw.githubusercontent.com/marleyg/MSFTLabs/master/DevTestBaaS/linux-go-ethereum/start-blockchain.sh
wget https://raw.githubusercontent.com/marleyg/MSFTLabs/master/DevTestBaaS/linux-go-ethereum/ssh443.sh
wget https://raw.githubusercontent.com/marleyg/MSFTLabs/master/DevTestBaaS/linux-go-ethereum/attachOne.sh

#####################
# setup the Azure CLI
#####################
time sudo npm install azure-cli -g
time sudo update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100

####################
# Setup (++)Ethereum
####################
sudo add-apt-repository ppa:ethereum/ethereum-qt
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install cpp-ethereum



