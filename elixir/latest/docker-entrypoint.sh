#!/bin/bash
#=================================================
# name:   docker-entrypoint.sh
# author: Pawel Bogut <http://pbogut.me>
# date:   08/07/2017
#=================================================
cd ${APP_PATH:-/}
exec $@
