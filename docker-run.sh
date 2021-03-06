#!/bin/bash

# Start services
/usr/sbin/rsyslogd
/usr/sbin/sshd

# Set custom hosts file. this works only in a privileged container!
umount /etc/hosts
cp /tmp/hosts /etc

# Add interface for hadoop with the ip address set to the one specified in /etc/hosts
IP_ADDRESS=`cat /etc/hosts | grep $HOSTNAME$ | cut -d' ' -f 1`
echo $IP_ADDRESS
ifconfig eth0 $IP_ADDRESS
route add default gw 172.17.42.1

# Add slave ssh keys to list of known hosts and start hadoop
if [ "$HOSTNAME" == "master" ]
then
  ssh-keyscan 0.0.0.0 >> /root/.ssh/known_hosts
  ssh-keyscan master >> /root/.ssh/known_hosts
  
  for (( i=1; i<=$SLAVES; i++ ))
  do
	ssh-keyscan slave$i >> /root/.ssh/known_hosts
	echo slave$i >> /opt/hadoop/current/etc/hadoop/slaves
  done

  $HADOOP_HOME/sbin/start-dfs.sh
  $HADOOP_HOME/sbin/start-yarn.sh
  $HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver
  
  $HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/root/examples
  $HADOOP_HOME/bin/hdfs dfs -copyFromLocal /opt/oozie/oozie-4.0.1/examples /user/root
  $OOZIE_HOME/bin/oozied.sh start
  
  # Start ZooKeeper
  $ZOOKEEPER_HOME/bin/zkServer.sh start
  
  # Set custom password
  PASSWORD=`pwgen -N 1`
  echo "root:$PASSWORD" | chpasswd
  echo "*****************************"
  echo "* Root password is $PASSWORD *"
  echo "*****************************"
fi

# Set timezone
echo "Europe/Vienna" > /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

/bin/bash
