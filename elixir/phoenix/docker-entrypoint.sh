#!/bin/bash
#=================================================
# name:   docker-entrypoint.sh
# author: Pawel Bogut <http://pbogut.me>
# date:   08/07/2017
#=================================================
if [[ $1 == "yarn-and-phx-server" ]]; then
  if [[ ! -z "$ASSETS_PATH" ]] && [[ ! -z "$APP_PATH" ]]; then
    cd $APP_PATH &&
      mix deps.get &&
      cd $ASSETS_PATH &&
      yarn &&
      cd $APP_PATH &&
      mix ecto.create &&
      mix ecto.migrate &&
      mix phx.server
  fi
fi
cd ${APP_PATH:-/}
if [[ $1 == "yarn" ]]; then
  cd ${ASSETS_PATH:-/}
fi
exec $@
