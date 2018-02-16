#!/bin/bash

COINCLI=$1
OUTPUTS=$2
NAME=`hostname`

if $COINCLI masternodelist | grep -w $OUTPUTS | grep -q ENABLED; then
  echo "$NAME exists on MNList"
else
  echo "$NAME does not exist on MNList"
  /home/mentatmind/mnbootstrap/nma.sh MNWatcher MNList "I don't see $NAME on the list" 0 &
fi