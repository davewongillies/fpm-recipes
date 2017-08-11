#!/bin/bash

RECIPE_PATH=${1}

if [[ ! -z "${RECIPE_PATH}" ]]; then
    DISTRO="${2:-ubuntu-xenial}"
    RECIPE_DIR=$(cut -f1 -d/ <<< ${RECIPE_PATH}/)
    RECIPE_RB=$(cut -f2 -d/ <<< ${RECIPE_PATH}/)
    docker run --rm -v $PWD/${RECIPE_DIR}:/data -e "pkg_dir_uid=${UID}" davewongillies/fpm-recipes:${DISTRO} run.sh ${RECIPE_RB:-recipe.rb}
else
    echo "You forgot the package dir you want to build"
    exit 1
fi
