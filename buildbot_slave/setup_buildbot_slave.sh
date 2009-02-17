#!/bin/sh

SLAVE_DIRECTORY="~/.buildbot_slave"
HOST="localhost"
PORT="9990"
ARCHITECTURE="i386-OSX-10.5"
USER=`whoami`
ADMIN_INFO="Dave <cox@rowland.harvard.edu>"
MACHINE_DESCRIPTION="MacBook Pro"

rm -rf $SLAVE_DIRECTORY
mkdir -p $SLAVE_DIRECTORY
buildbot create-slave $SLAVE_DIRECTORY $HOST:$PORT $ARCHITECTURE $USER
echo $ADMIN_INFO > ${1}/info/admin
echo $HOST" - "$MACHINE_DESCRIPTION" - "$ARCHITECTURE  > ${1}/info/host
buildbot start $SLAVE_DIRECTORY
