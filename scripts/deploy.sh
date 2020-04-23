#!/bin/bash
d=$(cut -f2 -d- <<< $DISTRO)
echo $d
yes | gem update --system --force
gem install bundler
bundle install --without system_tests --path=${BUNDLE_PATH:-vendor/bundle}
bundle exec rake package:publish repo=fpm-recipes distro=${d} component=main
