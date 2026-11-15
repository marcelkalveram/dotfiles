# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Specify Java version
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Local bin directories before anything else
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Homebrew. Apple Silicon installs to /opt/homebrew, which is not on PATH
# until this runs. Intel Macs use /usr/local.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# yarn bins
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

# Load custom commands
export PATH="$DOTFILES/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.dotfiles/.config"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
unset _VOLTA_TOOL_RECURSION in each

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
