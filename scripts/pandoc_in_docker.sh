#!/usr/bin/env bash

path_this=$( cd $(dirname "$0"); pwd -L )
if [ -L "$0" ]; then
  path_this=$(dirname $(readlink ${path_this}/$(basename "$0"))) # path relatively to the symlink file
  [[ "$path_this" != /* ]] && path_this=$(cd $(dirname "$0")/${path_this}; pwd -L)
fi

docker run -it --rm --name pandoc --volume "${path_this}/..:/data" --user `id -u`:`id -g` --entrypoint sh pandoc/latex
# docker run -it --rm --name pandoc --volume "${path_this}/..:/data" --user `id -u`:`id -g` pandoc/latex ${@:---help}
