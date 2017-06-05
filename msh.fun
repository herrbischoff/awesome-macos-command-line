banner(){
  echo "    awesome-osx-command-line   "
  echo "  ============================="
}
banner1(){
  echo "            SUB-MENU"
  echo "  ============================="
}
fun10101(){
  defaults write com.apple.universalaccess reduceTransparency -bool true
}
fun10102(){
  defaults write com.apple.universalaccess reduceTransparency -bool false
}
fun10201(){
  osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/path/to/picture.jpg"'
}
fun10202(){
  sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '/path/to/picture.jpg'" && killall Dock
}
fun2010101(){
  find /Applications -path '*Contents/_MASReceipt/receipt' -maxdepth 4 -print |\sed 's#.app/Contents/_MASReceipt/receipt#.app#g; s#/Applications/##'
}
fun2010102(){
  mdfind kMDItemAppStoreHasReceipt=1
}
fun2010201(){
  defaults write com.apple.appstore ShowDebugMenu -bool true
}
fun2010202(){
  defaults write com.apple.appstore ShowDebugMenu -bool false
}
fun20201(){
  sudo rm -rf /var/db/RemoteManagement ; \
  sudo defaults delete /Library/Preferences/com.apple.RemoteDesktop.plist ; \
  defaults delete ~/Library/Preferences/com.apple.RemoteDesktop.plist ; \
  sudo rm -r /Library/Application\ Support/Apple/Remote\ Desktop/ ; \
  rm -r ~/Library/Application\ Support/Remote\ Desktop/ ; \
  rm -r ~/Library/Containers/com.apple.RemoteDesktop
}
fun2030101(){
  defaults write com.apple.addressbook ABShowDebugMenu -bool true
}
fun2030102(){
  defaults write com.apple.addressbook ABShowDebugMenu -bool false
}
fun20401(){
  ~/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/ksinstall --nuke
}
fun2050101(){
  launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
}
fun2050102(){
  launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist
}
fun20601(){
  defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes
}
fun20602(){
  osascript <<!
(*
Speed up Mail.app by vacuuming the Envelope Index
Code from: http://web.archive.org/web/20071008123746/http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/
Originally by "pmbuko" with modifications by Romulo
Updated by Brett Terpstra 2012
Updated by Mathias Törnblom 2015 to support V3 in El Capitan and still keep backwards compatibility
*)

tell application "Mail" to quit
set os_version to do shell script "sw_vers -productVersion"
set mail_version to "V2"
considering numeric strings
    if "10.10" <= os_version then set mail_version to "V3"
    if "10.12" < os_version then set mail_version to "V4" # for osx sierra
end considering

set sizeBefore to do shell script "ls -lnah ~/Library/Mail/" & mail_version & "/MailData | grep -E 'Envelope Index$' | awk {'print $5'}"
do shell script "/usr/bin/sqlite3 ~/Library/Mail/" & mail_version & "/MailData/Envelope\\ Index vacuum"

set sizeAfter to do shell script "ls -lnah ~/Library/Mail/" & mail_version & "/MailData | grep -E 'Envelope Index$' | awk {'print $5'}"

display dialog ("Mail index before: " & sizeBefore & return & "Mail index after: " & sizeAfter & return & return & "Enjoy the new speed!")

tell application "Mail" to activate
!
}
fun20701(){
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
  defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
  defaults write -g WebKitDeveloperExtras -bool true
}
fun20702(){
  osascript -e 'tell application "Safari" to get URL of current tab of front window'
}
fun20801(){
  defaults write com.bohemiancoding.sketch3 exportCompactSVG -bool yes
}
fun20901(){
  defaults write -app Skim SKAutoReloadFileUpdate -boolean true
}
fun20A01(){
  defaults write com.apple.TextEdit RichText -int 0
}
fun30101(){
  sudo defaults write /System/Library/Launch Daemons/com.apple.backupd-auto StartInterval -int 1800
}
fun3010201(){
  defaults read /Library/Preferences/com.apple.TimeMachine MobileBackups
}
fun3010202(){
  sudo tmutil enablelocal
}
fun3010203(){
  sudo tmutil disablelocal
}
fun30103(){
  sudo defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
}
fun30104(){
  sudo tmutil verifychecksums /path/to/backup
}
fun40101(){
  brew install macvim --HEAD --with-cscope --with-lua --with-override-system-vim --with-luajit --with-python
}
fun40102(){
  brew install neovim/neovim/neovim
}
fun40201(){
  xcode-select --install
}
fun40202(){
  xcrun simctl delete unavailable
}
fun501(){
  sudo pmset -a sms 0
}
fun502(){
  osascript -e 'tell application "Finder" to eject (every disk whose ejectable is true)'
}
fun503(){
  sudo diskutil repairPermissions /
}
fun504(){
  echo "using command: " "bless --mount "/path/to/mounted/volume" --setBoot"
}
fun505(){
  diskutil list
}
fun506(){
  sudo fs_usage
}
fun50701(){
  echo "using command: " "hdiutil create -volname "Volume Name" -srcfolder /path/to/folder -ov diskimage.dmg"
}
fun50702(){
  echo "using command: " "hdiutil burn /path/to/image_file"
}
fun50703(){
  defaults write com.apple.frameworks.diskimages skip-verify -bool true && \
  defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && \
  defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
}
fun50704(){
  echo "using command: " "bless --folder "/path/to/mounted/volume/System/Library/CoreServices" --bootinfo --bootefi"
}
fun50705(){
  echo "using command: " "hdiutil attach /path/to/diskimage.dmg"
}
fun50706(){
  echo "using command: " "hdiutil detach /dev/disk2s1"
}
fun50707(){
  echo "using command: " "sudo asr -restore -noverify -source /path/to/diskimage.dmg -target /Volumes/VolumeToRestoreTo"
}
fun601(){
  defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }' && \
  killall Dock
}
fun602(){
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && \
  killall Dock
}
fun60301(){
  defaults write com.apple.dock no-bouncing -bool true && \
  killall Dock
}
fun60302(){
  defaults write com.apple.dock no-bouncing -bool false && \
  killall Dock
}
fun604(){
  defaults delete com.apple.dock && \
  killall Dock
}
fun605(){
  defaults write com.apple.dock tilesize -int 0 && \
  killall Dock
}
fun60601(){
  defaults write com.apple.dock scroll-to-open -bool true && \
  killall Dock
}
fun60602(){
  defaults write com.apple.dock scroll-to-open -bool false && \
  killall Dock
}
fun607(){
  defaults write com.apple.Dock autohide-delay -float 0 && \
  killall Dock
}
fun60801(){
  defaults write com.apple.dock showhidden -bool true && \
  killall Dock
}
fun60802(){
  defaults write com.apple.dock showhidden -bool false && \
  killall Dock
}
fun701(){
  textutil -convert html file.ext
}
fun80101(){
  echo "using command: " "sudo chmod -RN /path/to/folder"
}
fun80102(){
  echo "using command: " "chflags hidden /path/to/folder/"
}
fun80103(){
  defaults write -g AppleShowAllExtensions -bool true
}
fun8010401(){
  defaults write com.apple.finder AppleShowAllFiles true
}
fun8010402(){
  defaults write com.apple.finder AppleShowAllFiles false
}
fun80105(){
  echo "using command: " "sudo chflags -R nouchg /path/to/file/or/folder"
}
fun80106(){
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
}
fun80107(){
  chflags nohidden ~/Library
}
fun80108(){
  defaults write -g NSNavRecentPlacesLimit -int 10 && \
  killall Finder
}
fun8020101(){
  defaults write com.apple.finder QuitMenuItem -bool true && \
  killall Finder
}
fun8020102(){
  defaults write com.apple.finder QuitMenuItem -bool false && \
  killall Finder
}
fun8020201(){
  defaults write -g NSScrollAnimationEnabled -bool false
}
fun8020202(){
  defaults write -g NSScrollAnimationEnabled -bool true
}
fun8020301(){
  defaults write -g NSScrollViewRubberbanding -bool false
}
fun8020302(){
  defaults write -g NSScrollViewRubberbanding -bool true
}
fun80204(){
  defaults write -g NSNavPanelExpandedStateForSaveMode -bool true && \
  defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
}
fun8020501(){
  defaults write com.apple.finder CreateDesktop -bool false && \
  killall Finder
}
fun8020502(){
  defaults write com.apple.finder CreateDesktop -bool true && \
  killall Finder
}
fun8020601(){
  defaults write com.apple.finder ShowPathbar -bool true
}
fun8020602(){
  defaults write com.apple.finder ShowPathbar -bool false
}
fun80207(){
  defaults write -g AppleShowScrollBars -string "Always"
}
fun8020801(){
  defaults write com.apple.finder ShowStatusBar -bool true
}
fun8020802(){
  defaults write com.apple.finder ShowStatusBar -bool false
}
fun80209(){
  defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
}
fun8020A(){
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
}
fun8020B(){
  defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
  defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
}
fun8020C(){
  echo "Sets size to 'medium'."
  defaults write -g NSTableViewDefaultSizeMode -int 2
}
fun80301(){
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
}
fun80302(){
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
}
fun80401(){
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}
fun80402(){
  open https://github.com
}
fun80403(){
  open README.md
}
fun80404(){
  open -a "Google Chrome" https://github.com
}
fun80405(){
  echo "using command: " "open /path/to/folder/"
}
fun80406(){
  open .
}
fun901(){
  atsutil databases -removeUser && \
  atsutil server -shutdown && \
  atsutil server -ping
}
fun902(){
  cp -v /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-* ~/Library/Fonts
}
funA(){
  open https://github.com/herrbischoff/awesome-osx-command-line/blob/master/functions.md
}
funB0101(){
  defaults read /Library/Preferences/com.apple.Bluetooth ControllerPowerState
}
funB0102(){
  sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 1
}
funB0103(){
  sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0 && \
  sudo killall -HUP blued
}
funB0201(){
  networksetup -listallhardwareports
}
funB0202(){
  pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';'
}
funB0203(){
  pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f3 -d';'
}
funB0204(){
  system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' -e '/iPhone/,/Serial/p'
}
funB0205(){
  system_profiler SPDisplaysDataType | grep Resolution
}
funB0206(){
  sysctl -n machdep.cpu.brand_string
}
funB0301(){
  defaults read /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled
}
funB0302(){
  defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -int 1
}
funB0303(){
  defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -int 0
}
funB0401(){
  caffeinate -u -t 3600
}
funB0402(){
  sudo pmset -g
}
funB0403(){
  sudo pmset displaysleep 15
}
funB0404(){
  sudo pmset sleep 30
}
funB0405(){
  sudo systemsetup -getcomputersleep
}
funB0406(){
  sudo systemsetup -setcomputersleep 60
}
funB0407(){
  sudo systemsetup -setcomputersleep Never
}
funB0408(){
  sudo systemsetup -setrestartfreeze on
}
funB040901(){
  defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && \
  open /System/Library/CoreServices/PowerChime.app
}
funB040902(){
  defaults write com.apple.PowerChime ChimeOnAllHardware -bool false && \
  killall PowerChime
}
funC010101(){
  defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
}
funC010102(){
  defaults write -g NSAutomaticSpellingCorrectionEnabled -bool true
}
funC010103(){
  defaults read -g NSAutomaticSpellingCorrectionEnabled
}
funC010201(){
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 0
}
funC010202(){
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
}
funC010301(){
  defaults write -g ApplePressAndHoldEnabled -bool false
}
funC010302(){
  defaults write -g ApplePressAndHoldEnabled -bool true
}
funC0104(){
  defaults write -g KeyRepeat -int 0.02
}
funD0101(){
  afconvert input.mp3 ringtone.m4r -f m4af
}
funD0102(){
  say -v Alex -f file.txt -o "output.m4a"
}
funD0103(){
  sudo nvram SystemAudioVolume=" "
}
funD0104(){
  osascript -e 'set volume output muted true'
}
funD0105(){
  osascript -e 'set volume 4'
}
funD0106(){
  afplay -q 1 filename.mp3
}
funD0107(){
  say 'All your base are belong to us!'
}
funD0201(){
  defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen 1
}
funE010101(){
  sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist ProgramArguments -array-add "-NoMulticastAdvertisements"
}
funE010102(){
  sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist ProgramArguments -array "/usr/sbin/mDNSResponder" "-launchd"
}
funE0201(){
  sudo ipconfig set en0 DHCP
}
funE0202(){
  ipconfig getpacket en0
}
funE0301(){
  sudo dscacheutil -flushcache && \
  sudo killall -HUP mDNSResponder
}
funE0401(){
  sudo scutil --set ComputerName "newhostname" && \
  sudo scutil --set HostName "newhostname" && \
  sudo scutil --set LocalHostName "newhostname" && \
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "newhostname"
}
funE050101(){
  scselect
}
funE050102(){
  scselect LocationNameFromStatus
}
funE0601(){
  ping -o github.com
}
funE0602(){
  traceroute github.com
}
funE070101(){
  sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
}
funE070102(){
  sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist
}
funE0801(){
  sudo lsof -i :80
}
funE0802(){
  dig +short myip.opendns.com @resolver1.opendns.com
}
funE0901(){
  networksetup -setairportnetwork en0 WIFI_SSID WIFI_PASSWORD
}
funE0902(){
  sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
}
funE0903(){
  airport -s
}
funE0904(){
  /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
}
funE0905(){
  ipconfig getifaddr en0
}
funE0906(){
  defaults read /Library/Preferences/SystemConfiguration/com.apple.airport.preferences | grep LastConnected -A 7
}
funE0907(){
  security find-generic-password -D "AirPort network password" -a "SSID" -gw
}
funE0908(){
  networksetup -setairportpower en0 on
}
funF01(){
  open http://www.finkproject.org/
}
funF02(){
  open https://brew.sh/
}
funF03(){
  open https://www.macports.org/
}
funG01(){
  cancel -a -
}
funG02(){
  defaults write -g PMPrintingExpandedStateForPrint -bool true && \
  defaults write -g PMPrintingExpandedStateForPrint2 -bool true
}
funG03(){
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
}
funH010101(){
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
}
funH010102(){
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
}
funH010103(){
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
}
funH0102(){
  echo "using command: " "sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /path/to/file"
}
funH0201(){
  echo "using command: " "spctl --add /path/to/Application.app"
}
funH0202(){
  echo "using command: " "spctl --remove /path/to/Application.app"
}
funH020301(){
  spctl --status
}
funH020302(){
  sudo spctl --master-enable
}
funH020303(){
  sudo spctl --master-disable
}
funH0301(){
  LC_ALL=C tr -dc "[:alpha:][:alnum:]" < /dev/urandom | head -c 20 | pbcopy
}
funH0401(){
  open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app
}
funH0402(){
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
}
funH040301(){
  defaults read com.apple.screensaver askForPasswordDelay
}
funH040302(){
  defaults write com.apple.screensaver askForPasswordDelay -int 0
}
funH040303(){
  defaults write com.apple.screensaver askForPasswordDelay -int 10
}
funH040401(){
  defaults read com.apple.screensaver askForPassword
}
funH040402(){
  defaults write com.apple.screensaver askForPassword -int 1
}
funH040403(){
  defaults write com.apple.screensaver askForPassword -int 0
}
funH0501(){
  echo "using command: " "srm /path/to/file"
}
funH0502(){
  echo "using command: " "srm -r /path/to/folder/"
}
funH0503(){
  echo "using command: " "srm -rf /path/to/complete/destruction"
}
funI0101(){
  find . -type f -name '*.DS_Store' -ls -delete
}
funI0201(){
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
}
funI0202(){
  locate -i *.jpg
}
funJ0101(){
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
}
funJ0102(){
  defaults remove com.apple.NetworkBrowser DisableAirDrop
}
funJ0103(){
  defaults write com.apple.NetworkBrowser DisableAirDrop -bool YES
}
funJ0201(){
  echo "using command: " "osascript /path/to/script.scpt"
}
funJ0301(){
  echo "using command: " "diff -qr /path/to/folder1 /path/to/folder2"
}
funJ0302(){
  echo "using command: " "FILE=/path/to/file.iso pv -s $(du -h $FILE | awk '/.*/ {print $1}') $FILE | sudo dd of=/dev/rdisk2 bs=1m"
}
funJ0303(){
  stty sane
}
funJ0304(){
  sudo reboot
}
funJ0305(){
  sudo poweroff
}
funJ0306(){
  sw_vers
}
funJ0307(){
  uptime
}
funJ0401(){
  cat whatever.txt | pbcopy
}
funJ0402(){
  pbpaste | textutil -convert txt -stdin -stdout -encoding 30 | pbcopy
}
funJ0403(){
  pbpaste | expand | pbcopy
}
funJ0404(){
  pbpaste > whatever.txt
}
funJ0405(){
  pbpaste | sort | uniq | pbcopy
}
funJ0501(){
  sudo systemsetup -listtimezones
}
funJ0502(){
  sudo systemsetup -settimezone Europe/Berlin
}
funJ050301(){
  sudo systemsetup getusingnetworktime
}
funJ050302(){
  sudo systemsetup setusingnetworktime on
}
funJ050303(){
  sudo systemsetup setusingnetworktime off
}
funJ0601(){
  sudo fdesetup authrestart
}
funJ060201(){
  sudo fdesetup status
}
funJ060202(){
  sudo fdesetup enable
}
funJ060203(){
  sudo fdestatus disable
}
funJ0701(){
  sudo sysdiagnose -f ~/Desktop/
}
funJ080101(){
  sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app
}
funJ080102(){
  sudo /Applications/Install\ OS\ X\ Yosemite.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume --applicationpath /Applications/Install\ OS\ X\ Yosemite.app
}
funJ080103(){
  sudo /Applications/Install\ OS\ X\ Mavericks.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume --applicationpath /Applications/Install\ OS\ X\ Mavericks.app
}
funJ0901(){
  sudo kextstat -l
}
funJ0902(){
  sudo kextload -b com.apple.driver.ExampleBundle
}
funJ0903(){
  sudo kextunload -b com.apple.driver.ExampleBundle
}
funJ0A(){
  open https://github.com/herrbischoff/awesome-osx-command-line/blob/master/launchagents.md
}
funJ0B01(){
  echo "To be independent of OS X version, this relies on locate to find lsregister. If you do not have your locate database built yet, do it."
  echo "using command: " 'sudo $(locate lsregister) -kill -seed -r'
}
funJ0C01(){
  sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Your text"
}
funJ0D01(){
  sudo purge
}
funJ0D0201(){
  vm_stat
}
funJ0D0202(){
  vm_stat -c 10 1
}
funJ0E0101(){
  launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && \
  killall -9 NotificationCenter
}
funJ0E0102(){
  launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
}
funJ0F01(){
  echo "using command: " "qlmanage -p /path/to/file"
}
funJ0G01(){
  sudo systemsetup -getremoteappleevents
}
funJ0G02(){
  sudo systemsetup -setremoteappleevents on
}
funJ0G03(){
  sudo systemsetup -setremoteappleevents off
}
funJ0H01(){
  dsenableroot
}
funJ0H02(){
  dsenableroot -d
}
funJ0I01(){
  nvram boot-args
}
funJ0I02(){
  sudo nvram boot-args="-x"
}
funJ0I03(){
  sudo nvram boot-args=""
}
funJ0J01(){
  screencapture -T 3 -t jpg -P delayedpic.jpg
}
funJ0J02(){
  defaults write com.apple.screencapture location ~/Desktop && \
  killall SystemUIServer
}
funJ0J03(){
  defaults write com.apple.screencapture type -string "png"
}
funJ0J04(){
  defaults write com.apple.screencapture disable-shadow -bool true && \
  killall SystemUIServer
}
funJ0J05(){
  defaults write com.apple.screencapture name "Example name" && \
  killall SystemUIServer
}
funJ0K01(){
  installer -pkg /path/to/installer.pkg -target /
}
funJ0L01(){
  sudo softwareupdate -ia
}
funJ0L02(){
  defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
}
funJ0L03(){
  sudo softwareupdate -l
}
funJ0L0401(){
  sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL http://su.example.com:8088/index.sucatalog
}
funJ0L0402(){
  sudo defaults delete /Library/Preferences/com.apple.SoftwareUpdate CatalogURL
}
funJ0M0101(){
  echo "using command: " "mdutil -i off -d /path/to/volume"
}
funJ0M0102(){
  echo "using command: " "mdutil -i on /path/to/volume"
}
funJ0M02(){
  echo "using command: " "mdutil -E /path/to/volume"
}
funJ0M03(){
  mdfind -name 'searchterm'
}
funJ0M04(){
  echo "using command: " "mdls /path/to/file"
}
funJ0N01(){
  echo "Reboot while holding Cmd + R, open the Terminal application and enter:"
  echo "csrutil disable && reboot"
}
funJ0N02(){
  echo "Reboot while holding Cmd + R, open the Terminal application and enter:"
  echo "csrutil enable && reboot"
}
