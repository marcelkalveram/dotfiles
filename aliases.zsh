# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias c="clear"
alias npmg="npm list -g --depth 0"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

# Git
alias g="git"
alias prunelocal="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D"
alias gca="git add . && git commit --amend"
alias grbc="git add . && git rebase --continue"
alias grbs="git rebase --skip"
alias gsync="git pull -r && git push"
alias gmc="git add . && git commit"
alias gpld="git fetch && git rebase origin/develop"
alias gplm="git fetch && git rebase origin/master"
alias gplmn="git fetch && git rebase origin/main"
alias gempty='git commit --allow-empty -m \"re-run checks\"'