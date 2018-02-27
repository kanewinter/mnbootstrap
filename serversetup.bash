#!/bin/bash

#### Add Swap
if [ ! -f /mnt/2GB.swap ]; then
echo "Adding Swap"
dd if=/dev/zero of=/mnt/2GB.swap bs=1024 count=2097152
chmod 600 /mnt/2GB.swap
mkswap /mnt/2GB.swap
swapon /mnt/2GB.swap
echo "/mnt/2GB.swap  none  swap  sw 0  0" >> /etc/fstab
echo "vm.swappiness=80" >> /etc/sysctl.conf
sysctl --system
fi

#### Set SSH
echo "Setting SSH"
sed -i '/Port 22/c\Port 31680' /etc/ssh/sshd_config
systemctl restart sshd

#### Updates
echo "Updating"
apt-get update
apt-get -y upgrade
apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev software-properties-common git golang
add-apt-repository -y ppa:bitcoin/bitcoin
apt-get update
apt-get install -y libdb4.8-dev libdb4.8++-dev libboost-all-dev libevent-dev libminiupnpc-dev

echo "Getting paybot"
cd /home/mentatmind
git clone https://github.com/kanewinter/paybot.git
touch /home/mentatmind/paybot/customerdata.dat
touch /home/mentatmind/paybot/payconfig.toml
mkdir /home/mentatmind/go
if [ -z $GOPATH ]; then
echo "export GOPATH=/home/mentatmind/go" >> $HOME/.bashrc
fi
source $HOME/.bashrc
go get github.com/spf13/viper




