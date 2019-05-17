#!/bin/bash
export KUBECONFIG=~/Downloads/eks-zbig-config

while :
do
  date
  numOfCompleted=`kubectl get pods | grep Completed | wc -l`
  echo "total num of completed pods=${numOfCompleted}"
  if [[ ${numOfCompleted} -gt 2000 ]]; then
    break
  fi
	sleep 1
done
