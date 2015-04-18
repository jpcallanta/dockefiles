#!/usr/bin/env bash

NAME=$(basename "${PWD}")
CMD="docker build --no-cache -t='${NAME}' ./"
DOCKER=$(which docker)

${CMD} || exit 1

if [ $# -ne 1 ]; 
then
  ${DOCKER} images | grep ${NAME}
  exit 0
fi

if [ $1 == 'package' ];
then
  ${DOCKER} save ${NAME} > ./${NAME}.tar && gzip -v ./${NAME}.tar
  ${DOCKER} images | grep ${NAME}
fi
