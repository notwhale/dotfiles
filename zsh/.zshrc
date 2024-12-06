# starship

eval "$(starship init zsh)"

# envs

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
# export TERM="tmux-256color"
export TERM="screen-256color"
export COLORTERM="truecolor"
export VISUAL=vim
export EDITOR=vim
export KUBE_EDITOR=vim
export KUBECONFIG=~/.kube/config

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
# alias vim='nvim'

alias t='tmux a || tmux new'
alias tl='tmux ls'
alias sshpw='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

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

case "$OSTYPE" in
	darwin*)
		source "${ZDOTDIR:-${HOME}}/.zshrc-darwin"
	;;
	linux*)
		source "${ZDOTDIR:-${HOME}}/.zshrc-linux"
	;;
esac
