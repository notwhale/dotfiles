# starship

eval "$(starship init zsh)"

# envs

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="tmux-256color"
export COLORTERM="truecolor"
export VISUAL=nvim
export EDITOR=nvim
export KUBE_EDITOR=nvim
export KUBECONFIG=~/.kube/config
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# directories

export DOTFILES="$HOME/dotfiles/"
export PROJECTS="$HOME/Documents/Projects/"
export NOTES="$HOME/Documents/Notes/"

# zsh

# emacs keymap
bindkey -e

# vi keymap
# bindkey -v
# export KEYTIMEOUT=1

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS

zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload -U select-word-style
select-word-style bash

autoload -Uz compinit && compinit

# aliases

alias ls='ls --color=auto'
alias l='ls -lhF'
alias ll='ls -alhF'
alias la='ls -lhtr'

alias v='nvim'
alias vim='nvim'

alias t='tmux a || tmux new'
alias tl='tmux ls'

alias gp='git pull'
alias gs='git status'
alias lg='lazygit'

alias k='kubectl'
alias kgp='kubectl get pods'
alias kc='kubectx'
alias kn='kubens'

alias dot='cd $DOTFILES'
alias prj='cd $PROJECTS'
alias note='cd $NOTES'

# homebrew

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# ssh agent
# SSH_AUTH_SOCK=$(launchctl asuser "${UID:-"$(id -u)"}" launchctl getenv SSH_AUTH_SOCK)
# if test "$SSH_AUTH_SOCK" ; then
#     ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
# fi

# fzf

source <(fzf --zsh)

# kubectl

source <(kubectl completion zsh)
kubectl completion zsh > "${fpath[1]}/_kubectl"

# helm

source <(helm completion zsh)
helm completion zsh > "${fpath[1]}/_helm"

# podman

if type podman &>/dev/null; then
  source <(podman completion zsh)
  podman completion -f "${fpath[1]}/_podman" zsh
fi

# autosuggestions and highlighting

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
set ZSH_AUTOSUGGEST_USE_ASYNC=true
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
