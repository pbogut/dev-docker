#!/bin/bash
#=================================================
# name:   build.sh
# author: Pawel Bogut <http://pbogut.me>
# date:   10/06/2017
#=================================================
base_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
hub_user=${DOCKERHUB_USER:-$USER}
docker_dir=$(echo $1 | sed 's,:,/,')

if [[ $1 == "all" ]]; then
  find -name Dockerfile | while read l; do
    cd "$base_dir"
    name=$(echo $l | sed 's,\./\([^/]*\)/.*,\1,')
    tag=$(echo $l | sed 's,\./[^/]*/\([^/]*\)/.*,\1,')
    dir=$(echo $l | sed 's,Dockerfile$,,')

    cd "$dir"
    docker build . -t "$hub_user/$name:$tag"
    [[ $2 == "--push" ]] && docker push "$hub_user/$name:$tag"
  done
elif [[ -d "$docker_dir" ]]; then
  name_tag=$(echo $1 | sed 's,/,:,')
  cd $docker_dir \
  && docker build . -t "$hub_user/$name_tag" \
  && [[ $2 == "--push" ]] && docker push "$hub_user/$name_tag"
else
  echo "Usage:"
  echo -e "\tbuild.sh <name:tag|all> [--push]"
  echo ""
  echo "Available containers:"
  find -name Dockerfile | while read l; do
    name=$(echo $l | sed 's,\./\([^/]*\)/.*,\1,')
    tag=$(echo $l | sed 's,\./[^/]*/\([^/]*\)/.*,\1,')
    echo -e "\t$name:$tag"
  done
  echo ""
  echo "Environment variables:"
  echo -e "\tDOCKERHUB_USER: $hub_user"
fi
