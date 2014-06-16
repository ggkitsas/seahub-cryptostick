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

export PREFIX=$BULD_DIR
export PATH=$BUILD_DIR/bin:$PATH
export LD_LIBRARY_PATH=$BUILD_DIR/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$BUILD_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

# Build libsearpc
cd $SEARPC_DIR
./autogen
./configure --prefix=$PREFIX
make -j$1 && make install

# Build ccnet
cd $CCNET_DIR
./autogen
./configure --prefix=$PREFIX --disable-client --enable-server
make -j$1 && make install

# Build seafile
cd $SEAFILE_DIR
./autogen
./configure --prefix=$PREFIX --disable-client --enable-server
make -j$1 && make install

# Deploy Seahub
ccnet-init -c $CCNET_CONF_DIR -n 'ggkitsas'
seaf-server-init -d $SEAFILE_CONF_DIR

cd $SEAHUB_DIR
export PYTHONPATH=$SEAHUB_DIR/thirdpart:$BUILD_DIR/lib/python2.7/site-packages
python manage.py syncdb

