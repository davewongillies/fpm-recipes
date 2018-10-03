# [fpm-recipes](https://hub.docker.com/r/davewongillies/fpm-recipes/)

[![Build Status](https://travis-ci.org/davewongillies/fpm-recipes.svg?branch=master)](https://travis-ci.org/davewongillies/fpm-recipes) [![Docker Hub Build Status](https://img.shields.io/docker/build/davewongillies/fpm-recipes.svg)](https://hub.docker.com/r/davewongillies/fpm-recipes/builds/) ![Docker Hub Build Automated](https://img.shields.io/docker/automated/davewongillies/fpm-recipes.svg) [![Docker Hub Pulls](https://img.shields.io/docker/pulls/davewongillies/fpm-recipes.svg)](https://hub.docker.com/r/davewongillies/fpm-recipes/)

## Overview

My collection of personal [fpm-cookery](https://github.com/bernd/fpm-cookery) recipes. Mostly tested against Ubuntu Xenial 16.04, some recipes might also work against Debian Jessie and Wheezy if you're/I'm lucky

## Recipes
|Name|Description|
|----|-----------|
|[attract](http://www.attractmode.org)|A graphical front-end for command line emulators that hides the underlying operating system and is intended to be controlled with a joystick or gamepad|
|[autorandr](https://github.com/wertarbyte/autorandr)|Auto-detect the connect display hardware and load the appropiate X11 setup using xrandr or disper|
|[ctop](https://ctop.sh)|Top-like interface for container metrics|
|[docker-compose](https://github.com/docker/compose)|Define and run multi-container applications with Docker|
|[envchain](https://github.com/sorah/envchain)|Environment variables meet gnome-keyring|
|[lastpass-cli](https://github.com/lastpass/lastpass-cli)|A fast and easy-to-use status bar|
|[libcec-daemon](https://github.com/benklop/libcec-daemon)|A Linux daemon for connecting libcec to uinput. That is, using your TV to control your PC!|
|[neovim](https://github.com/neovim/python-client)|Python client to neovim|
|[polybar](https://github.com/jaagr/polybar)|A fast and easy-to-use status bar|
|[previous](http://previous.alternative-system.com/)|Previous is a Next computer hardware emulator. It aims to emulate a Next Cube or a Next Station with all its peripheral.|
|[ranger](https://github.com/ranger/ranger)|A VIM-inspired filemanager for the console|
|[runc](https://github.com/opencontainers/runc)|CLI tool for spawning and running containers according to the OCI specification|
|[smenu](https://github.com/p-gen/smenu)|Terminal utility that allows you to use words coming from the standard input to create a nice selection window just below the cursor.|
|[swift-lang](https://swift.org)|Swift is a general-purpose programming language built using a modern approach to safety, performance, and software design patterns.|
|[tflint](https://github.com/wata727/tflint)|TFLint is a Terraform linter for detecting errors that can not be detected by terraform plan|
|[trailer-cli](https://github.com/ptsochantaris/trailer-cli)|Managing Pull Requests and Issues For GitHub & GitHub Enterprise from the command line|
|[vimb-webkit2](https://github.com/fanglingsu/vimb)|Vimb is a Vim-like web browser that is inspired by Pentadactyl and Vimprobable.|
|[vimb](https://github.com/fanglingsu/vimb)|Vimb is a Vim-like web browser that is inspired by Pentadactyl and Vimprobable.|
|[xst](https://github.com/neeasade/xst)|xst is a fork of st, which is a simple terminal implementation for X.|
|[zeal](https://zealdocs.org)|Offline documentation browser inspired by Dash|

## Usage

```
$ ./fpm-cook.sh <recipe_dir_name> (optional <distro-code-name>)
```

Options for distro:

  * ubuntu-bionic
  * ubuntu-xenial

## apt repo setup

The packages from this repo also get published to [bintray](https://bintray.com/davewongillies/fpm-recipes). Currently they are only built for Ubuntu 16.04. To add this repo to your system:
1. `sudo apt-key adv --keyserver keyserver.ubuntu.com --recv D401AB61`
1. `echo "deb https://dl.bintray.com/davewongillies/fpm-recipes xenial main" | sudo tee -a /etc/apt/sources.list.d/davewongillies-fpm-recipes.list`
