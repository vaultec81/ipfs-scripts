#!/bin/bash


# Install IPFS
wget https://dist.ipfs.io/go-ipfs/v0.7.0/go-ipfs_v0.7.0_linux-amd64.tar.gz -o /tmp/go-ipfs.tar.gz
cd /tmp
tar -xf go-ipfs.tar.gz
cd go-ipfs
./install.sh

# User setup
useradd ipfs-daemon
mkdir /home/ipfs
export IPFS_PATH=/home/ipfs
ipfs init
chown ipfs-daemon -R /home/ipfs


# Install service file
wget https://raw.githubusercontent.com/vaultec81/ipfs-scripts/master/systemd/ipfs.service -o /etc/systemd/system/ipfs.service
systemctl enable ipfs
systemctl start ipfs