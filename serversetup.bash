#!/bin/bash

#### Add Swap
echo "Adding Swap"
fallocate -l 2G /mnt/2GB.swap
mkswap /mnt/2GB.swap
swapon /mnt/2GB.swap
echo "/mnt/2GB.swap  none  swap  sw 0  0" >> /etc/fstab
echo "vm.swappiness=80" >> /etc/sysctl.conf

#### Set SSH
echo "Setting SSH"
sed -i '/Port 22/c\Port 31680' /etc/ssh/sshd_config

#### Updates
apt-get update
apt-get -y upgrade
apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev software-properties-common git
add-apt-repository -y ppa:bitcoin/bitcoin
apt-get update
apt-get install -y libdb4.8-dev libdb4.8++-dev libboost-all-dev libevent-dev libminiupnpc-dev
