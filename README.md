# [fpm-recipes](https://hub.docker.com/r/davewongillies/fpm-recipes/)

[![Build Status](https://travis-ci.org/davewongillies/fpm-recipes.svg?branch=master)](https://travis-ci.org/davewongillies/fpm-recipes) [![Docker Hub Build Status](https://img.shields.io/docker/build/davewongillies/fpm-recipes.svg)](https://hub.docker.com/r/davewongillies/fpm-recipes/builds/) ![Docker Hub Build Automated](https://img.shields.io/docker/automated/davewongillies/fpm-recipes.svg) [![Docker Hub Pulls](https://img.shields.io/docker/pulls/davewongillies/fpm-recipes.svg)](https://hub.docker.com/r/davewongillies/fpm-recipes/)

## Overview

My collection of personal [fpm-cookery](https://github.com/bernd/fpm-cookery) recipes. Mostly tested against Ubuntu Xenial 16.04, some recipes might also work against Debian Jessie and Wheezy if you're/I'm lucky

## Recipes
|Name|Version|Description|
|----|-------|-----------|
|[attract](http://www.attractmode.org)|2.3.0-1|A graphical front-end for command line emulators that hides the underlying operating system and is intended to be controlled with a joystick or gamepad|
|[autorandr](https://github.com/wertarbyte/autorandr)|0.0.33-2~4f5e240|Auto-detect the connect display hardware and load the appropiate X11 setup using xrandr or disper|
|[castor](https://git.sr.ht/~julienxx/castor)|0.8.16-2|A Browser for the small internet (Gemini, Gopher, Finger)|
|[ctop](https://ctop.sh)|0.7.1-2|Top-like interface for container metrics|
|[docker-compose](https://github.com/docker/compose)|1.22.0-1|Define and run multi-container applications with Docker|
|[envchain](https://github.com/sorah/envchain)|1.0.1-4|Environment variables meet gnome-keyring|
|[hfdisk](http://www.codesrc.com/gitweb/index.cgi?p=hfdisk.git;a=summary)|0.1-23|Port of the Apple mklinux mac-fdisk pdisk utility to x86.|
|[lagrange](https://gmi.skyjake.fi/lagrange)|0.6.0-1|A Beautiful Gemini Client|
|[lastpass-cli](https://github.com/lastpass/lastpass-cli)|1.3.3-3|LastPass command line interface tool|
|[libcec-daemon](https://github.com/benklop/libcec-daemon)|0.9.5-1|A Linux daemon for connecting libcec to uinput. That is, using your TV to control your PC!|
|[meson](http://mesonbuild.com/)|0.50.1-2|The Meson Build System|
|[neovim](https://github.com/neovim/python-client)|0.2.4-2|Python client to neovim|
|[polybar](https://github.com/polybar/polybar)|3.4.3-1|A fast and easy-to-use status bar|
|[previous](http://previous.alternative-system.com/)|2.2+svn950-1|Previous is a Next computer hardware emulator. It aims to emulate a Next Cube or a Next Station with all its peripheral.|
|[ranger](https://github.com/ranger/ranger)|1.9.3-1|A VIM-inspired filemanager for the console|
|[runc](https://github.com/opencontainers/runc)|1.0.0-rc2-1|CLI tool for spawning and running containers according to the OCI specification|
|[scsi2sd-util](https://www.codesrc.com/mediawiki/index.php?title=SCSI2SD)|4.8.4|Firmware update utility and configuration tool for SCSI2SD SCSI Hard Drive Emulators|
|[scsi2sd-util6](https://www.codesrc.com/mediawiki/index.php?title=SCSI2SD)|6.3.1|Firmware update utility and configuration tool for SCSI2SD SCSI Hard Drive Emulators|
|[smenu](https://github.com/p-gen/smenu)|0.9.16-1|Terminal utility that allows you to use words coming from the standard input to create a nice selection window just below the cursor.|
|[swift-lang](https://swift.org)|4.2-2|Swift is a general-purpose programming language built using a modern approach to safety, performance, and software design patterns.|
|[terminator](https://github.com/gnome-terminator/terminator)|2.0.1-2|multiple GNOME terminals in one window|
|[tflint](https://github.com/wata727/tflint)|0.7.2-1|TFLint is a Terraform linter for detecting errors that can not be detected by terraform plan|
|[trailer-cli](https://github.com/ptsochantaris/trailer-cli)|1.0.8-3|Managing Pull Requests and Issues For GitHub & GitHub Enterprise from the command line|
|[vimb](https://github.com/fanglingsu/vimb)|3.6.0-3|Vimb is a Vim-like web browser that is inspired by Pentadactyl and Vimprobable.|
|[xst](https://github.com/neeasade/xst)|0.8.4-1|xst is a fork of st, which is a simple terminal implementation for X.|
|[zeal](https://zealdocs.org)|2:0.6.1-3|Offline documentation browser inspired by Dash|

## Usage

```
$ ./fpm-cook.sh <recipe_dir_name> (optional <distro-code-name>)
```

Options for distro:

  * ubuntu-focal
  * ubuntu-bionic
  * ubuntu-xenial

## apt repo setup

The packages from this repo also get published to [bintray](https://bintray.com/davewongillies/fpm-recipes). Currently they are only built for Ubuntu 16.04 and 18.04. To add this repo to your system:
1. `sudo apt-key adv --keyserver keyserver.ubuntu.com --recv D401AB61`
1. `echo "deb https://dl.bintray.com/davewongillies/fpm-recipes xenial main" | sudo tee -a /etc/apt/sources.list.d/davewongillies-fpm-recipes.list`
