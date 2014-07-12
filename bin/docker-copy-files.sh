#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/config

PROJECT_HOME=$BIOHADOOP_PROJECT_HOME

function build {
  $MVN_HOME/bin/mvn -f $PROJECT_HOME clean install
}

function copyDependencies {
  JARS=( aopalliance-1.0.jar asm-3.1.jar avro-1.7.4.jar commons-beanutils-1.7.0.jar commons-beanutils-core-1.8.0.jar commons-cli-1.2.jar commons-codec-1.4.jar commons-collections-3.2.1.jar commons-compress-1.4.1.jar commons-configuration-1.6.jar commons-daemon-1.0.13.jar commons-digester-1.8.jar commons-el-1.0.jar commons-httpclient-3.1.jar commons-io-2.4.jar commons-lang-2.6.jar commons-logging-1.1.3.jar commons-math3-3.1.1.jar commons-net-3.1.jar guava-11.0.2.jar hadoop-auth-2.3.0.jar hadoop-common-2.3.0.jar hadoop-hdfs-2.3.0.jar hadoop-yarn-api-2.3.0.jar hadoop-yarn-client-2.3.0.jar hadoop-yarn-common-2.3.0.jar guice-3.0.jar guice-servlet-3.0.jar hadoop-annotations-2.3.0.jar jackson-core-asl-1.8.8.jar jackson-jaxrs-1.8.3.jar jackson-mapper-asl-1.8.8.jar jackson-xc-1.8.3.jar jasper-compiler-5.5.23.jar jasper-runtime-5.5.23.jar java-xmlbuilder-0.4.jar jaxb-api-2.2.2.jar jaxb-impl-2.2.3-1.jar jboss-annotations-api_1.1_spec-1.0.1.Final.jar jdk.tools-1.7.jar jersey-core-1.9.jar jersey-guice-1.9.jar jersey-json-1.9.jar jersey-server-1.9.jar jets3t-0.9.0.jar jettison-1.1.jar jetty-6.1.26.jar jetty-util-6.1.26.jar jsch-0.1.42.jar jsp-api-2.1.jar jsr305-1.3.9.jar log4j-1.2.17.jar paranamer-2.3.jar protobuf-java-2.5.0.jar servlet-api-2.5.jar slf4j-api-1.7.5.jar slf4j-log4j12-1.7.6.jar snappy-java-1.0.4.1.jar stax-api-1.0-2.jar xmlenc-0.52.jar xz-1.0.jar zookeeper-3.4.5.jar )

  $MVN_HOME/bin/mvn -f $PROJECT_HOME dependency:copy-dependencies

  for JAR in ${JARS[@]}
  do
    rm $PROJECT_HOME/target/dependency/$JAR
  done
}

function copyLibRemote {
  ssh root@172.17.0.100 'mkdir -p /tmp/lib'
  ssh root@172.17.0.100 'rm /tmp/lib/*'
  scp -r $PROJECT_HOME/target/dependency/* root@172.17.0.100:/tmp/lib
  scp -r $PROJECT_HOME/target/$BIOHADOOP_CURRENT root@172.17.0.100:/tmp/lib
  scp -r $PROJECT_HOME/target/$BIOHADOOP_CURRENT root@172.17.0.100:/tmp
  ssh root@172.17.0.100 '/opt/hadoop/current/bin/hdfs dfs -mkdir -p /biohadoop/lib'
  ssh root@172.17.0.100 '/opt/hadoop/current/bin/hdfs dfs -copyFromLocal -f /tmp/lib/* /biohadoop/lib/'
}

function copyDataRemote {
  ssh root@172.17.0.100 'mkdir -p /tmp/data'
  ssh root@172.17.0.100 'rm /tmp/data/*'
  scp -r $PROJECT_HOME/data/* root@172.17.0.100:/tmp/data
  ssh root@172.17.0.100 '/opt/hadoop/current/bin/hdfs dfs -mkdir -p /biohadoop/data'
  ssh root@172.17.0.100 '/opt/hadoop/current/bin/hdfs dfs -copyFromLocal -f /tmp/data/* /biohadoop/data/'
}

function copyConfRemote {
  ssh root@172.17.0.100 'mkdir -p /tmp/conf'
  ssh root@172.17.0.100 'rm /tmp/conf/*'
  scp -r $PROJECT_HOME/conf/* root@172.17.0.100:/tmp/conf
  ssh root@172.17.0.100 '/opt/hadoop/current/bin/hdfs dfs -mkdir -p /biohadoop/conf'
  ssh root@172.17.0.100 '/opt/hadoop/current/bin/hdfs dfs -copyFromLocal -f /tmp/conf/* /biohadoop/conf/'
}

#### main part ####
build
copyDependencies
copyLibRemote
copyDataRemote
copyConfRemote
