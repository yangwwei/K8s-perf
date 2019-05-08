#!/bin/bash
time /Users/wyang/Documents/GitHub/spark/bin/spark-submit \
  --master k8s://http://localhost:8001 \
  --deploy-mode cluster \
  --name spark-pi \
  --class org.apache.spark.examples.SparkPi \
  --conf spark.executor.instances=10000 \
  --conf spark.kubernetes.container.image=cheersyang/spark:2.4.0 \
  --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
  --conf spark.kubernetes.allocation.batch.size=5 \
  --conf spark.kubernetes.allocation.batch.delay=10s \
  local:///opt/spark/examples/jars/spark-examples_2.12-2.4.2.jar
