#!/bin/bash
#
#### */5 * * * * /home/mentatmind/mnbootstrap/mnwatcher.bash /home/mentatmind/argo-cli ba42f59ca740194a2d842ffc84e4893542b670b79c1d509844aaa75d1090c448-1 | logger
#


COINCLI=$1
OUTPUTS=$2
NAME=`hostname`

if [[ $COINCLI = *"shekel"* || $COINCLI = *"wagerr"* ]]; then
  if $COINCLI masternode status | grep -wq $OUTPUTS; then
    echo "$NAME Status shows Collateral"
  else
    echo "$NAME Status doesn't show collateral"
    /home/mentatmind/mnbootstrap/nma.sh MNWatcher MNList "$NAME Status doesn't show collateral" 0 &
  fi
else
if $COINCLI masternodelist | grep -w $OUTPUTS | grep -q ENABLED; then
  echo "$NAME exists on MNList"
else
  echo "$NAME does not exist on MNList"
  /home/mentatmind/mnbootstrap/nma.sh MNWatcher MNList "I don't see $NAME on the list" 0 &
fi
fi
