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
CCNET_CONF_DIR=$BUILD_DIR/.ccnet
SEAFILE_CONF_DIR=$BUILD_DIR/.seaf-server

export PREFIX=$BUILD_DIR
export PATH=$BUILD_DIR/bin:$PATH
export LD_LIBRARY_PATH=$BUILD_DIR/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$BUILD_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

cd $ZDB_DIR
make clean

cd $EVHTP_DIR
make clean

cd $SEARPC_DIR
make clean

cd $CCNET_DIR
make clean

cd $SEAFILE_DIR
make clean

cd $ROOT_DIR
rm -rf $BUILD_DIR/*

#rm -r ccnet
#rm seahub.db
#rm seahub_settings.py
#rm seahub_settings.pyc

