#!/bin/bash
#=================================================
# name:   n98-magerun.sh
# author: Pawel Bogut <http://pbogut.me>
# date:   10/06/2017
#=================================================
cd $MAGENTO_PATH
echo "Current path: $(pwd)"
n98-magerun "$@"
