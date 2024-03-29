#!/usr/bin/env bash

checkInetConnection() {
if ping -q -c 1 -W 1 8.8.8.8 > /dev/null; then
  return 1
else
  return 0
fi
}

#sleep 360;

# Wait for internet connection
isInternet=false
while [ $isInternet == false ]; do
  isInternet=checkInetConnection;
  sleep 1
done

COUNTRIES=('JP' 'US' 'CY' 'DE' 'BE' 'BR' 'BG' 'KH' 'CA' 'CO' 'CZ' 'DK' 'EC' 'EG' 'EE' 'RU' 'GE' 'HK' 'HU' 'IS' 'IE' 'IL' 'LV');
COUNTRY="${COUNTRIES[$[ $RANDOM % ${#COUNTRIES[@]} + 0 ]]}";

#echo "$COUNTRY";

if [ $isInternet ]; then
  echo "Connected to internet";
  chmod +x ~/db1000n/db1000n
  #protonvpn-cli c -f           #Connect to fastest server to your location
  #protonvpn-cli c --tor        #Connect to the fastest Tor server (Plus and Visionary users only)
  protonvpn-cli c --cc "$COUNTRY" #Connect to fastest server in country JP - Japan

  ~/db1000n/db1000n --user-id=302116940
fi