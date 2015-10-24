#!/usr/bin/env bash

# OS X Setup

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Media                                                                       #
###############################################################################

# Audio {{{

# Disable Sound Effects on Boot
sudo nvram SystemAudioVolume=" "

# }}}

# vim:foldmethod=marker:foldlevel=0
