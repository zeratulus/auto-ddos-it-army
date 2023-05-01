#!/bin/bash

#Main idea of Watcher is auto restart of PC when VPN connection or DDoS is gone to up DDoS of russian bastards!

#Get default (main) network interface
NETIFACE=$(route | grep '^default' | grep -o '[^ ]*$');
WATCHER=true;
COUNTER=0;
MAX_TRIES=10;

while [ $WATCHER ]; do
  sleep 5;

  SPEED=$("$PWD"/ifstat "$NETIFACE" | grep "$NETIFACE" | grep -Eo '[0-9+]{1,99} [0-9+]{1,99}' | tail -1 | awk '{print $1}');

  if [ "$SPEED" -lt 1024 ]; then
    ((++COUNTER));
  fi

  if [ "$SPEED" -gt 1024 ]; then
    COUNTER=0;
  fi

  if [ $COUNTER -gt $MAX_TRIES ]; then
    shutdown -r now
  fi

  echo "Speed: $SPEED, Counter: $COUNTER"

done