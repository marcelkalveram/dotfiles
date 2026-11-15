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

# Install oh-my-zsh. Skip when it is already there: the installer exits if
# $ZSH is exported (as it is in .zshrc) and that directory exists.
omz_dir="${ZSH:-$HOME/.oh-my-zsh}"
if [ -d "$omz_dir" ]; then
  echo "Oh My Zsh is already installed at $omz_dir."
else
  # Unset ZSH so a value exported by the current shell cannot redirect the install.
  ZSH= RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Ruby 2.6 is end of life and fails to build on current macOS (arm64).
# rbenv install prints a note to run `rbenv global`; the next line does that.
ruby_version=4.0.9
rbenv install -s "$ruby_version"
rbenv global "$ruby_version"
echo "Default Ruby is $ruby_version."

# Make ZSH the default shell. chsh prompts for a password and exits with
# "no changes made" when the login shell is already the requested path.
zsh_path=$(command -v zsh)
current_shell=$(dscl . -read "/Users/$(id -un)" UserShell 2>/dev/null | awk '{print $2}')
if [ -n "$zsh_path" ] && [ "$current_shell" = "$zsh_path" ]; then
  echo "Login shell is already $zsh_path."
else
  chsh -s "$zsh_path"
fi

# Point the home files at this repo. -fn replaces a file or symlink that is already there.
ln -sfn "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
ln -sfn "$HOME/.dotfiles/.global-gitignore" "$HOME/.global-gitignore"
ln -sfn "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

# Set macOS preferences
# We will run this last because this will reload the shell
# source .macos
