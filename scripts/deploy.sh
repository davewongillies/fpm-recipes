#!/bin/bash
bundle install --without system_tests --path=${BUNDLE_PATH:-vendor/bundle}
bundle exec rake package:publish repo=fpm-recipes distro=xenial component=main
