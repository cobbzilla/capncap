#!/bin/bash

function docker_image_exists () {
  REPO="${1:?no repository specified}"
  TAG="${2:?no tag specified}"
  echo docker image ls | grep "${REPO}" | grep -c "${TAG}"
}

function remove_docker_containers () {
  MATCH="${1:?no container match string specified}"
  docker container ls -a \
    | grep "${MATCH}" \
    | awk '{print $1}' \
    | grep -v CONTAINER \
    | xargs -n 1 docker container rm -f 2> /dev/null
}