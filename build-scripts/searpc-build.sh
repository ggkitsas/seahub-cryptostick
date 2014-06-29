#!/bin/sh

# Build libsearpc
cd $SEARPC_DIR
echo "*******************Building libsearpc***************************"
./autogen.sh
./configure --prefix=$PREFIX
cp $PATCH_DIR/searpc-marshal.h.libsearpc ./demo/searpc-marshal.h
make -j$1 && make install
