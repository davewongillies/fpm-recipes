#!/bin/bash

DISTRO="ubuntu-xenial"
[[ ! -z "${2}" ]] && DISTRO="${2}"

if [[ ! -z "${1}" ]]; then
    PACKAGE="${1}"
    docker run -it --rm -v $PWD/${PACKAGE}:/data davewongillies/fpm-recipes:${DISTRO}
else
    echo "You forgot the package dir you want to build"
    exit 1
fi
