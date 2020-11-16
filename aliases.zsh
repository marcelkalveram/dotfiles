# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias c="clear"
alias npmg="npm list -g --depth 0"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

# Vagrant
alias v="vagrant global-status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"

# Git
alias g="git"
alias prunelocal="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D"
alias gca="git add . && git commit --amend"
alias grbc="git add . && git rebase --continue"
alias grbs="git rebase --skip"
alias gsync="git pull -r && git push"
alias gmc="git add . && git commit"

# Alias for React Native packager
alias rnios='react-native run-ios'
alias rniosreset="kill \$(lsof -t -i:8081); rm -rf ios/build/; react-native run-ios"
alias rnan='react-native run-android'
alias rndeps='yarn install && cd ios && pod install && cd ..'

# Delete React Native folders
alias rimrafandroid="rm -rf android/app/build"
alias rimrafios="rm -rf ios/build"

# React Native simulators
alias rnios-se='react-native run-ios --simulator "iPhone SE"'
alias rnios-6='react-native run-ios --simulator "iPhone 6"'
alias rnios-6p='react-native run-ios --simulator "iPhone 6s Plus"'
alias rnios-7='react-native run-ios --simulator "iPhone 7"'
alias rnios-7p='react-native run-ios --simulator "iPhone 7 Plus"'
alias rnios-8='react-native run-ios --simulator "iPhone 8"'
alias rnios-8p='react-native run-ios --simulator "iPhone 8 Plus"'
alias rnios-x='react-native run-ios --simulator "iPhone X"'
alias rnios-xs='react-native run-ios --simulator "iPhone Xs"'
alias rnios-xsm='react-native run-ios --simulator "iPhone XS Max"'
alias rnios-xr='react-native run-ios --simulator "iPhone Xʀ"'
alias rnios-11='react-native run-ios --simulator "iPhone 11"'
alias rnios-11p='react-native run-ios --simulator "iPhone 11 Pro"'
alias rnios-ipad='react-native run-ios --simulator "iPad Air (3rd generation) (13.3)"'

alias rnan-7='emulator -avd Nexus_5_API_24'
alias rnan-7.1='emulator -avd Pixel_API_25'
alias rnan-8='emulator -avd Nexus_5X_API_26'
alias rnan-8.1='emulator -avd Nexus_6_API_27'
alias rnan-9='emulator -avd Pixel_XL_API_28'
alias rnan-10='emulator -avd Pixel_3_API_29'
alias rnan-aosp='emulator -avd Pixel_API_28_AOSP'

# ADB
alias adbd='adb devices'
alias adbun='adb uninstall'
# List all packages
alias adbp="adb shell 'pm list packages -f' | sed -e 's/.*=//' | sort"
# List all user-installed packages
alias adbpu="adb shell 'pm list packages -3' | cut -f 2 -d ':'"

alias iossims='instruments -s devices'
alias iossims-booted='xcrun simctl list devices | grep "Booted"'
alias avdsims='emulator -list-avds'