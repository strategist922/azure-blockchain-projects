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

docker run -d -p 0.0.0.0:80:8181 -p 0.0.0.0:8080:8080 -p 0.0.0.0:8555:8555 ethercamp/ide-standalone