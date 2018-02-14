#!/bin/bash

COINCLI=$1
OUTPUTS=$2


$COINCLI masternodelist | grep $OUTPUTS


if $COINCLI masternodelist | grep $OUTPUTS; then
  echo exists
else
  echo not found
fi