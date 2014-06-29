#!/bin/sh

# Build ccnet
echo "*******************Building ccnet***************************"
cd $CCNET_DIR
./autogen.sh
./configure --prefix=$PREFIX --disable-client --enable-server
cp $PATCH_DIR/searpc-marshal.h.ccnet ./lib/searpc-marshal.h
make -j$1 && make install
