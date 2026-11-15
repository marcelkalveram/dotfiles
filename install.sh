#!/bin/sh

echo "Setting up your Mac..."

# Homebrew lives in /opt/homebrew on Apple Silicon and /usr/local on Intel.
# A new shell does not have that directory on PATH until shellenv runs.
add_brew_to_path() {
  if command -v brew >/dev/null 2>&1; then
    return 0
  fi

  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

add_brew_to_path

# The Ruby installer at Homebrew/install/master/install was removed and returns
# 404. Without this, the script continues and every later brew call fails.
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  add_brew_to_path
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew installation failed; brew is still not on PATH." >&2
  exit 1
fi

# Update Homebrew recipes
brew update

# brew bundle ships with Homebrew. The homebrew/bundle tap was archived.
# Install all our dependencies with bundle (See Brewfile)
brew bundle

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Ruby and set global version
rbenv install 2.6.5
rbenv global 2.6.5

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

#  create symlinks for git configuration
ln -s $HOME/.dotfiles/.global-gitignore $HOME/.global-gitignore
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Set macOS preferences
# We will run this last because this will reload the shell
# source .macos
