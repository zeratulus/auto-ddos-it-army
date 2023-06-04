#!/usr/bin/env bash

checkInetConnection() {
if ping -q -c 1 -W 1 8.8.8.8 > /dev/null; then
  return 1
else
  return 0
fi
}

# Wait for internet connection
isInternet=false
while [ $isInternet == false ]; do
  isInternet=checkInetConnection;
  sleep 1
done

if [ $isInternet ]; then
  echo "Connected to internet";
  cd ~ && screen -S "mhddos_proxy" ./mhddos_proxy_linux --user-id=302116940
fi