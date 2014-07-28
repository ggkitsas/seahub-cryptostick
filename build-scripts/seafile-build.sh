#!/bin/sh

# Build seafile
cd $SEAFILE_DIR
echo "*******************Building seafile***************************"
./autogen.sh
./configure --prefix=$PREFIX \
        --enable-server --disable-client \
        PCSCLITE_CFLAGS="-I/home/cyc0/Projects/smartcards/pcsc-lite-1.8.11/build/include/PCSC/" \
        PCSCLITE_LIBS=-lpcsclite
cp $PATCH_DIR/searpc-marshal.h.seafile ./lib/searpc-marshal.h
make -j$1 && make install
