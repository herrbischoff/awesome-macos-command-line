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
