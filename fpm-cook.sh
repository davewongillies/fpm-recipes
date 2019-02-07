#!/bin/bash

RECIPE_PATH=${1}

if [[ ! -z "${RECIPE_PATH}" ]]; then
    DISTRO="${2:-ubuntu-bionic}"
    DOCKER_IMAGE="davewongillies/fpm-recipes"


    RECIPE_DIR=$(cut -f1 -d/ <<< ${RECIPE_PATH}/)
    RECIPE_RB=$(cut -f2 -d/ <<< ${RECIPE_PATH}/)

    if [[ ! -z "${SSH_AUTH_SOCK}" ]]; then
        SSH_SOCK_ARGS="-v $(dirname ${SSH_AUTH_SOCK}):$(dirname ${SSH_AUTH_SOCK}) -e SSH_AUTH_SOCK=${SSH_AUTH_SOCK}"
    fi

    docker pull ${DOCKER_IMAGE}:${DISTRO}
    docker run --rm -it \
        -v $PWD/${RECIPE_DIR}:/data \
        -e "pkg_dir_uid=${UID}" \
        ${SSH_SOCK_ARGS} \
        davewongillies/fpm-recipes:${DISTRO} run.sh ${RECIPE_RB:-recipe.rb}
else
    echo "You forgot the package dir you want to build"
    exit 1
fi
