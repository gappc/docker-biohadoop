#!/bin/bash

re='^[0-9]+$'
if ! [[ $1 =~ $re ]]
then
  echo "Usage: docker-run-hadoop.sh NUMBER_OF_SLAVES"
  echo "Master doesn't count as slave, but may be used by Hadoop for computations"
  exit 1
fi

if [ "`ip a | grep veth`" != "" ]
then
  echo "Old docker interfaces found (veth*). Can not start before they are removed"
#  exit 2
fi

COUNTER=$1
#COUNTER=`expr $COUNTER - 1`
for i in $(seq 1 $COUNTER)
do
  echo Starting slave$i...
  gnome-terminal --title="slave$i" --window-with-profile=slave --command "docker run --privileged -h slave$i -i -t docker-biohadoop"
done

echo Starting master...
gnome-terminal --title="master" --window-with-profile=master --command "docker run --privileged -h master -e SLAVES=$1 -i -t docker-biohadoop"
