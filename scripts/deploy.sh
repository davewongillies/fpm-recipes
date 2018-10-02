#!/bin/bash
d=$(cut -f2 -d- <<< $DISTRO)
echo $d
bundle install --without system_tests --path=${BUNDLE_PATH:-vendor/bundle}
bundle exec rake package:publish repo=fpm-recipes distro=${d} component=main
