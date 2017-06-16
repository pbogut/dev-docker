#!/bin/bash
#=================================================
# name:   artisan.sh
# author: Pawel Bogut <pbogut@ukpos.com> <http://pbogut.me>
# date:   16/06/2017
#=================================================
cd $LARAVEL_PATH
echo "Current path: $(pwd)"
php artisan "$@"
