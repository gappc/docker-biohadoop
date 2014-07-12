#!/bin/bash

hdfs dfs -mkdir -p /biohadoop/lib
hdfs dfs -copyFromLocal /tmp/lib/* /biohadoop/lib
