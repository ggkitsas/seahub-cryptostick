#!/bin/sh

# Deploy Seahub
ccnet-init -c $CCNET_CONF_DIR -n 'privserver' --host `ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
seaf-server-init -d $SEAFILE_CONF_DIR

cd $SEAHUB_DIR
python manage.py syncdb
