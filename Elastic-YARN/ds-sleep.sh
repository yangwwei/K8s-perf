time ./bin/yarn org.apache.hadoop.yarn.applications.distributedshell.Client \
-jar share/hadoop/yarn/hadoop-yarn-applications-distributedshell-3.1.2.jar \
-shell_command "sleep" -shell_args "5" -num_containers=2000 -container_memory=2048
