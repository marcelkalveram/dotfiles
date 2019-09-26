# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias c="clear"

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
alias commit="git add . && git commit -m"
alias gcommit="git add . && git commit"
alias wip="commit wip"
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gp="git push origin HEAD"
alias gpf="git push origin HEAD --force-with-lease"
alias gl="git log --oneline --decorate --color"
alias gnuke="git clean -df && git reset --hard"

# Alias for React Native packager
alias rnios='react-native run-ios --simulator "iPhone 8"'
alias rniosreset="kill \$(lsof -t -i:8081); rm -rf ios/build/; react-native run-ios"
alias rnan='react-native run-android'

# Xcode
alias xcs101='sudo xcode-select -s /Applications/Xcode_10.1.app/'
alias xcs1021='sudo xcode-select -s /Applications/Xcode_10.1.app/'
alias xcs103='sudo xcode-select -s /Applications/Xcode.app/'
alias xcs11='sudo xcode-select -s /Applications/Xcode-beta.app/'

# Functions
function take {
	mkdir $1
	cd $1
}

function cdl { cd $1; ls;}
