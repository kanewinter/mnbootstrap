#!/bin/bash

COINCLI=$1
OUTPUTS=$2
NAME=`hostname`

$COINCLI masternodelist | grep $OUTPUTS


if $COINCLI masternodelist | grep -w $OUTPUTS; then
  echo exists
else
  echo not found
  ./nma.sh MNWatcher MNList "I don't see $NAME on the list" 2 &
fi