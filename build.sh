#!/bin/sh

export ROOT_DIR=`pwd`
export SRC_DIR=$ROOT_DIR/seafile-server/src
export SEARPC_DIR=$SRC_DIR/libsearpc
export CCNET_DIR=$SRC_DIR/ccnet
export SEAFILE_DIR=$SRC_DIR/seafile
export SEAHUB_DIR=$ROOT_DIR/seafile-server/seahub
export ZDB_DIR=$SRC_DIR/libzdb-2.12
export EVHTP_DIR=$SRC_DIR/libevhtp-1.1.6
export BUILD_DIR=$ROOT_DIR/build
export PATCH_DIR=$ROOT_DIR/patches
export CCNET_CONF_DIR=$BUILD_DIR/.ccnet
export SEAFILE_CONF_DIR=$BUILD_DIR/.seaf-server

export PREFIX=$BUILD_DIR
export PATH=$BUILD_DIR/bin:$PATH
export LD_LIBRARY_PATH=$BUILD_DIR/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$BUILD_DIR/lib/pkgconfig:$PKG_CONFIG_PATH
export PYTHONPATH=$SEAHUB_DIR/thirdpart:$BUILD_DIR/lib/python2.7/site-packages

BUILD_SCRIPTS_DIR=$ROOT_DIR/build-scripts

case "$1" in
"zdb")
    $BUILD_SCRIPTS_DIR/zdb-build.sh $2
    ;;
"evhtp")
    $BUILD_SCRIPTS_DIR/evhtp-build.sh $2
    ;;
"searpc")
    $BUILD_SCRIPTS_DIR/searpc-build.sh $2
    ;;
"ccnet")
    $BUILD_SCRIPTS_DIR/ccnet-build.sh $2
    ;;
"seafile")
    $BUILD_SCRIPTS_DIR/seafile-build.sh $2
    ;;
"seahub")
    $BUILD_SCRIPTS_DIR/seahub-deploy.sh
    ;;
*)
    $BUILD_SCRIPTS_DIR/zdb-build.sh $2
    $BUILD_SCRIPTS_DIR/evhtp-build.sh $2
    $BUILD_SCRIPTS_DIR/searpc-build.sh $2
    $BUILD_SCRIPTS_DIR/ccnet-build.sh $2
    $BUILD_SCRIPTS_DIR/seafile-build.sh $2
    $BUILD_SCRIPTS_DIR/seahub-deploy.sh $2
    ;;
esac

<<'COMMEND'

# First clean everything
./clean.sh

# Build libzdb
cd $ZDB_DIR
echo "*******************Building libzdb**************************"
./bootstrap
./configure --prefix=$PREFIX
make -j$1
make install

# Build libevhtp
cd $EVHTP_DIR
echo "*******************Building libevhtp***************************"
cmake -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX .
make -j$1
make install

# Build libsearpc
cd $SEARPC_DIR
echo "*******************Building libsearpc***************************"
./autogen.sh
./configure --prefix=$PREFIX
cp $PATCH_DIR/searpc-marshal.h.libsearpc ./demo/searpc-marshal.h
make -j$1 && make install


# Build ccnet
echo "*******************Building ccnet***************************"
cd $CCNET_DIR
./autogen.sh
./configure --prefix=$PREFIX --disable-client --enable-server
cp $PATCH_DIR/searpc-marshal.h.ccnet ./lib/searpc-marshal.h
make -j$1 && make install


# Build seafile
cd $SEAFILE_DIR
echo "*******************Building seafile***************************"
./autogen.sh
./configure --prefix=$PREFIX --disable-client --enable-server
cp $PATCH_DIR/searpc-marshal.h.seafile ./lib/searpc-marshal.h
make -j$1 && make install


# Deploy Seahub
ccnet-init -c $CCNET_CONF_DIR -n 'ggkitsas'
seaf-server-init -d $SEAFILE_CONF_DIR

cd $SEAHUB_DIR
python manage.py syncdb

