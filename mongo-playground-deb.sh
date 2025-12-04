#!/usr/bin/env bash

sudo apt update
sudo apt install -y npm
sudo npm install -g m  # Aaron Heckmann's verion manager

MONGOD_VERSION=`m --stable`  # 8.0.15
MONGOSH_VERSION=2.5.9

echo "y" | m $MONGOD_VERSION  # Non-interactively install the MongoDB version
echo "y" | m mongosh $MONGOSH_VERSION  # Non-interactively install the Mongo Shell version

alias mongod="m use $MONGOD_VERSION"
alias mongosh="m shell $MONGOSH_VERSION"
export PATH=$PATH:`m bin $MONGOD_VERSION`

sudo apt install -y python3-pip
sudo pip3 install mtools psutil pymongo --break-system-packages  # Thomas Rucksteiss' mtools

mkdir playground; cd $_
mlaunch --single
# mlaunch --replicaset --nodes 2 --arbiter
# mlaunch --replicaset --nodes 1 --sharded 3
# mlaunch --replicaset --nodes 1 --sharded tic tac toe
