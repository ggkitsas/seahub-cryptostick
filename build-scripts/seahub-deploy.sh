#!/bin/sh

# Deploy Seahub
ccnet-init -c $CCNET_CONF_DIR -n 'ggkitsas'
seaf-server-init -d $SEAFILE_CONF_DIR

cd $SEAHUB_DIR
python manage.py syncdb
