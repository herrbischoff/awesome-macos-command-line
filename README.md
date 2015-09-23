<img src="https://cdn.rawgit.com/herrbischoff/awesome-osx-command-line/master/assets/logo.svg" width="400">

> A curated list of shell commands and tools specific to OS X.
>
> *“You don’t have to know everything. You simply need to know where to find it when necessary.” (John Brunner)*

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

If you want to contribute, please read the [contribution guidelines](contributing.md).

## Table of Contents

* [Developer](#developer)
* [Disks](#disks)
* [Finder](#finder)
* [Fonts](#fonts)
* [Hardware](#hardware)
* [Input Devices](#input-devices)
* [Media](#media)
* [Networking](#networking)
* [Package Managers](#package-managers)
* [Printing](#printing)
* [Security](#security)
* [System](#system)
* [Miscellaneous](#miscellaneous)


## Developer

### Install command line tools without Xcode
```bash
xcode-select --install
```


## Disks

### Disable sudden motion sensor (useless for SSDs)
```bash
sudo pmset -a sms 0
```

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


## Input Devices

### Disable/enable auto-correct
```bash
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true
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

### Enable/disable Bonjour
```bash
defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"
defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array "/usr/sbin/mDNSResponder" "-launchd"
```

### Remove Apple Remote Desktop settings
```bash
sudo rm -rf /var/db/RemoteManagement  
sudo rm /Library/Preferences/com.apple.RemoteDesktop.plist  
rm ~/Library/Preferences/com.apple.RemoteDesktop.plist
sudo rm -r /Library/Application\ Support/Apple/Remote\ Desktop/ 
rm -r ~/Library/Application\ Support/Remote\ Desktop/
rm -r ~/Library/Containers/com.apple.RemoteDesktop
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

### Show Wi-Fi network passwords
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

### Disable/enable Notification Center
```bash
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && killall -9 NotificationCenter
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
```

### Disable/enable transparency in menu and windows
```bash
defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write com.apple.universalaccess reduceTransparency -bool false
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


## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
