#!/bin/bash
currentDir=$(pwd)
projectHome="$(dirname "$currentDir")"
#SPARK_HOME=${projectHome}/resources/spark-2.4.0-bin-hadoop2.7

SPARK_HOME=/usr/local/lib/python2.7/site-packages/pyspark

time ${SPARK_HOME}/bin/spark-submit \
  --master k8s://http://localhost:8001 \
  --deploy-mode cluster \
  --conf spark.executor.instances=1 \
  --conf spark.kubernetes.container.image=godatadriven/pyspark:latest \
  --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
  --conf spark.kubernetes.pyspark.pythonVersion=2 \
  --conf spark.kubernetes.allocation.batch.size=5 \
  --conf spark.kubernetes.allocation.batch.delay=1s \
  ${currentDir}/pyspark-sleep.py \
