# starship
eval "$(starship init zsh)"

# envs
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="screen-256color"
export COLORTERM="truecolor"
export VISUAL=vim
export EDITOR=vim

# docker/podman
export REGISTRY_AUTH_FILE=$HOME/.config/containers/auth.json

# kubernetes
export KUBE_EDITOR=vim
#export KUBECONFIG=$([ -d $HOME/.kube/configs ] && find $HOME/.kube/configs -maxdepth 1 -type f | tr '\n' ':')
# kubernetes - lazy load via function
kubeconfig_refresh() {
  export KUBECONFIG=$([ -d $HOME/.kube/configs ] && find $HOME/.kube/configs -maxdepth 1 -type f 2>/dev/null | tr '\n' ':')
}
kubeconfig_refresh


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

# Performance options
setopt GLOB_STAR_SHORT

setopt SHARE_HISTORY APPEND_HISTORY HIST_IGNORE_SPACE HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS HIST_EXPIRE_DUPS_FIRST HIST_REDUCE_BLANKS

[[ -d ~/.zsh/cache ]] || mkdir -p ~/.zsh/cache

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# use cached dump if <24h old
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

autoload -U select-word-style
select-word-style bash

# edit command line
autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
# bindkey -M vicmd v edit-command-line

# aliases
alias ls='ls --color=auto'
alias l='ls -lhF'
alias ll='ls -alhF'
alias la='ls -lhtr'

alias v='nvim'
alias vim='nvim'

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

alias oc='podman run \
						--tty \
						--interactive \
						--rm \
						--name opencode \
						--env NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-bundle.pem \
						--volume ~/.config/opencode:/root/.config/opencode \
						--volume ~/.cache/opencode:/root/.cache/opencode \
						--volume ~/.local/share/opencode:/root/.local/share/opencode \
						--volume ~/.local/state/opencode:/root/.local/state/opencode \
						--volume ~/.ca-certificates-bundle.pem:/etc/ssl/certs/ca-bundle.pem:ro \
						--volume $(pwd):/workspace \
						--workdir /workspace \
						ghcr.io/anomalyco/opencode'

# os-specific
case "$OSTYPE" in
	darwin*) source "${ZDOTDIR:-${HOME}}/.zshrc-darwin" ;;
	linux*) source "${ZDOTDIR:-${HOME}}/.zshrc-linux" ;;
esac

# opencode
export PATH=/home/NKapishev/.opencode/bin:$PATH
