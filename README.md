# Awesome OS X Command Line

> A curated list of shell commands and tools specific to OS X.


## Table of Contents

* [Developer](#developer)
* [Disks](#disks)
* [Finder](#finder)
* [Fonts](#fonts)
* [Hardware](#hardware)
* [Media](#media)
* [Networking](#networking)
* [Printing](#printing)
* [Package Managers](#package-managers)
* [Security](#security)
* [System](#system)
* [Miscellaneous](#miscellaneous)


## Developer

### Install command line tools without Xcode
```bash
xcode-select --install
```


## Disks

### Repair file permissions
```bash
sudo diskutil repairPermissions /
```

## Finder

### Hide folder in finder
```bash
SetFile -a V <FOLDER>
```

## Fonts

### Clear font cache for all users
```bash
sudo atsutil databases -removeUser
atsutil server -shutdown
atsutil server -ping
```

### Clear font cache for current user
```bash
atsutil databases -removeUser
atsutil server -shutdown
atsutil server -ping
```


## Hardware

### List all hardware ports
```bash
networksetup -listallhardwareports
```

### Show all power management settings
```bash
sudo pmset -g
```


## Media

### Convert audio file to iPhone ringtone
```bash
afconvert input.mp3 ringtone.m4r -f m4af
```

## Networking

### Clear DNS cache
```bash
sudo dscachutil -flushcache && sudo killall -HUP mDNSResponder
```

### Renew DHCP lease
```bash
sudo ipconfig set en0 DHCP
```

### Show DHCP info
```bash
ipconfig getpacket en0
```

### Show Wi-Fi connection history
```bash
defaults read /Library/Preferences/SystemConfiguration/com.apple.airport.preferences | grep LastConnected -A 7
```

## Show Wi-Fi network passwords
```bash
security find-generic-password -ga "ROUTERNAME" | grep "password:"
```


## Package Managers

* [Fink](http://www.finkproject.org) - The full world of Unix Open Source software for Darwin.
* [Homebrew](http://brew.sh) - The missing package manager for OS X.
* [MacPorts](https://www.macports.org) - Compile, install and upgrade either command-line, X11 or Aqua based open-source software.

## Printing

### Clear print queue
```bash
cancel -a -
```


## Security

### Add/remove Gatekeeper exceptions
```bash
spctl --add /path/to/Application.app
spctl --remove /path/to/Application.app
```

### Check FileVault status
```bash
sudo fdesetup status
```

### Securely remove file/directory/force
```bash
srm /path/to/file
srm -r /path/to/directory/
srm -rf /path/to/complete/destruction
```

## System

### Advanced system and performance report
```bash
sudo sysdiagnose -f ~/Desktop/
```

### Check/set/turn off system sleep idle time
```bash
sudo systemsetup -getcomputersleep
sudo systemsetup -setcomputersleep 60
sudo systemsetup -setcomputersleep Never
```

### Copy to/from clipboard
```bash
cat whatever.txt | pbcopy
pbpaste > whatever.txt
```

### Eject all mountable volumes
```bash
osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true)'
```

### Enable/disable root user
```bash
dsenableroot
dsenableroot -d
```

### Enable/disable/check safe mode
```bash
sudo nvram boot-args="-x"
sudo nvram boot-args=""
nvram boot-args
```

### List all apps downloaded from App Store
```bash
find /Applications -path '*Contents/_MASReceipt/receipt' -maxdepth 4 -print |\sed 's#.app/Contents/_MASReceipt/receipt#.app#g; s#/Applications/##'
```

### Load/unload kernel extensions
```bash
sudo kextload -b com.apple.driver.ExampleBundle
sudo kextunload -b com.apple.driver.ExampleBundle
```

### Purge memory cache
```bash
sudo purge
```

### Show/disable/enable autocorrect setting
```bash
defaults read -g NSAutomaticSpellingCorrectionEnabled
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool true
```

### Show build number of OS
```bash
sw_vers
```

### Show current screen resolution
```bash
system_profiler SPDisplaysDataType | grep Resolution
```


## Miscellaneous

### Set wallpaper
```bash
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/path/to/picture.jpg"'
```


