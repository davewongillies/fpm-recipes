#!/bin/bash
apt-get update -qq -y
if fpm-cook -q package --tmp-root /tmp --pkg-dir pkg/${DISTRIBUTION}/${RELEASE} recipe.rb ;then
    chown --quiet --recursive ${pkg_dir_uid:-0} {cache,pkg}
    echo "===> Package built successfully"
else
    echo "===> ERROR: Something went wrong with your recipe, bailing out."
    chown --quiet --recursive ${pkg_dir_uid:-0} cache
    exit 1
fi
