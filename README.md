<img src="https://cdn.rawgit.com/herrbischoff/awesome-osx-command-line/master/assets/logo.svg" width="600">

> A curated list of shell commands and tools specific to OS X.
>
> _“You don’t have to know everything. You simply need to know where to find it when necessary.” (John Brunner)_

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

If you want to contribute, you are highly encouraged to do so. Please read the [contribution guidelines](contributing.md).

## Table of Contents

- [Appearance](#appearance)
    - [Transparency](#transparency)
    - [Wallpaper](#wallpaper)
- [Applications](#applications)
    - [App Store](#app-store)
    - [Apple Remote Desktop](#apple-remote-desktop)
    - [Sketch](#sketch)
- [Backup](#backup)
    - [Time Machine](#time-machine)
- [Developer](#developer)
    - [Xcode](#xcode)
- [Disks and Volumes](#disks-and-volumes)
- [Documents](#documents)
- [Finder](#finder)
- [Fonts](#fonts)
- [Hardware](#hardware)
    - [Hardware Information](#hardware-information)
- [Input Devices](#input-devices)
    - [Keyboard](#keyboard)
- [Media](#media)
    - [Audio](#audio)
- [Networking](#networking)
    - [Bonjour](#bonjour)
    - [DHCP](#dhcp)
    - [DNS](#dns)
    - [Networking Tools](#networking-tools)
    - [Wi-Fi](#wi-fi)
- [Package Managers](#package-managers)
- [Printing](#printing)
- [Security](#security)
    - [Gatekeeper](#gatekeeper)
    - [Wiping Data](#wiping-data)
- [System](#system)
    - [Basics](#basics)
    - [Clipboard](#clipboard)
    - [FileVault](#filevault)
    - [Information/Reports](#information-reports)
    - [Memory Management](#memory-management)
    - [Notification Center](#notification-center)
    - [Root User](#root-user)
    - [Safe Mode Boot](#safe-mode-boot)
    - [Kernel Extensions](#kernel-extensions)


## Appearance

### Transparency

#### Disable Transparency in Menu and Windows
```bash
defaults write com.apple.universalaccess reduceTransparency -bool true
```

#### Enable Transparency in Menu and Windows
```bash
defaults write com.apple.universalaccess reduceTransparency -bool false
```

### Wallpaper

#### Set wallpaper
```bash
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/path/to/picture.jpg"'
```


## Applications

### App Store

#### List All Apps Downloaded from App Store
```bash
find /Applications -path '*Contents/_MASReceipt/receipt' -maxdepth 4 -print |\sed 's#.app/Contents/_MASReceipt/receipt#.app#g; s#/Applications/##'
```

### Apple Remote Desktop

#### Remove Apple Remote Desktop Settings
```bash
sudo rm -rf /var/db/RemoteManagement
sudo rm /Library/Preferences/com.apple.RemoteDesktop.plist
rm ~/Library/Preferences/com.apple.RemoteDesktop.plist
sudo rm -r /Library/Application\ Support/Apple/Remote\ Desktop/
rm -r ~/Library/Application\ Support/Remote\ Desktop/
rm -r ~/Library/Containers/com.apple.RemoteDesktop
```

### Sketch

#### Export Compact SVGs
```bash
defaults write com.bohemiancoding.sketch3 exportCompactSVG -bool yes
```

## Developer

### Xcode

#### Install Command Line Tools Without Xcode
```bash
xcode-select --install
```


## Backup

### Time Machine

#### Change Backup Interval
This changes the interval to 30 minutes. The integer value is the time in seconds.
```bash
sudo defaults write /System/Library/Launch Daemons/com.apple.backupd-auto StartInterval -int 1800
```

## Disks and Volumes

#### Disable Sudden Motion Sensor
Leaving this turned on is useless when you're using SSDs.
```bash
sudo pmset -a sms 0
```

#### Eject All Mountable Volumes
The only reliable way to do this is by sending an AppleScript command to Finder.
```bash
osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true)'
```

#### Repair File Permissions
You don't have to use the Disk Utility GUI for this.
```bash
sudo diskutil repairPermissions /
```


## Documents

#### Convert File to HTML
Supported formats are plain text, rich text (rtf) and Microsoft Word (doc/docx).
```bash
textutil -convert html file.ext
```

## Finder

#### Hide folder in Finder
```bash
chflags hidden /path/to/folder/
```

#### Show All Hidden Files
```bash
defaults write com.apple.finder AppleShowAllFiles true
```

#### Restore Default File Visibility
```bash
defaults write com.apple.finder AppleShowAllFiles false
```

#### Unhide User Library folder
```bash
chflags nohidden ~/Library
```

## Fonts

#### Clear Font Cache for Current User
To clear font caches for all users, put `sudo` in front of this command.
```bash
atsutil databases -removeUser && atsutil server -shutdown && atsutil server -ping
```


## Hardware

### Disable sudden motion sensor (useless for SSDs)
```bash
sudo pmset -a sms 0
```

### Hardware Information

#### List All Hardware Ports
```bash
networksetup -listallhardwareports
```

#### Show Current Screen Resolution
```bash
system_profiler SPDisplaysDataType | grep Resolution
```

### Power Management

#### Show All Power Management Settings
```bash
sudo pmset -g
```

#### Put Display to Sleep After 15 Minutes of Inactivity
```bash
sudo pmset displaysleep 15
```

#### Put Computer to Sleep After 30 Minutes of Inactivity
```bash
sudo pmset sleep 30
```

#### Check System Sleep Idle Time
```bash
sudo systemsetup -getcomputersleep
```

#### Set System Sleep Idle Time to 60 Minutes
```bash
sudo systemsetup -setcomputersleep 60
```

#### Turn Off System Sleep Completely
```bash
sudo systemsetup -setcomputersleep Never
```

## Input Devices

### Keyboard

#### Disable Auto-Correct
```bash
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
```

#### Enable Auto-Correct
```bash
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool true
```

#### Show Auto-Correct Setting
```bash
defaults read -g NSAutomaticSpellingCorrectionEnabled
```


## Media

### Audio

#### Convert Audio File to iPhone Ringtone
```bash
afconvert input.mp3 ringtone.m4r -f m4af
```


## Networking

### Bonjour

#### Disable Bonjour
```bash
defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array "/usr/sbin/mDNSResponder" "-launchd"
```

#### Enable Bonjour
```bash
defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"
```

### DHCP

#### Renew DHCP Lease
```bash
sudo ipconfig set en0 DHCP
```

#### Show DHCP Info
```bash
ipconfig getpacket en0
```

### DNS

#### Clear DNS Cache
```bash
sudo dscachutil -flushcache && sudo killall -HUP mDNSResponder
```

### Networking Tools 

#### Ping a Host to See Whether It’s Available
```bash
ping -o github.com
```

#### Troubleshoot Routing Problems
```bash
traceroute github.com
```

### Wi-Fi

#### Show Wi-Fi Connection History
```bash
defaults read /Library/Preferences/SystemConfiguration/com.apple.airport.preferences | grep LastConnected -A 7
```

#### Show Wi-Fi Network Passwords
```bash
security find-generic-password -ga "ROUTERNAME" | grep "password:"
```


## Package Managers

- [Fink](http://www.finkproject.org) - The full world of Unix Open Source software for Darwin.
- [Homebrew](http://brew.sh) - The missing package manager for OS X.
- [MacPorts](https://www.macports.org) - Compile, install and upgrade either command-line, X11 or Aqua based open-source software.

## Printing

#### Clear Print Queue
```bash
cancel -a -
```


## Security

### Gatekeeper

#### Add Gatekeeper Exception
```bash
spctl --add /path/to/Application.app
```

#### Remove Gatekeeper Exception
```bash
spctl --remove /path/to/Application.app
```

### Wiping Data

#### Securely Remove File
```bash
srm /path/to/file
```

#### Securely Remove Directory
```bash
srm -r /path/to/directory/
```

#### Securely Remove Path (Force)
```bash
srm -rf /path/to/complete/destruction
```


## System

### Basics

#### Restart
```bash
sudo reboot
```

#### Shutdown
```bash
sudo poweroff
```

#### Show Build Number of OS
```bash
sw_vers
```

### Clipboard

#### Copy data to Clipboard
```bash
cat whatever.txt | pbcopy
```

#### Convert Tabs to Spaces for Clipboard Content
```bash
pbpaste | expand | pbcopy
```

#### Copy data from Clipboard
```bash
pbpaste > whatever.txt
```

#### Sort and Strip Duplicate Lines from Clipboard Content
```bash
pbpaste | sort | uniq | pbcopy
```

### FileVault

#### Check FileVault Status
```bash
sudo fdesetup status
```

### Information/Reports

#### Generate Advanced System and Performance Report
```bash
sudo sysdiagnose -f ~/Desktop/
```

### Kernel Extensions

#### Load Kernel Extension
```bash
sudo kextload -b com.apple.driver.ExampleBundle
```

#### Unload Kernel Extensions
```bash
sudo kextunload -b com.apple.driver.ExampleBundle
```

### Memory Management

#### Purge memory cache
```bash
sudo purge
```

### Notification Center

#### Disable Notification Center
```bash
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && killall -9 NotificationCenter
```

#### Enable Notification Center
```bash
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
```

### Root User

#### Enable Root User
```bash
dsenableroot
```

#### Disable Root User
```bash
dsenableroot -d
```

### Safe Mode Boot

#### Check Safe Mode Setting
```bash
nvram boot-args
```

#### Enable Safe Mode
```bash
sudo nvram boot-args="-x"
```

#### Disable Safe Mode
```bash
sudo nvram boot-args=""
```


## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
