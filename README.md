# dev-docker
This is repository where I keep docker images for my local development.

## How to use

To build images you can use `./build.sh` script. To build all containers
use `./build.sh all`.

By default, current user will be used as a username for containers if you 
want to change that you can set `DOCKERHUB_USER` environmental variable.

## Use examples
Examples directory contains some example `docker-compose.yml` files that 
are using containers from this repository.
