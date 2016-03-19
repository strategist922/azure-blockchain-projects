#!/bin/bash

if [ -f /usr/bin/apt ] ; then
    echo "Using APT package manager"

    apt-get -y update
    apt-get -y install docker.io
elif [ -f /usr/bin/yum ] ; then 
    echo "Using YUM package manager"

    yum -y update
    yum install -y docker

    systemctl start docker
    systemctl enable docker
fi

docker run -d -p 0.0.0.0:80:8181 -p 0.0.0.0:8080:8080 -p 0.0.0.0:8555:8555 ethercamp/ide-standalone#!/bin/bash

if [ -f /usr/bin/apt ] ; then
    echo "Using APT package manager"

    apt-get -y update
    apt-get -y install docker.io
elif [ -f /usr/bin/yum ] ; then 
    echo "Using YUM package manager"

    yum -y update
    yum install -y docker

    systemctl start docker
    systemctl enable docker
fi
# Fetch scripts
cd $HOMEDIR
wget https://raw.githubusercontent.com/marleyg/MSFTLabs/master/DevTestBaaS/linux-bigchaindb/start-blockchain.sh

#####################
# setup the Azure CLI
#####################
time sudo npm install azure-cli -g
time sudo update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100

####################
# Setup BigChainDB
####################

time sudo apt-get -y install git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev libminiupnpc-dev libzmq3-dev
time sudo apt-get install -y software-properties-common

time sudo git clone https://github.com/bigchaindb/bigchaindb
time cd bigchaindb
time sudo docker-compose build
time sudo docker-compose run --rm bigchaindb bigchaindb configure
time sudo apt-get update


