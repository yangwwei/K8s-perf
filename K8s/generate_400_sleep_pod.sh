#!/bin/bash

targetFile="pod-templates/generated-sleep5s.yaml"
rm -rf $targetFile
touch $targetFile

c=1
while [ $c -le 10 ]
do
   echo “Execute $c times”

   spec=`cat pod-templates/sleep5s.yaml`
   spec=$(sed "s|SLEEPID|sleep-$c|g" <<< "$spec")

   echo "$spec" >> $targetFile
   echo "---" >> $targetFile

   (( c++ ))
done
