#!/bin/bash

if [ $(id -u) != "0" ]
then
  sudo "$0" "$@"  # Modified as suggested below.
  exit $?
fi

docker ps | grep "$1" | awk '{print $1}' | xargs docker kill

for i in `sudo ip a | grep veth | awk '{print $2}' | cut -d':' -f 1`
do
  echo Stopping network interface $i...
  sudo ip link delete $i
done
