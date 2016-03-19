#!/bin/bash

# If there is a problem initializing, check the log file (root permission required)
# /var/log/azure/Microsoft.OSTCExtensions.CustomScriptForLinux/1.4.1.0/extension.log 

# Debug
set -x

echo "Initializing Tendermint installation"
date
#ps axjf

#############
# Parameters
#############

AZUREUSER=$1
HOMEDIR="/home/$AZUREUSER"
VMNAME=`hostname`
CHAINNAME="chain1"
echo "User: $AZUREUSER"
echo "User home dir: $HOMEDIR"


# This is run as root - install Tendermint
time sudo curl -L https://raw.githubusercontent.com/tendermint/tendermint/master/INSTALL/install_env.sh > install_env.sh
time sudo source install_env.sh
time cd /home/tmuser

# As regular user Go
time curl -L https://raw.githubusercontent.com/tendermint/tendermint/master/INSTALL/install_golang.sh > install_golang.sh
time source install_golang.sh

#WARNING: THIS STEP WILL GIVE CONTROL OF THE CURRENT USER TO THE DEV TEAM
time go get -u github.com/tendermint/tendermint/cmd/barak
time nohup barak -config="$GOPATH/src/github.com/tendermint/tendermint/cmd/barak/seed" &

#Update Mint DB
time go get -u github.com/tendermint/tendermint/cmd/tendermint
time mkdir -p ~/.tendermint
time cp $GOPATH/src/github.com/tendermint/tendermint/config/tendermint/genesis.json ~/.tendermint/
time tendermint node --seeds="goldenalchemist.chaintest.net:46656"


