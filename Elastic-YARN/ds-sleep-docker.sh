#!/bin/bash

export DSHELL_JAR="share/hadoop/yarn/hadoop-yarn-applications-distributedshell-3.1.2.jar"
export RUNTIME="docker"
export DOCKER_IMAGE="local/centos:latest"
export DSHELL_CMD="sleep"
export DSHELL_ARGS="5"
export NUM_OF_CONTAINERS="400"

./bin/yarn org.apache.hadoop.yarn.applications.distributedshell.Client \
-jar $DSHELL_JAR \
-shell_env YARN_CONTAINER_RUNTIME_TYPE="$RUNTIME" \
-shell_env YARN_CONTAINER_RUNTIME_DOCKER_IMAGE="$DOCKER_IMAGE" \
-shell_command $DSHELL_CMD \
-shell_args $DSHELL_ARGS \
-num_containers $NUM_OF_CONTAINERS
-master_memory 500
