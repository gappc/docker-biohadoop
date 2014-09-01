#!/bin/bash

#force root: taken from http://unix.stackexchange.com/a/28457
if [ $(id -u) != "0" ]
then
  sudo "$0" "$@"
  exit $?
fi

docker ps -q | xargs docker kill

for i in `sudo ip a | grep veth | awk '{print $2}' | cut -d':' -f 1`
do
  echo Stopping network interface $i...
  sudo ip link delete $i
done
