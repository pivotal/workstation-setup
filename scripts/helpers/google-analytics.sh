#!/usr/bin/env bash

echo "Sending google analytics for $2"

clientID=$1
shift
argsunderscore="$*"
argsunderscore=${argsunderscore// /_}

curl -X POST \
  --silent -o /dev/null \
  --data "v=1&t=event&tid=UA-117461559-1&uid=$(hostname)&cid=${clientID}&ec=setup&ea=${argsunderscore}"  \
  https://www.google-analytics.com/collect 

  