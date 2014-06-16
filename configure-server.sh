#!/bin/sh

seafile-admin setup
cd seafile-server/seahub/seahub/
gunicorn seahub.wsgi:application

