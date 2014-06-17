#!/bin/sh

ROOT_DIR=`pwd`
SRC_DIR=$ROOT_DIR/seafile-server/src
SEARPC_DIR=$SRC_DIR/libsearpc-3.0.3-server
CCNET_DIR=$SRC_DIR/ccnet-3.0.3-server
SEAFILE_DIR=$SRC_DIR/seafile-3.0.4-server
SEAHUB_DIR=$ROOT_DIR/seafile-server/seahub
BUILD_DIR=$ROOT_DIR/build
CCNET_CONF_DIR=$BUILD_DIR/.ccnet
SEAFILE_CONF_DIR=$BUILD_DIR/.seaf-server

export PREFIX=$BUILD_DIR
export PATH=$BUILD_DIR/bin:$PATH
export LD_LIBRARY_PATH=$BUILD_DIR/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$BUILD_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

cd $SEARPC_DIR
make clean

cd $CCNET_DIR
make clean

cd $SEAFILE_DIR
make clean

