#!/bin/bash

NAME="sfgroups/centos8-ssh"
IMAGE=$NAME

docker ps -a |grep -q "$NAME$"
if [ $? -ne 0 ]; then
	docker run --name $NAME -h $NAME -p 2222:22 $NAME
else
	docker start $NAME
fi
