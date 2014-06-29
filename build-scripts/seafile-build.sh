#!/bin/sh

# Build seafile
cd $SEAFILE_DIR
echo "*******************Building seafile***************************"
./autogen.sh
./configure --prefix=$PREFIX --disable-client --enable-server
cp $PATCH_DIR/searpc-marshal.h.seafile ./lib/searpc-marshal.h
make -j$1 && make install
