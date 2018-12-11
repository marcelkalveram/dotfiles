# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Android library
export PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:$PATH"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Local bin directories before anything else
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# rbenv
export PATH="~/.rbenv/shims:$PATH"
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Load custom commands
export PATH="$DOTFILES/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Alias for React Native packager
alias rnios='react-native run-ios --simulator "iPhone 8"'
alias rnan='react-native run-android'

# Functions
function take {
    mkdir $1
    cd $1
}

function cdl { cd $1; ls;}
