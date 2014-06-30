#!/bin/sh

    echo "***********************CCNET LOG*****************************"
    cat build/.ccnet/logs/ccnet.log

    echo "***********************HTTP LOG*****************************"
    cat build/seafile-data/http.log

    echo "***********************SEAFILE LOG*****************************"
    cat build/seafile-data/seafile.log
