#!/bin/bash

#Get default (main) network interface
NETIFACE=$(route | grep '^default' | grep -o '[^ ]*$')

#ifstat -S -n -i enp6s0
#ifstat -n -i enp6s0

#      enp6s0
# KB/s in  KB/s out
#  315.79   6710.63
WATCHER=true;

while [ $WATCHER ]; do
  sleep 1;

#How it works
#The -n option is added to ifstat to suppress the periodic repeat of the header lines.
#NR>2{...} tells awk to process the commands in curly braces only if the line number, NR,
# is greater than two. This has the effect of skipping over the header lines.
#if ($1+0<100 && $2+0<100) tests whether both the first field, $, and the second field, $2,
# are less than 100. If they are, then print "Network is slow." is executed. If not, then print
# "Network is fast." is executed.

  ifstat -ni "$NETIFACE" | awk '
      NR>2{
          if ($2+0<1000)
              print "Network activity is slow."
          else
              print "Network activity is fast."
      }'

  echo "After";
done