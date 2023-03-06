#!/bin/bash

CONTAINER=acmeair-mono-app-minimal-checkpoint
set -x

docker run --name $CONTAINER \
   --privileged \
   --env WLP_CHECKPOINT=applications acmeair-mono-app-minimal

docker commit $CONTAINER acmeair-mono-app-minimal-instanton

docker rm $CONTAINER

