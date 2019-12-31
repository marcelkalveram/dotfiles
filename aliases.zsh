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
alias prunelocal="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"

# Alias for React Native packager
alias rnios='react-native run-ios'
alias rniosreset="kill \$(lsof -t -i:8081); rm -rf ios/build/; react-native run-ios"
alias rnan='react-native run-android'

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

alias rnan-7='emulator -avd Nexus_5_API_24'
alias rnan-7.1='emulator -avd Pixel_API_25'
alias rnan-8='emulator -avd Nexus_5X_API_26'
alias rnan-8.1='emulator -avd Nexus_6_API_27'
alias rnan-9='emulator -avd Pixel_XL_API_28'
alias rnan-10='emulator -avd Pixel_3_API_29'

alias iossims='instruments -s devices'
alias iossims-booted='xcrun simctl list devices | grep "Booted"'
alias avdsims='emulator -list-avds'

function findprocess {
  sudo lsof -i | grep $1
}

# find process running on a port
function findport {
  sudo lsof -i :$1
}

function killprocess {
  kill -9 $1
}

# Functions
function take {
	mkdir $1
	cd $1
}

function cdl { cd $1; ls;}

# iOS - find architectures in framework file (e.g. 'architectures XYZ.framework/XYZ')
function architectures() {
  if $(lipo -info $1 | grep -q 'not a fat file'); then
    lipo -info $1 | awk -F ': ' '/Non-fat file/ { print $3 }'
  else
    lipo -detailed_info $1 | awk '/^architecture / { print $2 }'
  fi
}

if [[ $(basename $0) == 'architectures' ]]; then
  architectures $1
fi