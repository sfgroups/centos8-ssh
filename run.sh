#!/bin/bash

IMAGE="sfgroups/centos8-ssh"
NAME=$(basename $IMAGE)

docker ps -a |grep -q "$NAME$"
if [ $? -ne 0 ]; then
	docker run --name $NAME -h $NAME -p 2222:22 $IMAGE
else
	docker start $NAME
fi
