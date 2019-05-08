#!/bin/bash

targetFile="pod-templates/generated-sleep5s-batch.yaml"
rm -rf $targetFile
touch $targetFile

echo "apiVersion: batch/v1" >> ${targetFile}
echo "kind: Job" >> ${targetFile}
echo "metadata:" >> ${targetFile}
echo "  name: sleep-10" >> ${targetFile}
echo "spec:" >> ${targetFile}
echo "  template:" >> ${targetFile}
echo "    spec:" >> ${targetFile}
echo "      containers:" >> ${targetFile}

c=1
while [ $c -le 10 ]
do
   echo “Execute $c times”
   echo "      -name: sleep$c" >> $targetFile
   echo "       image: \"alpine:latest\"" >> $targetFile
   echo "       command: [\"sleep\", \"5\"]" >> $targetFile
   echo "       resources:" >> $targetFile
   echo "         requests:" >> $targetFile
   echo "           cpu: \"500m\"" >> $targetFile
   echo "           memory: \"500M\"" >> $targetFile
   (( c++ ))
done
