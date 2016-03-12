#!/bin/bash

CONFIG=~/.sqldeveloper

mkdir "$DATA"

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth

touch $XSOCK
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run -ti -v $CONFIG:/root -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e DISPLAY=$DISPLAY -e XAUTHORITY=$XAUTH sqldeveloper

