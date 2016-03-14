#!/bin/bash

CONFIG=~/.sqldeveloper

if [ ! -d "$CONFIG" ]
then
	mkdir "$CONFIG"
fi

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.${USER}.xauth

xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run -ti -v $CONFIG:/root -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e DISPLAY=$DISPLAY -e XAUTHORITY=$XAUTH sqldeveloper

