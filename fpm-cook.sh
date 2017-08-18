#!/bin/bash

RECIPE_PATH=${1}

if [[ ! -z "${RECIPE_PATH}" ]]; then
    DISTRO="${2:-ubuntu-xenial}"
    DOCKER_IMAGE="davewongillies/fpm-recipes"


    RECIPE_DIR=$(cut -f1 -d/ <<< ${RECIPE_PATH}/)
    RECIPE_RB=$(cut -f2 -d/ <<< ${RECIPE_PATH}/)

    docker pull ${DOCKER_IMAGE}:${DISTRO}
    docker run --rm -it \
        -v $PWD/${RECIPE_DIR}:/data \
        -v $(dirname ${SSH_AUTH_SOCK}):$(dirname ${SSH_AUTH_SOCK}) \
        -e SSH_AUTH_SOCK=${SSH_AUTH_SOCK} \
        -e "pkg_dir_uid=${UID}" \
        davewongillies/fpm-recipes:${DISTRO} run.sh ${RECIPE_RB:-recipe.rb}
else
    echo "You forgot the package dir you want to build"
    exit 1
fi
