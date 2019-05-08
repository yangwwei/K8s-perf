#!/bin/bash
export HADOOP_CONF_DIR=/tmp/hadoop-config
SPARK_HOME=/opt/spark-2.4.0-bin-hadoop2.7
${SPARK_HOME}/bin/spark-submit --class org.apache.spark.examples.SparkPi \
--master yarn \
--deploy-mode client \
--driver-memory 512m \
--executor-memory 512m \
--executor-cores 1 \
--conf spark.executorEnv.YARN_CONTAINER_RUNTIME_TYPE=docker \
--conf spark.executorEnv.YARN_CONTAINER_RUNTIME_DOCKER_IMAGE=tangzhankun/spark:da \
--conf spark.executorEnv.YARN_CONTAINER_RUNTIME_DOCKER_MOUNTS=/etc/passwd:/etc/passwd:ro \
--conf spark.dynamicAllocation.enabled=false \
/home/yarn/pyspark-sleep.py \
10
