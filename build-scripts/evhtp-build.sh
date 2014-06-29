#!/bin/sh

# Build libevhtp
cd $EVHTP_DIR
echo "*******************Building libevhtp***************************"
cmake -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX .
make -j$1
make install
