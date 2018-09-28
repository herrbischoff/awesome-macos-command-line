<h1><img src="https://cdn.rawgit.com/herrbischoff/awesome-macos-command-line/cab824f0/assets/logo.svg" alt="Awesome macOS Command Line" width="600"></h1>

> A curated list of shell commands and tools specific to OS X.
>
> _“You don’t have to know everything. You simply need to know where to find it when necessary.” (John Brunner)_

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome) [![Build Status](https://travis-ci.org/herrbischoff/awesome-macos-command-line.svg?branch=master)](https://travis-ci.org/herrbischoff/awesome-macos-command-line)

If you want to contribute, you are highly encouraged to do so. Please read the [contribution guidelines](contributing.md).

For more terminal shell goodness, please also see this list's sister list [Awesome Command Line Apps](https://github.com/herrbischoff/awesome-command-line-apps).

## Contents

- [Appearance](#appearance)
    - [Transparency](#transparency)
    - [Wallpaper](#wallpaper)
- [Applications](#applications)
    - [App Store](#app-store)
    - [Apple Remote Desktop](#apple-remote-desktop)
    - [Contacts](#contacts)
    - [Google](#google)
    - [iTunes](#itunes)
    - [Mail](#mail)
    - [Safari](#safari)
    - [Sketch](#sketch)
    - [Skim](#skim)
    - [Terminal](#terminal)
    - [TextEdit](#textedit)
    - [Visual Studio Code](#visual-studio-code)
- [Backup](#backup)
    - [Time Machine](#time-machine)
- [Developer](#developer)
    - [Vim](#vim)
    - [Xcode](#xcode)
- [Dock](#dock)
- [Documents](#documents)
- [Files, Disks and Volumes](#files-disks-and-volumes)
    - [APFS](#apfs)
    - [Disk Images](#disk-images)
- [Finder](#finder)
    - [Desktop](#desktop)
    - [Files and Folders](#files-and-folders)
    - [Layout](#layout)
    - [Metadata Files](#metadata-files)
    - [Opening Things](#opening-things)
- [Fonts](#fonts)
- [Functions](#functions)
- [Hardware](#hardware)
    - [Bluetooth](#bluetooth)
    - [Harddisks](#harddisks)
    - [Hardware Information](#hardware-information)
    - [Infrared Receiver](#infrared-receiver)
    - [Power Management](#power-management)
- [Input Devices](#input-devices)
    - [Keyboard](#keyboard)
- [Launchpad](#launchpad)
- [Media](#media)
    - [Audio](#audio)
    - [Video](#video)
- [Networking](#networking)
    - [Bonjour](#bonjour)
    - [DHCP](#dhcp)
    - [DNS](#dns)
    - [Hostname](#hostname)
    - [Network Preferences](#network-preferences)
    - [Networking Tools](#networking-tools)
    - [SSH](#ssh)
    - [TCP/IP](#tcpip)
    - [TFTP](#tftp)
    - [Wi-Fi](#wi-fi)
- [Package Managers](#package-managers)
- [Printing](#printing)
- [Security](#security)
    - [Application Firewall](#application-firewall)
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
	- [Date and Time](#date-and-time)
    - [FileVault](#filevault)
    - [Information/Reports](#informationreports)
    - [Install OS](#install-os)
    - [Kernel Extensions](#kernel-extensions)
    - [LaunchAgents](#launchagents)
    - [LaunchServices](#launchservices)
    - [Login Window](#login-window)
    - [Memory Management](#memory-management)
    - [Notification Center](#notification-center)
    - [QuickLook](#quicklook)
    - [Remote Apple Events](#remote-apple-events)
    - [Root User](#root-user)
    - [Safe Mode Boot](#safe-mode-boot)
    - [Screenshots](#screenshots)
    - [Software Installation](#software-installation)
    - [Software Update](#software-update)
    - [Software Version](#software-version)
    - [Spotlight](#spotlight)
    - [System Integrity Protection](#system-integrity-protection)
- [Terminal](#terminal)
    - [Alternative Terminals](#alternative-terminals)
    - [Shells](#shells)
    - [Terminal Fonts](#terminal-fonts)


## Appearance

### Transparency

#### Transparency in Menu and Windows
```bash
# Reduce Transparency
defaults write com.apple.universalaccess reduceTransparency -bool true

# Restore Default Transparency
defaults write com.apple.universalaccess reduceTransparency -bool false
```


### Wallpaper

#### Set Wallpaper
```bash
# Up to Mountain Lion
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/path/to/picture.jpg"'

# Since Mavericks
sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '/path/to/picture.jpg'" && killall Dock
```


## Applications

### App Store

#### List All Apps Downloaded from App Store

```bash
# Via find
find /Applications -path '*Contents/_MASReceipt/receipt' -maxdepth 4 -print |\sed 's#.app/Contents/_MASReceipt/receipt#.app#g; s#/Applications/##'

# Via Spotlight
mdfind kMDItemAppStoreHasReceipt=1
```

#### Show Debug Menu
Works up to Yosemite.
```bash
# Enable
defaults write com.apple.appstore ShowDebugMenu -bool true

# Disable (Default)
defaults write com.apple.appstore ShowDebugMenu -bool false
```


### Apple Remote Desktop

#### Kickstart Manual Pages
```bash
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -help
```

#### Activate And Deactivate the ARD Agent and Helper
```bash
# Activate And Restart the ARD Agent and Helper
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -restart -agent -console

# Deactivate and Stop the Remote Management Service
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop
```

#### Enable and Disable Remote Desktop Sharing
```bash
# Allow Access for All Users and Give All Users Full Access
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all

# Disable ARD Agent and Remove Access Privileges for All Users
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off
```

#### Remove Apple Remote Desktop Settings
```bash
sudo rm -rf /var/db/RemoteManagement ; \
sudo defaults delete /Library/Preferences/com.apple.RemoteDesktop.plist ; \
defaults delete ~/Library/Preferences/com.apple.RemoteDesktop.plist ; \
sudo rm -r /Library/Application\ Support/Apple/Remote\ Desktop/ ; \
rm -r ~/Library/Application\ Support/Remote\ Desktop/ ; \
rm -r ~/Library/Containers/com.apple.RemoteDesktop
```

### Contacts

#### Debug Mode
```bash
# Enable
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Disable (Default)
defaults write com.apple.addressbook ABShowDebugMenu -bool false
```

### Google

#### Uninstall Google Update
```bash
~/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/ksinstall --nuke
```

### iTunes

#### Keyboard Media Keys
This works up to Yosemite. System Integrity Protection was introduced in El Capitan which prevents system Launch Agents from being unloaded.
```bash
# Stop Responding to Key Presses
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

# Respond to Key Presses (Default)
launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist
```

From El Capitan onwards, you can either disable SIP or resort to a kind of hack, which will make iTunes inaccessible to any user, effectively preventing it from starting itself or its helpers. Be aware that for all intents and purposes this will trash your iTunes installation and may conflict with OS updates down the road.
```bash
sudo chmod 0000 /Applications/iTunes.app
```

### Mail

#### Show Attachments as Icons

```bash
defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes
```

#### Vacuum Mail Index
The AppleScript code below will quit Mail, vacuum the SQLite index, then re-open Mail. On a large email database that hasn't been optimized for a while, this can provide significant improvements in responsiveness and speed.
```applescript
(*
Speed up Mail.app by vacuuming the Envelope Index
Code from: http://web.archive.org/web/20071008123746/http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/
Originally by "pmbuko" with modifications by Romulo
Updated by Brett Terpstra 2012
Updated by Mathias Törnblom 2015 to support V3 in El Capitan and still keep backwards compatibility
Updated by Andrei Miclaus 2017 to support V4 in Sierra
*)

tell application "Mail" to quit
set os_version to do shell script "sw_vers -productVersion"
set mail_version to "V2"
considering numeric strings
    if "10.10" <= os_version then set mail_version to "V3"
    if "10.12" <= os_version then set mail_version to "V4"
    if "10.13" <= os_version then set mail_version to "V5"
    if "10.14" <= os_version then set mail_version to "V6"
end considering

set sizeBefore to do shell script "ls -lnah ~/Library/Mail/" & mail_version & "/MailData | grep -E 'Envelope Index$' | awk {'print $5'}"
do shell script "/usr/bin/sqlite3 ~/Library/Mail/" & mail_version & "/MailData/Envelope\\ Index vacuum"

set sizeAfter to do shell script "ls -lnah ~/Library/Mail/" & mail_version & "/MailData | grep -E 'Envelope Index$' | awk {'print $5'}"

display dialog ("Mail index before: " & sizeBefore & return & "Mail index after: " & sizeAfter & return & return & "Enjoy the new speed!")

tell application "Mail" to activate
```

### Safari

#### Change Default Fonts
```bash
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StandardFontFamily Georgia
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DefaultFontSize 16
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2FixedFontFamily Menlo
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DefaultFixedFontSize 14
```

#### Enable Develop Menu and Web Inspector
```bash
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true
```

#### Get Current Page Data
Other options: `get source`, `get text`.
```bash
osascript -e 'tell application "Safari" to get URL of current tab of front window'
```

#### Use Backspace/Delete to Go Back a Page
```bash
# Enable
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool YES

# Disable
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool NO
```

### Sketch

#### Export Compact SVGs
```bash
defaults write com.bohemiancoding.sketch3 exportCompactSVG -bool yes
```

### Skim

#### Turn Off Auto Reload Dialog
Removes the dialog and defaults to auto reload.
```bash
defaults write -app Skim SKAutoReloadFileUpdate -boolean true
```
### Terminal

#### Focus Follows Mouse
```bash
# Enable
defaults write com.apple.Terminal FocusFollowsMouse -string YES

# Disable
defaults write com.apple.Terminal FocusFollowsMouse -string NO
```

### TextEdit

#### Use Plain Text Mode as Default
```bash
defaults write com.apple.TextEdit RichText -int 0
```

### Visual Studio Code

#### Fix VSCodeVim Key Repeat
```bash
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

## Backup

### Time Machine

#### Change Backup Interval
This changes the interval to 30 minutes. The integer value is the time in seconds.
```bash
sudo defaults write /System/Library/LaunchDaemons/com.apple.backupd-auto StartInterval -int 1800
```

#### Local Backups
Whether Time Machine performs local backups while the Time Machine backup volume is not available.
```bash
# Status
defaults read /Library/Preferences/com.apple.TimeMachine MobileBackups

# Enable (Default)
sudo tmutil enablelocal

# Disable
sudo tmutil disablelocal
```

Since High Sierra, you cannot disable local snapshots. Time Machine now always creates a local APFS snapshot and uses that snapshot as the data source to create a regular backup, rather than using the live disk as the source, as is the case with HFS formatted disks.

#### Prevent Time Machine from Prompting to Use New Hard Drives as Backup Volume
```bash
sudo defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
```

#### Show Time Machine Logs
This little script will output the last 12 hours of Time Machine activity followed by live activity.
```bash
#!/bin/sh

filter='processImagePath contains "backupd" and subsystem beginswith "com.apple.TimeMachine"'

# show the last 12 hours
start="$(date -j -v-12H +'%Y-%m-%d %H:%M:%S')"

echo ""
echo "[History (from $start)]"
echo ""

log show --style syslog --info --start "$start" --predicate "$filter"

echo ""
echo "[Following]"
echo ""

log stream --style syslog --info --predicate "$filter"
```

#### Toggle Backup While on Battery
```bash
# Status
sudo defaults read /Library/Preferences/com.apple.TimeMachine RequiresACPower

# Enable (Default)
sudo defaults write /Library/Preferences/com.apple.TimeMachine RequiresACPower -bool true

# Disable
sudo defaults write /Library/Preferences/com.apple.TimeMachine RequiresACPower -bool false
```

#### Verify Backup
Beginning in OS X 10.11, Time Machine records checksums of files copied into snapshots. Checksums are not retroactively computed for files that were copied by earlier releases of OS X.
```bash
sudo tmutil verifychecksums /path/to/backup
```

## Developer

### Vim

#### Compile Sane Vim
Compiling MacVim via Homebrew with all bells and whistles, including overriding system Vim.
```bash
brew install macvim --HEAD --with-cscope --with-lua --with-override-system-vim --with-luajit --with-python
```

#### Neovim
Install the development version of this modern Vim drop-in alternative via Homebrew.
```bash
brew install neovim/neovim/neovim
```

### Xcode

#### Install Command Line Tools without Xcode
```bash
xcode-select --install
```

#### Remove All Unavailable Simulators
```bash
xcrun simctl delete unavailable
```


## Dock

#### Add a Stack with Recent Applications
```bash
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }' && \
killall Dock
```

#### Add a Nameless Stack Folder and Small Spacer
```bash
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = {}; "tile-type"="small-spacer-tile"; }' && \
killall Dock
```

#### Add a Space
```bash
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && \
killall Dock
```

#### Add a Small Space
```bash
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}' && \
killall Dock
```

#### Auto Rearrange Spaces Based on Most Recent Use
```bash
# Enable (Default)
defaults write com.apple.dock mru-spaces -bool true && \
killall Dock

# Disable
defaults write com.apple.dock mru-spaces -bool false && \
killall Dock
```

#### Icon Bounce
Global setting whether Dock icons should bounce when the respective application demands your attention.
```bash
# Enable (Default)
defaults write com.apple.dock no-bouncing -bool true && \
killall Dock

# Disable
defaults write com.apple.dock no-bouncing -bool false && \
killall Dock
```

#### Lock the Dock Size
```bash
# Enable
defaults write com.apple.Dock size-immutable -bool yes && \
killall Dock

# Disable (Default)
defaults write com.apple.Dock size-immutable -bool no && \
killall Dock
```

#### Reset Dock
```bash
defaults delete com.apple.dock && \
killall Dock
```

#### Resize
Fully resize your Dock's body. To resize change the `0` value as an integer.
```bash
defaults write com.apple.dock tilesize -int 0 && \
killall Dock
```

#### Scroll Gestures
Use your touchpad or mouse scroll wheel to interact with Dock items. Allows you to use an upward scrolling gesture to open stacks. Using the same gesture on applications that are running invokes Exposé/Mission Control.
```bash
# Enable
defaults write com.apple.dock scroll-to-open -bool true && \
killall Dock

# Disable (Default)
defaults write com.apple.dock scroll-to-open -bool false && \
killall Dock
```

#### Enable Dock Autohide

``` bash
defaults write com.apple.dock autohide -bool true && \
killall Dock
```

#### Set Auto Show/Hide Delay
The float number defines the show/hide delay in ms.
```bash
defaults write com.apple.dock autohide-time-modifier -float 0.4 && \
defaults write com.apple.dock autohide-delay -float 0 && \
killall Dock
```

#### Show Hidden App Icons
```bash
# Enable
defaults write com.apple.dock showhidden -bool true && \
killall Dock

# Disable (Default)
defaults write com.apple.dock showhidden -bool false && \
killall Dock
```

#### Show Only Active Applications
```bash
# Enable
defaults write com.apple.dock static-only -bool true && \
killall Dock

# Disable (Default)
defaults write com.apple.dock static-only -bool false && \
killall Dock
```

## Documents

#### Convert File to HTML
Supported formats are plain text, rich text (rtf) and Microsoft Word (doc/docx).
```bash
textutil -convert html file.ext
```


## Files, Disks and Volumes

#### Create an Empty File
Creates an empty 10 gigabyte test file.
```bash
mkfile 10g /path/to/file
```

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
# Up to Yosemite
bless --mount "/path/to/mounted/volume" --setBoot

# From El Capitan
sudo systemsetup -setstartupdisk /System/Library/CoreServices
```

#### Show All Attached Disks and Partitions
```bash
diskutil list
```

#### View File System Usage
A continuous stream of file system access info.
```bash
sudo fs_usage
```
### APFS

Available since High Sierra. There is no central utility and usage is inconsistent as most functionality is rolled into `tmutil`.

#### Convert Volume from HFS+ to APFS
```bash
/System/Library/Filesystems/apfs.fs/Contents/Resources/hfs_convert /path/to/file/system
```

#### Create New APFS Filesystem
```bash
/System/Library/Filesystems/apfs.fs/Contents/Resources/newfs_apfs /path/to/device
```

#### Create Snapshot
```bash
tmutil localsnapshot
```

#### Delete Snapshot
```bash
tmutil deletelocalsnapshots com.apple.TimeMachine.2018-01-26-044042
````

#### List Snapshots
```bash
tmutil listlocalsnapshots /
```

#### Mount Snapshot
Snapshots are read-only.
```bash
mkdir ~/mnt
/System/Library/Filesystems/apfs.fs/Contents/Resources/mount_apfs -s com.apple.TimeMachine.2018-01-26-044042 / ~/mnt
```

### Disk Images

#### Create Disk Image From Folder Contents
```bash
hdiutil create -volname "Volume Name" -srcfolder /path/to/folder -ov diskimage.dmg
```

If you'd like to encrypt the disk image:
```bash
hdiutil create -encryption -stdinpass -volname "Volume Name" -srcfolder /path/to/folder -ov encrypted.dmg
```

By default, you'll be prompted for a password. You can automate that by piping in a password:
```bash
echo -n YourPassword | hdiutil create -encryption -stdinpass -volname "Volume Name" -srcfolder /path/to/folder -ov encrypted.dmg
```

#### Burn Disk Images to DVD
This command applies to .iso, .img and .dmg images.
```bash
hdiutil burn /path/to/image_file
```

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


## Finder

### Desktop

#### Show External Media
External HDs, thumb drives, etc.
```bash
# Enable
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
killall Finder

# Disable (Default)
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false && \
killall Finder
```

#### Show Internal Media
Built-in HDs or SSDs.
```bash
# Enable
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
killall Finder

# Disable (Default)
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false && \
killall Finder
```

#### Show Removable Media
CDs, DVDs, iPods, etc.
```bash
# Enable
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true && \
killall Finder

# Disable (Default)
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false && \
killall Finder
```

#### Show Network Volumes
AFP, SMB, NFS, WebDAV, etc.
```bash
# Enable
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
killall Finder

# Disable (Default)
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false && \
killall Finder
```

### Files and Folders

#### Clear All ACLs
```bash
sudo chmod -RN /path/to/folder
```

#### Hide Folder in Finder
```bash
chflags hidden /path/to/folder/
```
#### Show All File Extensions
```bash
defaults write -g AppleShowAllExtensions -bool true
```

#### Show Hidden Files
```bash
# Show All
defaults write com.apple.finder AppleShowAllFiles true

# Restore Default File Visibility
defaults write com.apple.finder AppleShowAllFiles false
```

#### Remove Protected Flag
```bash
sudo chflags -R nouchg /path/to/file/or/folder
```

#### Show Full Path in Finder Title
```bash
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
```

#### Unhide User Library Folder
```bash
chflags nohidden ~/Library
```

#### Increase Number of Recent Places
```bash
defaults write -g NSNavRecentPlacesLimit -int 10 && \
killall Finder
```

### Layout

#### Show "Quit Finder" Menu Item
Makes possible to see Finder menu item "Quit Finder" with default shortcut <kbd>Cmd</kbd> + <kbd>Q</kbd>
```bash
# Enable
defaults write com.apple.finder QuitMenuItem -bool true && \
killall Finder

# Disable (Default)
defaults write com.apple.finder QuitMenuItem -bool false && \
killall Finder
```

#### Smooth Scrolling
Useful if you’re on an older Mac that messes up the animation.
```bash
# Disable
defaults write -g NSScrollAnimationEnabled -bool false

# Enable (Default)
defaults write -g NSScrollAnimationEnabled -bool true
```

#### Rubberband Scrolling
```bash
# Disable
defaults write -g NSScrollViewRubberbanding -bool false

# Enable (Default)
defaults write -g NSScrollViewRubberbanding -bool true
```

#### Expand Save Panel by Default
```bash
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true && \
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
```

#### Desktop Icon Visibility
```bash
# Hide Icons
defaults write com.apple.finder CreateDesktop -bool false && \
killall Finder

# Show Icons (Default)
defaults write com.apple.finder CreateDesktop -bool true && \
killall Finder
```

#### Path Bar
```bash
# Show
defaults write com.apple.finder ShowPathbar -bool true

# Hide (Default)
defaults write com.apple.finder ShowPathbar -bool false
```

#### Scrollbar Visibility
Possible values: `WhenScrolling`, `Automatic` and `Always`.
```bash
defaults write -g AppleShowScrollBars -string "Always"
```

#### Status Bar
```bash
# Show
defaults write com.apple.finder ShowStatusBar -bool true

# Hide (Default)
defaults write com.apple.finder ShowStatusBar -bool false
```

#### Save to Disk by Default
Sets default save target to be a local disk, not iCloud.
```bash
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
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
defaults write -g NSTableViewDefaultSizeMode -int 2
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
open https://github.com
```

#### Open File
```bash
open README.md
```

#### Open Applications
You can open applications using `-a`.
```bash
open -a "Google Chrome" https://github.com
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

#### Get SF Mono Fonts
You need to download and install Xcode 8 beta for this to work. Afterwards they should be available in all applications.
```bash
cp -v /Applications/Xcode-beta.app/Contents/SharedFrameworks/DVTKit.framework/Versions/A/Resources/Fonts/SFMono-* ~/Library/Fonts
```

From Sierra onward, they are included in Terminal.app.
```bash
cp -v /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-* ~/Library/Fonts
```


## Functions

Please see [this file](functions.md).


## Hardware

### Bluetooth

```bash
# Status
defaults read /Library/Preferences/com.apple.Bluetooth ControllerPowerState

# Enable (Default)
sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 1

# Disable
sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0 && \
sudo killall -HUP blued
```

### Harddisks

#### Force Enable Trim
Enable Trim for non-Apple SSDs. This command is available since Yosemite.
```bash
forcetrim
```

### Hardware Information

#### List All Hardware Ports
```bash
networksetup -listallhardwareports
```

#### Remaining Battery Percentage
```bash
pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';'
```

#### Remaining Battery Time
```bash
pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f3 -d';'
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

### Infrared Receiver

```bash
# Status
defaults read /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled

# Enable (Default)
defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -int 1

# Disable
defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -int 0
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

#### Put Display to Sleep after 15 Minutes of Inactivity
```bash
sudo pmset displaysleep 15
```

#### Put Computer to Sleep after 30 Minutes of Inactivity
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

#### Automatic Restart on System Freeze
```bash
sudo systemsetup -setrestartfreeze on
```

#### Chime When Charging
Play iOS charging sound when MagSafe is connected.
```bash
# Enable
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && \
open /System/Library/CoreServices/PowerChime.app

# Disable (Default)
defaults write com.apple.PowerChime ChimeOnAllHardware -bool false && \
killall PowerChime
```


## Input Devices

### Keyboard

#### Auto-Correct
```bash
# Disable
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Enable (Default)
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool true

# Show Status
defaults read -g NSAutomaticSpellingCorrectionEnabled
```

#### Full Keyboard Access
Enable Tab in modal dialogs.
```bash
# Text boxes and lists only (Default)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 0

# All controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
```

#### Key Repeat
Disable the default "press and hold" behavior.
```bash
# Enable Key Repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable Key Repeat
defaults write -g ApplePressAndHoldEnabled -bool true
```

#### Key Repeat Rate
Sets a very fast repeat rate, adjust to taste.
```bash
defaults write -g KeyRepeat -int 0.02
```

## Launchpad

#### Reset Launchpad Layout
You need to restart `Dock` because Launchpad is tied to it.
```bash
# Up to Yosemite
rm ~/Library/Application\ Support/Dock/*.db && \
killall Dock

# From El Capitan
defaults write com.apple.dock ResetLaunchPad -bool true && \
killall Dock
```

## Media

### Audio

#### Convert Audio File to iPhone Ringtone
```bash
afconvert input.mp3 ringtone.m4r -f m4af
```

#### Create Audiobook From Text
Uses "Alex" voice, a plain UTF-8 encoded text file for input and AAC output.
```bash
say -v Alex -f file.txt -o "output.m4a"
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

#### Bonjour Service
```bash
# Disable
sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist ProgramArguments -array-add "-NoMulticastAdvertisements"

# Enable (Default)
sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist ProgramArguments -array "/usr/sbin/mDNSResponder" "-launchd"
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

### Network Preferences

#### Network Locations
Switch between network locations created in the Network preference pane.
```bash
# Status
scselect

# Switch Network Location
scselect LocationNameFromStatus
```

#### Set Static IP Address
```bash
networksetup -setmanual "Ethernet" 192.168.2.100 255.255.255.0 192.168.2.1
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

### SSH

#### Permanently Add Private Key Passphrase to SSH Agent
> Prior to macOS Sierra, ssh would present a dialog asking for your passphrase and would offer the option to store it into the keychain. This UI was deprecated some time ago and has been removed.
>
> Instead, a new UseKeychain option was introduced in macOS Sierra allowing users to specify whether they would like for the passphrase to be stored in the keychain. This option was enabled by default on macOS Sierra, which caused all passphrases to be stored in the keychain.
>
> This was not the intended default behavior, so this has been changed in macOS 10.12.2. ([Source](https://developer.apple.com/library/archive/technotes/tn2449/_index.html))
```bash
ssh-add -K /path/to/private_key
```
Then add to `~/.ssh/config`:
```bash
Host server.example.com
    IdentityFile /path/to/private_key
    UseKeychain yes
```

#### Remote Login
```bash
# Enable remote login
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist

# Disable remote login
sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist
```

### TCP/IP

#### Show Application Using a Certain Port
This outputs all applications currently using port 80.
```bash
sudo lsof -i :80
```

#### Show External IP Address
Works if your ISP doesn't replace DNS requests (which it shouldn't).
```bash
dig +short myip.opendns.com @resolver1.opendns.com
```
Alternative that works on all networks.
```bash
curl -s https://api.ipify.org && echo
````

### TFTP

#### Start Native TFTP Daemon
Files will be served from `/private/tftpboot`.
```bash
sudo launchctl load -F /System/Library/LaunchDaemons/tftp.plist && \
sudo launchctl start com.apple.tftpd
```

### Wi-Fi

#### Join a Wi-Fi Network
```bash
networksetup -setairportnetwork en0 WIFI_SSID WIFI_PASSWORD
```

#### Scan Available Access Points
Create a symbolic link to the airport command for easy access:
```bash
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
```
Run a wireless scan:
```bash
airport -s
```

#### Show Current SSID
```bash
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
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

#### Turn on Wi-Fi Adapter
```bash
networksetup -setairportpower en0 on
```

## Package Managers

- [Fink](http://www.finkproject.org) - The full world of Unix Open Source software for Darwin. A little outdated.
- [Homebrew](https://brew.sh) - The missing package manager for OS X. The most popular choice.
- [MacPorts](https://www.macports.org) - Compile, install and upgrade either command-line, X11 or Aqua based open-source software. Very clean, it's what I use.


## Printing

#### Clear Print Queue
```bash
cancel -a -
```

#### Expand Print Panel by Default
```bash
defaults write -g PMPrintingExpandedStateForPrint -bool true && \
defaults write -g PMPrintingExpandedStateForPrint2 -bool true
```

#### Quit Printer App After Print Jobs Complete
```bash
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
```


## Security

### Application Firewall

#### Firewall Service
```bash
# Show Status
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate

# Enable
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Disable (Default)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
```

#### Add Application to Firewall
```bash
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /path/to/file
```

### Gatekeeper

#### Add Gatekeeper Exception
```bash
spctl --add /path/to/Application.app
```

#### Remove Gatekeeper Exception
```bash
spctl --remove /path/to/Application.app
```

#### Manage Gatekeeper
```bash
# Status
spctl --status

# Enable (Default)
sudo spctl --master-enable

# Disable
sudo spctl --master-disable
```

### Passwords

#### Generate Secure Password and Copy to Clipboard
```bash
LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy
```

### Physical Access

#### Launch Screen Saver
```bash
open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app
```

#### Lock Screen
```bash
/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
```

#### Screensaver Immediate Lock
```bash
# Status
defaults read com.apple.screensaver askForPasswordDelay

# Enable (Default)
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable (Integer = lock delay in seconds)
defaults write com.apple.screensaver askForPasswordDelay -int 10
```

#### Screensaver Password
```bash
# Status
defaults read com.apple.screensaver askForPassword

# Enable
defaults write com.apple.screensaver askForPassword -int 1

# Disable (Default)
defaults write com.apple.screensaver askForPassword -int 0
```

### Wiping Data

Note: The `srm` command appears to have been removed on MacOS after 10.9. There is a note on an [Apple support page](https://support.apple.com/en-us/HT201949) hinting as to why:
> With an SSD drive, Secure Erase and Erasing Free Space are not available in Disk Utility. These options are not needed for an SSD drive because a standard erase makes it difficult to recover data from an SSD.

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

```bash
# Enable AirDrop over Ethernet and on Unsupported Macs
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Enable (Default)
defaults remove com.apple.NetworkBrowser DisableAirDrop

# Disable
defaults write com.apple.NetworkBrowser DisableAirDrop -bool YES
```

### AppleScript

#### Execute AppleScript
```bash
osascript /path/to/script.scpt
```

### Basics

#### Compare Two Folders
```bash
diff -qr /path/to/folder1 /path/to/folder2
```

#### Copy Large File with Progress
Make sure you have `pv` installed and replace `/dev/rdisk2` with the appropriate write device or file.
```bash
FILE=/path/to/file.iso pv -s $(du -h $FILE | awk '/.*/ {print $1}') $FILE | sudo dd of=/dev/rdisk2 bs=1m
```

#### Restore Sane Shell
In case your shell session went insane (some script or application turned it into a garbled mess).
```bash
stty sane
```

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

#### Convert Clipboard to Plain Text
```bash
pbpaste | textutil -convert txt -stdin -stdout -encoding 30 | pbcopy
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

#### Automatically Unlock FileVault on Restart
If FileVault is enabled on the current volume, it restarts the system, bypassing the initial unlock. The command may not work on all systems.
```bash
sudo fdesetup authrestart
```

#### FileVault Service
```bash
# Status
sudo fdesetup status

# Enable
sudo fdesetup enable

# Disable (Default)
sudo fdesetup disable
```

### Information/Reports

#### Generate Advanced System and Performance Report
```bash
sudo sysdiagnose -f ~/Desktop/
```

### Install OS

#### Create Bootable Installer
```bash
# High Sierra
sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume --applicationpath /Applications/Install\ macOS\ High\ Sierra.app

# Sierra
sudo /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume --applicationpath /Applications/Install\ macOS\ Sierra.app

# El Capitan
sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app

# Yosemite
sudo /Applications/Install\ OS\ X\ Yosemite.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume --applicationpath /Applications/Install\ OS\ X\ Yosemite.app
```

### Kernel Extensions

#### Display Status of Loaded Kernel Extensions
```bash
sudo kextstat -l
```

#### Load Kernel Extension
```bash
sudo kextload -b com.apple.driver.ExampleBundle
```

#### Unload Kernel Extensions
```bash
sudo kextunload -b com.apple.driver.ExampleBundle
```

### LaunchAgents

Please see [this file](launchagents.md).


### LaunchServices

#### Rebuild LaunchServices Database
To be independent of OS X version, this relies on `locate` to find `lsregister`. If you do not have your `locate` database built yet, [do it](#build-locate-database).
```bash
sudo $(locate lsregister) -kill -seed -r
```

### Login Window

#### Set Login Window Text
```bash
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Your text"
```

### Memory Management

#### Purge memory cache
```bash
sudo purge
```

#### Show Memory Statistics
```bash
# One time
vm_stat

# Table of data, repeat 10 times total, 1 second wait between each poll
vm_stat -c 10 1
```

### Notification Center

#### Notification Center Service
```bash
# Disable
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && \
killall -9 NotificationCenter

# Enable (Default)
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
```

### QuickLook

#### Preview via QuickLook
```bash
qlmanage -p /path/to/file
```

### Remote Apple Events
```bash
# Status
sudo systemsetup -getremoteappleevents

# Enable
sudo systemsetup -setremoteappleevents on

# Disable (Default)
sudo systemsetup -setremoteappleevents off
```

### Root User

```bash
# Enable
dsenableroot

# Disable
dsenableroot -d
```

### Safe Mode Boot

```bash
# Status
nvram boot-args

# Enable
sudo nvram boot-args="-x"

# Disable
sudo nvram boot-args=""
```

### Screenshots

#### Take Delayed Screenshot
Takes a screenshot as JPEG after 3 seconds and displays in Preview.
```bash
screencapture -T 3 -t jpg -P delayedpic.jpg
```

#### Save Screenshots to Given Location
Sets location to `~/Desktop`.
```bash
defaults write com.apple.screencapture location ~/Desktop && \
killall SystemUIServer
```

#### Save Screenshots in Given Format
Sets format to `png`. Other options are `bmp`, `gif`, `jpg`, `jpeg`, `pdf`, `tiff`.
```bash
defaults write com.apple.screencapture type -string "png"
```

#### Disable Shadow in Screenshots
```bash
defaults write com.apple.screencapture disable-shadow -bool true && \
killall SystemUIServer
```

#### Set Default Screenshot Name
Date and time remain unchanged.
```bash
defaults write com.apple.screencapture name "Example name" && \
killall SystemUIServer
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

#### Set Software Update Server
This should only be done for testing purposes or unmanaged clients. To use network-wide, either correctly set up DNS along with [Apple SUS service](http://krypted.com/mac-security/using-the-software-update-service-on-mountain-lion-server/) and bind your clients via OpenDirectory. Alternatively, use [Reposado](https://github.com/wdas/reposado) together with correct network DNS settings to make resolution transparent. [Margarita](https://github.com/jessepeterson/margarita) looks nice to have as well.
```bash
# Use own SUS
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL http://su.example.com:8088/index.sucatalog

# Reset to Apple SUS
sudo defaults delete /Library/Preferences/com.apple.SoftwareUpdate CatalogURL
```

### Software Version

#### Show System Software Version
```bash
sw_vers -productVersion
```

### Spotlight

#### Spotlight Indexing
```bash
# Disable
mdutil -i off -d /path/to/volume

# Enable (Default)
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

#### Show Spotlight Indexed Metadata
```bash
mdls /path/to/file
```

### System Integrity Protection

#### Disable System Integrity Protection
Reboot while holding <kbd>Cmd</kbd> + <kbd>R</kbd>, open the Terminal application and enter:
```bash
csrutil disable && reboot
```

#### Enable System Integrity Protection
Reboot while holding <kbd>Cmd</kbd> + <kbd>R</kbd>, open the Terminal application and enter:
```bash
csrutil enable && reboot
```

### Date and Time

#### List Available Timezones
```bash
sudo systemsetup -listtimezones
```

#### Set Timezone
```bash
sudo systemsetup -settimezone Europe/Berlin
```

#### Set Clock Using Network Time
```bash
# Status
sudo systemsetup getusingnetworktime

# Enable (Default)
sudo systemsetup setusingnetworktime on

# Disable
sudo systemsetup setusingnetworktime off
```



## Terminal

#### Ring Terminal Bell
Rings the terminal bell (if enabled) and puts a badge on it.
```bash
tput bel
```

### Alternative Terminals

- [iTerm2](https://iterm2.com) - A better Terminal.app.
- [kitty](https://sw.kovidgoyal.net/kitty/) - Modern, GPU-accelerated terminal emulator.

### Shells

#### Bash
Install the latest version and set as current user's default shell:
```bash
brew install bash && \
echo $(brew --prefix)/bin/bash | sudo tee -a /etc/shells && \
chsh -s $(brew --prefix)/bin/bash
```

- [Homepage](https://www.gnu.org/software/bash/) - The default shell for OS X and most other Unix-based operating systems.
- [Bash-it](https://github.com/Bash-it/bash-it) - Community Bash framework, like Oh My Zsh for Bash.

#### fish
Install the latest version and set as current user's default shell:
```bash
brew install fish && \
echo $(brew --prefix)/bin/fish | sudo tee -a /etc/shells && \
chsh -s $(brew --prefix)/bin/fish
```

- [Homepage](http://fishshell.com) - A smart and user-friendly command line
shell for OS X, Linux, and the rest of the family.
- [Fisherman](https://fisherman.github.io/) - A blazing fast, modern plugin manager for Fish.
- [The Fishshell Framework](https://github.com/oh-my-fish/oh-my-fish) - Provides core infrastructure to allow you to install packages which extend or modify the look of your shell.
- [Installation & Configuration Tutorial](https://github.com/ellerbrock/fish-shell-setup-osx) - How to Setup Fish Shell with Fisherman, Powerline Fonts, iTerm2 and Budspencer Theme on OS X.

#### Zsh
Install the latest version and set as current user's default shell:
```bash
brew install zsh && \
sudo sh -c 'echo $(brew --prefix)/bin/zsh >> /etc/shells' && \
chsh -s $(brew --prefix)/bin/zsh
```

- [Homepage](http://www.zsh.org) - Zsh is a shell designed for interactive use, although it is also a powerful scripting language.
- [Oh My Zsh](http://ohmyz.sh) - An open source, community-driven framework for managing your Zsh configuration.
- [Prezto](https://github.com/sorin-ionescu/prezto) - A speedy Zsh framework. Enriches the command line interface environment with sane defaults, aliases, functions, auto completion, and prompt themes.
- [zgen](https://github.com/tarjoilija/zgen) - Another open source framework for managing your zsh configuration. Zgen will load oh-my-zsh compatible plugins and themes and has the advantage of both being faster and automatically cloning any plugins used in your configuration for you.

### Terminal Fonts

- [Anonymous Pro](http://www.marksimonson.com/fonts/view/anonymous-pro) - A family of four fixed-width fonts designed with coding in mind.
- [Codeface](https://github.com/chrissimpkins/codeface) - A gallery and repository of monospaced fonts for developers.
- [DejaVu Sans Mono](https://dejavu-fonts.github.io/) - A font family based on the Vera Fonts.
- [Hack](http://sourcefoundry.org/hack/) - Hack is hand groomed and optically balanced to be your go-to code face.
- [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) -  A monospace font, designed for code listings and the like.
- [Input](http://input.fontbureau.com) - A flexible system of fonts designed specifically for code.
- [Meslo](https://github.com/andreberg/Meslo-Font) - Customized version of Apple's Menlo font.
- [Operator Mono](https://www.typography.com/fonts/operator/overview/) - A surprisingly usable alternative take on a monospace font (commercial).
- [Powerline Fonts](https://github.com/powerline/fonts) - Repo of patched fonts for the Powerline plugin.
- [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/) - A monospaced font family for user interfaces and coding environments.


## Send a Tip my Way

In case you feel particularly generous today, you can buy me a coffee. That would really make my day. Kindness of strangers and all that. If you can't or won't, no hard feelings.

Bitcoin: `1HXi42h9Uk5LmDrq1rVv8ykaFoeARTXw9P`


## License

<a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://licensebuttons.net/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
