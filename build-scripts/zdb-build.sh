#!/bin/sh

# Build libzdb
cd $ZDB_DIR
echo "*******************Building libzdb**************************"
./bootstrap
./configure --prefix=$PREFIX
make -j$1
make install
