#!/usr/bin/env bash

sudo apt update
sudo apt install -y npm
sudo npm install -g m  # Aaron Heckmann's verion manager

MONGOD_VERSION=8.0.15  # `m --stable`  # 8.0.15
MONGOSH_VERSION=2.5.9
MONGOTOOLS_VERSION=100.13.0

echo "y" | m $MONGOD_VERSION  # Non-interactively install the MongoDB version
echo "y" | m mongosh $MONGOSH_VERSION  # Non-interactively install the Mongo Shell version
echo "y" | m tools $MONGOTOOLS_VERSION

# alias mongod="m use $MONGOD_VERSION"
# alias mongosh="m shell $MONGOSH_VERSION"
# export PATH=$PATH:`m bin $MONGOD_VERSION`:~/.local/m/tools/versions/${MONGOTOOLS_VERSION}/bin:~/.local/m/shell/versions/${MONGOSH_VERSION}/bin  # ~/.local/m/versions/${MONGOD_VERSION}/bin
export PATH=$PATH:~/.local/m/versions/${MONGOD_VERSION}:~/.local/m/tools/versions/${MONGOTOOLS_VERSION}/bin:~/.local/m/shell/versions/${MONGOSH_VERSION}/bin  # ~/.local/m/versions/${MONGOD_VERSION}/bin

EXPORT_PATH_STATEMENT=$(cat <<EOF
export PATH=$PATH:~/.local/m/versions/${MONGOD_VERSION}:~/.local/m/tools/versions/${MONGOTOOLS_VERSION}/bin:~/.local/m/shell/versions/${MONGOSH_VERSION}/bin  # ~/.local/m/versions/${MONGOD_VERSION}/bin
EOF)
echo "$EXPORT_PATH_STATEMENT" >> ~/.bashrc

sudo apt install -y python3-pip
sudo pip3 install mtools psutil pymongo --break-system-packages  # Thomas Rucksteiss' mtools

mkdir playground; cd $_

# mlaunch --single
# mlaunch --replicaset --nodes 2 --arbiter
# mlaunch --replicaset --nodes 1 --sharded 3
# mlaunch --replicaset --nodes 1 --sharded tic tac toe
