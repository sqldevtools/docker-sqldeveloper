#!/bin/bash

CONFIG=~/.sqldeveloper
TNSNAMES=/etc/tnsnames.ora
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.${USER}.xauth

if [ ! -d "$CONFIG" ]
then
	mkdir "$CONFIG"
fi

if [ -f $TNSNAMES ]
then
	TNS="-v $TNSNAMES:$TNSNAMES"
fi

xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run -ti $TNS -v $CONFIG:/root -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e DISPLAY=$DISPLAY -e XAUTHORITY=$XAUTH sqldeveloper

