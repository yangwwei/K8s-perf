## Run DS on EYARN

- DS cannot directly run on EYARN, because it depends on distributed-cache - HDFS.
- Use a NFS mount doesn't work for DS, it always write/read file from `/home/yarn/DistributedShell`
- Alternatively we setup a HDFS on RM host for distributed cache, for testing purpose only.

## Important Configuration

Default CS configuration only assign 1 container per HB, we need to enable batch allocation,
```
<property>
  <name>yarn.scheduler.capacity.per-node-heartbeat.maximum-container-assignments</name>
  <value>1000</value>
</property>

<property>
  <name>yarn.scheduler.capacity.per-node-heartbeat.maximum-offswitch-assignments</name>
  <value>1000</value>
</property>

<property>
  <name>yarn.scheduler.capacity.per-node-heartbeat.multiple-assignments-enabled</name>
  <value>true</value>
</property>
```
