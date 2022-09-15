#!/bin/bash

mkdir -p /etc/nginx/templates/
cp ./nginx/* /etc/nginx/templates/.

(cd src/init && bash *.sh)

/etc/init.d/fcgiwrap start && chmod -R 777 /run/fcgiwrap.socket ./src/cgi-bin templates uploads && bash /docker-entrypoint.sh  nginx -g "daemon off;"
