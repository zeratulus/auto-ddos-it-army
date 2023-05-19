#!/bin/bash

#Main idea of Watcher is auto restart of PC when VPN connection or DDoS is gone to up DDoS of russian bastards!

#Get default (main) network interface
NETIFACE=$(route | grep '^default' | grep -o '[^ ]*$' | grep enp);
WATCHER=true;
COUNTER=0;
MAX_TRIES=11;
RESET_SPEED=100;

while [ $WATCHER ]; do
  sleep 5;

  FLOAT_SPEED_OUT=$(ifstat -i "$NETIFACE" 1 1 | grep -Eo '[0-9+]{1,99}.[0-9+]{1,99}' | tail -1);
  SPEED=${FLOAT_SPEED_OUT%.*}
  if [ "$SPEED" -lt "$RESET_SPEED" ]; then
    ((++COUNTER));
  fi

  if [ "$SPEED" -gt "$RESET_SPEED" ]; then
    COUNTER=0;
  fi

  if [ $COUNTER -gt $MAX_TRIES ]; then
    shutdown -r now
  fi

  echo "Speed: $SPEED, Counter: $COUNTER"

done