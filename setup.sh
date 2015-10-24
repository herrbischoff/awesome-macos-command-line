#!/bin/bash

# Reduce Transparency in Menu and Windows
defaults write com.apple.universalaccess reduceTransparency -bool true

# Restore Default Transparency in Menu and Windows
defaults write com.apple.universalaccess reduceTransparency -bool false
