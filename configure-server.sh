#!/bin/sh

ROOT_DIR=`pwd`
SEAHUB_DIR=$ROOT_DIR/seafile-server/seahub
export PYTHONPATH=`pwd`/build/lib/python2.7/site-packages:$SEAHUB_DIR/thirdpart
export PATH=$PATH:`pwd`/build/bin
build/bin/seafile-admin setup

