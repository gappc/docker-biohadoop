#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/config

PROJECT_HOME=$BIOHADOOP_PROJECT_HOME

DEST=$PROJECT_HOME/target/dependency
JARS=( aopalliance-1.0.jar asm-3.1.jar avro-1.7.4.jar commons-beanutils-1.7.0.jar commons-beanutils-core-1.8.0.jar commons-compress-1.4.1.jar commons-daemon-1.0.13.jar commons-digester-1.8.jar commons-el-1.0.jar commons-httpclient-3.1.jar commons-math3-3.1.1.jar commons-net-3.1.jar hadoop-auth-2.3.0.jar hadoop-common-2.3.0.jar hadoop-hdfs-2.3.0.jar hadoop-yarn-api-2.3.0.jar hadoop-yarn-client-2.3.0.jar hadoop-yarn-common-2.3.0.jar guice-3.0.jar guice-servlet-3.0.jar hadoop-annotations-2.3.0.jar jackson-core-asl-1.8.8.jar jackson-jaxrs-1.8.3.jar jackson-mapper-asl-1.8.8.jar jackson-xc-1.8.3.jar jasper-compiler-5.5.23.jar jasper-runtime-5.5.23.jar java-xmlbuilder-0.4.jar jaxb-api-2.2.2.jar jaxb-impl-2.2.3-1.jar jdk.tools-1.7.jar jersey-core-1.9.jar jersey-guice-1.9.jar jersey-json-1.9.jar jersey-server-1.9.jar jets3t-0.9.0.jar jettison-1.1.jar jetty-6.1.26.jar jetty-util-6.1.26.jar jsch-0.1.42.jar jsp-api-2.1.jar jsr305-1.3.9.jar paranamer-2.3.jar servlet-api-2.5.jar snappy-java-1.0.4.1.jar stax-api-1.0-2.jar xmlenc-0.52.jar xz-1.0.jar zookeeper-3.4.5.jar )

cd $PROJECT_HOME
rm $DEST/*.jar
$MVN_HOME/bin/mvn dependency:copy-dependencies

for JAR in ${JARS[@]}
do
  rm $DEST/$JAR
done
