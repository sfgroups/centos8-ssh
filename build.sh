#!/bin/bash
NAME="sfgroups/centos8-ssh"
docker build -t $NAME .
docker push $NAME
