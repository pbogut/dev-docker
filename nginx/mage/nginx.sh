#!/bin/sh
#=================================================
# name:   config.sh
# author: Pawel Bogut <http://pbogut.me>
# date:   11/06/2017
#=================================================

# prepare config
sed -i "s,{{PHP_FPM_HOST}},${PHP_FPM_HOST:-php},"           /etc/nginx/conf.d/default.conf
sed -i "s,{{PHP_FPM_PORT}},${PHP_FPM_HOST:-9000},"          /etc/nginx/conf.d/default.conf
sed -i "s,{{MAGENTO_PATH}},${MAGENTO_PATH:-/var/www/html}," /etc/nginx/conf.d/default.conf

# start nginx
nginx -g "daemon off;"
