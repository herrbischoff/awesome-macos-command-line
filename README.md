<img src="https://cdn.rawgit.com/herrbischoff/awesome-osx-command-line/master/assets/logo.svg" width="600">

> A curated list of shell commands and tools specific to OS X.
>
> _“You don’t have to know everything. You simply need to know where to find it when necessary.” (John Brunner)_

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome) [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/herrbischoff/awesome-osx-command-line)

If you want to contribute, you are highly encouraged to do so. Please read the [contribution guidelines](contributing.md).

## Table of Contents

- [Appearance](#appearance)
    - [Transparency](#transparency)
    - [Wallpaper](#wallpaper)
- [Applications](#applications)
    - [App Store](#app-store)
    - [Apple Remote Desktop](#apple-remote-desktop)
    - [Safari](#safari)
    - [Sketch](#sketch)
    - [TextEdit](#textedit)
- [Backup](#backup)
    - [Time Machine](#time-machine)
- [Developer](#developer)
    - [App Icons](#app-icons)
    - [Vim](#vim)
    - [Xcode](#xcode)
- [Disks and Volumes](#disks-and-volumes)
    - [Disk Images](#disk-images)
- [Documents](#documents)
- [Finder](#finder)
    - [Files and Folders](#files-and-folders)
    - [Layout](#layout)
    - [Metadata Files](#metadata-files)
    - [Opening Things](#opening-things)
- [Fonts](#fonts)
- [Hardware](#hardware)
    - [Hardware Information](#hardware-information)
    - [Power Management](#power-management)
- [Input Devices](#input-devices)
    - [Keyboard](#keyboard)
- [Media](#media)
    - [Audio](#audio)
    - [Video](#video)
- [Networking](#networking)
    - [Bonjour](#bonjour)
    - [DHCP](#dhcp)
    - [DNS](#dns)
    - [Hostname](#hostname)
    - [Networking Tools](#networking-tools)
    - [TCP/IP](#tcpip)
    - [Wi-Fi](#wi-fi)
- [Package Managers](#package-managers)
- [Printing](#printing)
- [Security](#security)
    - [Gatekeeper](#gatekeeper)
    - [Passwords](#passwords)
    - [Physical Access](#physical-access)
    - [Wiping Data](#wiping-data)
- [Search](#search)
    - [Find](#find)
    - [Locate](#locate)
- [System](#system)
    - [AirDrop](#airdrop)
    - [AppleScript](#applescript)
    - [Basics](#basics)
    - [Clipboard](#clipboard)
    - [FileVault](#filevault)
    - [Information/Reports](#informationreports)
    - [Kernel Extensions](#kernel-extensions)
    - [LaunchAgents](#launchagents)
    - [LaunchServices](#launchservices)
    - [Memory Management](#memory-management)
    - [Notification Center](#notification-center)
    - [QuickLook](#quicklook)
    - [Root User](#root-user)
    - [Safe Mode Boot](#safe-mode-boot)
    - [Software Installation](#software-installation)
    - [Software Update](#software-update)
    - [Spotlight](#spotlight)
- [Terminal](#terminal)
    - [Alternative Terminals](#alternative-terminals)
    - [Shells](#shells)
    - [Terminal Fonts](#terminal-fonts)


## Appearance

### Transparency

#### Reduce Transparency in Menu and Windows
```bash
defaults write com.apple.universalaccess reduceTransparency -bool true
```

#### Restore Default Transparency in Menu and Windows
```bash
defaults write com.apple.universalaccess reduceTransparency -bool false
```

### Wallpaper

#### Set Wallpaper
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
sudo rm -rf /var/db/RemoteManagement && \
sudo rm /Library/Preferences/com.apple.RemoteDesktop.plist && \
rm ~/Library/Preferences/com.apple.RemoteDesktop.plist && \
sudo rm -r /Library/Application\ Support/Apple/Remote\ Desktop/ && \
rm -r ~/Library/Application\ Support/Remote\ Desktop/ && \
rm -r ~/Library/Containers/com.apple.RemoteDesktop
```

### Safari

#### Enable Develop Menu and Web Inspector
```bash
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
```

### Sketch

#### Export Compact SVGs
```bash
defaults write com.bohemiancoding.sketch3 exportCompactSVG -bool yes
```

### TextEdit

#### Use Plain Text Mode as Default
```bash
defaults write com.apple.TextEdit RichText -int 0
```


## Backup

### Time Machine

#### Change Backup Interval
This changes the interval to 30 minutes. The integer value is the time in seconds.
```bash
sudo defaults write /System/Library/Launch Daemons/com.apple.backupd-auto StartInterval -int 1800
```

#### Disable Local Time Machine Backups
```bash
hash tmutil &> /dev/null && sudo tmutil disablelocal
```

#### Prevent Time Machine From Prompting to Use New Hard Drives as Backup Volume
```bash
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
```


## Developer

### App Icons

#### Create App Icon
Function to quickly create an application icon from 1024px master file.
```bash
function mkicns() {
    if [[ -z "$@" ]]; then
        echo "Input file missing"
    else
        filename=${1%.*}
        mkdir $filename.iconset
        sips -z 16 16   $1 --out $filename.iconset/icon_16x16.png
        sips -z 32 32   $1 --out $filename.iconset/icon_16x16@2x.png
        sips -z 32 32   $1 --out $filename.iconset/icon_32x32.png
        sips -z 64 64   $1 --out $filename.iconset/icon_32x32@2x.png
        sips -z 128 128 $1 --out $filename.iconset/icon_128x128.png
        sips -z 256 256 $1 --out $filename.iconset/icon_128x128@2x.png
        sips -z 256 256 $1 --out $filename.iconset/icon_256x256.png
        sips -z 512 512 $1 --out $filename.iconset/icon_256x256@2x.png
        sips -z 512 512 $1 --out $filename.iconset/icon_512x512.png
        cp $1 $filename.iconset/icon_512x512@2x.png
        iconutil -c icns $filename.iconset
        rm -r $filename.iconset
    fi
}
```

### Vim

#### Compile Sane Vim
Compiling MacVim via Homebrew with all bells and whistles, including overriding system Vim.
```bash
brew install macvim --HEAD --with-cscope --with-lua --with-override-system-vim --with-luajit --with-python
```

#### NeoVim
Install the development version of this modern Vim drop-in alternative via Homebrew.
```bash
brew tap neovim/neovim && \
brew install --HEAD neovim
```

### Xcode

#### Install Command Line Tools Without Xcode
```bash
xcode-select --install
```

#### Remove All Unavailable Simulators
```bash
xcrun simctl delete unavailable
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
> Beginning with OS X El Capitan, system file permissions are automatically protected. It's no longer necessary to verify or repair permissions with Disk Utility. ([Source](https://support.apple.com/en-us/HT201560))

#### Set Boot Volume
```bash
bless --mount "/path/to/mounted/volume" --setBoot
```

#### Show All Attached Disks and Partitions
```bash
diskutil list
```

#### View File System Usage
A contiuous stream of file system access info.
```bash
sudo fs_usage
```

### Disk Images

#### Disable Disk Image Verification
```bash
defaults write com.apple.frameworks.diskimages skip-verify -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && \
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
```

#### Make Volume OS X Bootable
```bash
bless --folder "/path/to/mounted/volume/System/Library/CoreServices" --bootinfo --bootefi
```

#### Mount Disk Image
```bash
hdiutil attach /path/to/diskimage.dmg
```

#### Unmount Disk Image
```bash
hdiutil detach /dev/disk2s1
```

#### Write Disk Image to Volume
Like the Disk Utility "Restore" function.
```bash
sudo asr -restore -noverify -source /path/to/diskimage.dmg -target /Volumes/VolumeToRestoreTo
```


## Documents

#### Convert File to HTML
Supported formats are plain text, rich text (rtf) and Microsoft Word (doc/docx).
```bash
textutil -convert html file.ext
```


## Finder

### Files and Folders

#### Hide Folder in Finder
```bash
chflags hidden /path/to/folder/
```
#### Show All File Extensions
```bash
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```

#### Show All Hidden Files
```bash
defaults write com.apple.finder AppleShowAllFiles true
```

#### Restore Default File Visibility
```bash
defaults write com.apple.finder AppleShowAllFiles false
```

#### Show Full Path in Finder Title
```bash
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
```

#### Unhide User Library Folder
```bash
chflags nohidden ~/Library
```

### Layout

#### Disable Smooth Scrolling
Useful if you’re on an older Mac that messes up the animation.
```bash
defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false
```

#### Enable Smooth Scrolling
Revert back to standard behavior.
```bash
defaults write NSGlobalDomain NSScrollAnimationEnabled -bool true
```

#### Disable Rubberband Scrolling
```bash
defaults write -g NSScrollViewRubberbanding -bool false
```

#### Enable Rubberband Scrolling
Revert to default behavior.
```bash
defaults write -g NSScrollViewRubberbanding -bool true
```

#### Expand Save Panel by Default
```bash
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true && \
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
```

#### Hide All Desktop Icons
```bash
defaults write com.apple.finder CreateDesktop -bool false && killall Finder
```

#### Show All Desktop Icons
```bash
defaults write com.apple.finder CreateDesktop -bool true && killall Finder
```

#### Show Path Bar
```bash
defaults write com.apple.finder ShowPathbar -bool true
```

#### Scrollbar Visibility
Possible values: `WhenScrolling`, `Automatic` and `Always`.
```bash
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
```

#### Show Status Bar
```bash
defaults write com.apple.finder ShowStatusBar -bool true
```

#### Save to Disk by Default
Sets default save target to be a local disk, not iCloud.
```bash
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
```

#### Set Current Folder as Default Search Scope
```bash
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
```

#### Set Default Finder Location to Home Folder
```bash
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
```

#### Set Sidebar Icon Size
Sets size to 'medium'.
```bash
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
```
### Metadata Files

#### Disable Creation of Metadata Files on Network Volumes
Avoids creation of `.DS_Store` and AppleDouble files.
```bash
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
```

#### Disable Creation of Metadata Files on USB Volumes
Avoids creation of `.DS_Store` and AppleDouble files.
```bash
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```

### Opening Things

#### Change Working Directory to Finder Path
If multiple windows are open, it chooses the top-most one.
```bash
cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
```

#### Open URL
```bash
open http://www.github.com
```

#### Open File
```bash
open README.md
```

#### Open Applications
You can open applications using `-a`.
```bash
open -a "Google Chrome" http://www.github.com
```

#### Open Folder
```bash
open /path/to/folder/
```

#### Open Current Folder
```bash
open .
```


## Fonts

#### Clear Font Cache for Current User
To clear font caches for all users, put `sudo` in front of this command.
```bash
atsutil databases -removeUser && \
atsutil server -shutdown && \
atsutil server -ping
```


## Hardware

### Hardware Information

#### List All Hardware Ports
```bash
networksetup -listallhardwareports
```

#### Show Connected Device's UDID
```bash
system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' -e '/iPhone/,/Serial/p'
```

#### Show Current Screen Resolution
```bash
system_profiler SPDisplaysDataType | grep Resolution
```

#### Show CPU Brand String
```bash
sysctl -n machdep.cpu.brand_string
```

### Power Management

#### Prevent System Sleep
Prevent sleep for 1 hour:
```bash
caffeinate -u -t 3600
```

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

#### Enable Chime when Charging
Play iOS charging sound when MagSafe is connected.
```bash
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && \
open /System/Library/CoreServices/PowerChime.app
```

#### Disable Chime when Charging
```bash
defaults write com.apple.PowerChime ChimeOnAllHardware -bool false && \
open /System/Library/CoreServices/PowerChime.app
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

#### Enable Key Repeat
Disable the default "press and hold" behavior.
```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```

#### Set Key Repeat Rate
Sets a very fast repeat rate, adjust to taste.
```bash
defaults write NSGlobalDomain KeyRepeat -int 0.02
```


## Media

### Audio

#### Convert Audio File to iPhone Ringtone
```bash
afconvert input.mp3 ringtone.m4r -f m4af
```

#### Disable Sound Effects on Boot
```bash
sudo nvram SystemAudioVolume=" "
```

#### Mute Audio Output
```bash
osascript -e 'set volume output muted true'
```

#### Set Audio Volume
```bash
osascript -e 'set volume 4'
```

#### Play Audio File
You can play all audio formats that are natively supported by QuickTime.
```bash
afplay -q 1 filename.mp3
```

#### Speak Text with System Default Voice
```bash
say 'All your base are belong to us!'
```

### Video

#### Auto-Play Videos in QuickTime Player
```bash
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen 1
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
sudo dscacheutil -flushcache && \
sudo killall -HUP mDNSResponder
```

### Hostname

#### Set Computer Name/Host Name
```bash
sudo scutil --set ComputerName "newhostname" && \
sudo scutil --set HostName "newhostname" && \
sudo scutil --set LocalHostName "newhostname" && \
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "newhostname"
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

### TCP/IP

#### Show Application Using a Certain Port
This outputs all applications currently using port 80.
```bash
sudo lsof -i :80
```

### Wi-Fi

#### Scan Available Access Points
Create a symbolic link to the airport command for easy access:
```bash
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
```
Run a wireless scan:
```bash
airport -s
```

#### Show Local IP Address
```bash
ipconfig getifaddr en0
```

#### Show Wi-Fi Connection History
```bash
defaults read /Library/Preferences/SystemConfiguration/com.apple.airport.preferences | grep LastConnected -A 7
```

#### Show Wi-Fi Network Passwords
Exchange SSID with the SSID of the access point you wish to query the password from.
```bash
security find-generic-password -D "AirPort network password" -a "SSID" -gw
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

#### Expand Print Panel by Default
```bash
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true && \
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
```

#### Quit Printer App After Print Jobs Complete
```bash
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
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

### Passwords

#### Generate Secure Password and Copy to Clipboard
First, install `pwgen` via Homebrew, etc.
```bash
pwgen -Cs 20 1 | tr -d ' ' | tr -d '\n' | pbcopy
```

### Physical Access

#### Lock Screen
```bash
/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
```

### Wiping Data

#### Securely Remove File
```bash
srm /path/to/file
```

#### Securely Remove Folder
```bash
srm -r /path/to/folder/
```

#### Securely Remove Path (Force)
```bash
srm -rf /path/to/complete/destruction
```


## Search

### Find

#### Recursively Delete .DS_Store Files
```bash
find . -type f -name '*.DS_Store' -ls -delete
```

### Locate

#### Build Locate Database
```bash
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
```

#### Search via Locate
The `-i` modifier makes the search case insensitive.
```bash
locate -i *.jpg
```


## System

### AirDrop

#### Enable AirDrop over Ethernet and on Unsupported Macs
```bash
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
```

### AppleScript

#### Execute AppleScript
```bash
osascript /path/to/script.scpt
```

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

#### Uptime
How long since your last restart.
```bash
uptime
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

### LaunchAgents

#### Periodical Job Template
Run job every 5 minutes.
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.example.touchsomefile</string>
    <key>ProgramArguments</key>
    <array>
        <string>touch</string>
        <string>/tmp/helloworld</string>
    </array>
    <key>StartInterval</key>
    <integer>300</integer>
</dict>
</plist>
```

#### Periodical via Calendar Interval Job Template
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.example.touchsomefile</string>
    <key>ProgramArguments</key>
    <array>
        <string>touch</string>
        <string>/tmp/helloworld</string>
    </array>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Minute</key>
        <integer>45</integer>
        <key>Hour</key>
        <integer>13</integer>
        <key>Day</key>
        <integer>7</integer>
    </dict>
</dict>
</plist>
```

#### Monitoring Folder Job Template
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.example.watchhostconfig</string>
    <key>ProgramArguments</key>
    <array>
        <string>syslog</string>
        <string>-s</string>
        <string>-l</string>
        <string>notice</string>
        <string>somebody touched /etc/hostconfig</string>
    </array>
    <key>WatchPaths</key>
    <array>
        <string>/etc/hostconfig</string>
    </array>
</dict>
</plist>
```

### LaunchServices

#### Rebuild LaunchServices Database
To be independent of OS X version, this relies on `locate` to find `lsregister`. If you do not have your `locate` database built yet, [do it](#build-locate-database).
```bash
sudo $(locate lsregister) -kill -seed -r
```

### Memory Management

#### Purge memory cache
```bash
sudo purge
```

### Notification Center

#### Disable Notification Center
```bash
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && \
killall -9 NotificationCenter
```

#### Enable Notification Center
```bash
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
```

### QuickLook

#### Preview via QuickLook
```bash
qlmanage -p /path/to/file
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

### Software Installation

#### Install PKG
```bash
installer -pkg /path/to/installer.pkg -target /
```

### Software Update

#### Install All Available Software Updates
```bash
sudo softwareupdate -ia
```

#### Set Software Update Check Interval
Set to check daily instead of weekly.
```bash
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
```

#### Show Available Software Updates
```bash
sudo softwareupdate -l
```

### Spotlight

#### Disable Indexing
```bash
mdutil -i off -d /path/to/volume
```

#### Enable Indexing
```bash
mdutil -i on /path/to/volume
```

#### Erase Spotlight Index and Rebuild
```bash
mdutil -E /path/to/volume
```

#### Search via Spotlight
```bash
mdfind -name 'searchterm'
```


## Terminal

#### Ring Terminal Bell
Rings the terminal bell (if enabled) and puts a badge on it.
```bash
tput bel
```

### Alternative Terminals

- [iTerm 2](https://iterm2.com) - A better Terminal.app.
- [TotalTerminal](http://totalterminal.binaryage.com) - A system-wide terminal available on a hot-key.

### Shells

#### Bash
Install the latest version and set as current users' default shell:
```bash
brew install bash && \
sudo echo $(brew --prefix)/bin/bash >> /etc/shells && \
chsh -s $(brew --prefix)/bin/bash
```

- [Homepage](https://www.gnu.org/software/bash/) - The default shell for OS X and most other Unix-based operating systems.

#### fish
Install the latest version and set as current users' default shell:
```bash
brew install fish && \
chsh -s $(brew --prefix)/bin/fish
```

- [Homepage](http://fishshell.com) - A smart and user-friendly command line
shell for OS X, Linux, and the rest of the family.
- [The Fishshell Framework](https://github.com/oh-my-fish/oh-my-fish) - Provides core infrastructure to allow you to install packages which extend or modify the look of your shell.

#### Zsh
Install the latest version and set as current users' default shell:
```bash
brew install zsh && \
chsh -s $(brew --prefix)/bin/zsh
```

- [Homepage](http://www.zsh.org) - Zsh is a shell designed for interactive use, although it is also a powerful scripting language.
- [Oh My Zsh](http://ohmyz.sh) - An open source, community-driven framework for managing your ZSH configuration.

### Terminal Fonts

- [Anonymous Pro](http://www.marksimonson.com/fonts/view/anonymous-pro) - A family of four fixed-width fonts designed with coding in mind.
- [Hack](http://sourcefoundry.org/hack/) - Hack is hand groomed and optically balanced to be your go-to code face.
- [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) -  A monospace font, designed for code listings and the like.
- [Input](http://input.fontbureau.com) - A flexible system of fonts designed specifically for code.
- [Meslo](https://github.com/andreberg/Meslo-Font) - Customized version of Apple's Menlo font.
- [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/) - A monospaced font family for user interfaces and coding environments.


## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
