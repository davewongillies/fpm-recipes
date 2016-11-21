#!/bin/bash
fpm-cook -q package --tmp-root /tmp --pkg-dir pkg/${DISTRIBUTION}/${RELEASE} recipe.rb
chown -R ${pkg_dir_uid:-0} pkg
