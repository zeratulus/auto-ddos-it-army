#!/usr/bin/env bash

checkInetConnection() {
  test_urls="\
  https://www.google.com/ \
  https://www.microsoft.com/ \
  https://www.cloudflare.com/ \
  "

  processes="0"
  pids=""

  for test_url in $test_urls; do
    curl --silent --head "$test_url" > /dev/null &
    pids="$pids $!"
    processes=$(($processes + 1))
  done

  while [ $processes -gt 0 ]; do
    for pid in $pids; do
      if ! ps | grep "^[[:blank:]]*$pid[[:blank:]]" > /dev/null; then
        # Process no longer running
        processes=$(($processes - 1))
        pids=$(echo "$pids" | sed --regexp-extended "s/(^| )$pid($| )/ /g")

        if wait $pid; then
          # Success! We have a connection to at least one public site, so the
          # internet is up. Ignore other exit statuses.
          kill -TERM $pids > /dev/null 2>&1 || true
          wait $pids
          return 0
        fi
      fi
    done
    # wait -n $pids # Better than sleep, but not supported on all systems
    sleep 0.1
  done

  return 1
}

# Wait for internet connection
isInternet = false;
while [ isInternet == false ]; do
  isInternet = checkInetConnection;
  sleep 5
done

if [ isInternet ]; then
  echo "Connected to internet";
  protonvpn-cli c
  /home/user/db1000n/db1000n
else
  echo "No internet connection";
fi