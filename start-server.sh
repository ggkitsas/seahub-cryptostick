#!/bin/sh

ROOT_DIR=`pwd`
SRC_DIR=$ROOT_DIR/seafile-server/src
SEARPC_DIR=$SRC_DIR/libsearpc
CCNET_DIR=$SRC_DIR/ccnet
SEAFILE_DIR=$SRC_DIR/seafile
SEAHUB_DIR=$ROOT_DIR/seafile-server/seahub
ZDB_DIR=$SRC_DIR/libzdb-2.12
EVHTP_DIR=$SRC_DIR/libevhtp-1.1.6
BUILD_DIR=$ROOT_DIR/build
PATCH_DIR=$ROOT_DIR/patches
CCNET_DATA_DIR=$BUILD_DIR/.ccnet
SEAFILE_DATA_DIR=$BUILD_DIR/seafile-data

export CCNET_CONF_DIR=$BUILD_DIR/.ccnet
export SEAFILE_CONF_DIR=$BUILD_DIR/.seaf-server

export PREFIX=$BUILD_DIR
export PATH=$BUILD_DIR/bin:$PATH
export LD_LIBRARY_PATH=$BUILD_DIR/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$BUILD_DIR/lib/pkgconfig:$PKG_CONFIG_PATH
export PYTHONPATH=$SEAHUB_DIR/thirdpart:$BUILD_DIR/lib/python2.7/site-packages


echo "opening ccnet server.."
ccnet-server -c $CCNET_DATA_DIR -d
echo "opening seaf server.."
seaf-server -c $CCNET_DATA_DIR -d $SEAFILE_DATA_DIR
#echo "opening seaf-mon.."
seaf-mon -c $CCNET_DATA_DIR -d $SEAFILE_DATA_DIR
echo "opening http server.."
httpserver -c $CCNET_DATA_DIR -d $SEAFILE_DATA_DIR

echo "running seahub..."
cd $SEAHUB_DIR
python manage.py runserver 0.0.0.0:8000
