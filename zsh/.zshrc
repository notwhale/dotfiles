# starship

eval "$(starship init zsh)"

# envs

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="tmux-256color"
export COLORTERM="truecolor"
# export VISUAL=vim # can breaks shell control keys in tmux
# export EDITOR=vim # can breaks shell control keys in tmux

# directories

export DOTFILES="$HOME/dotfiles/"
export PROJECTS="$HOME/Documents/Projects/"
export NOTES="$HOME/Documents/Notes/"

# history

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

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

# fzf

source <(fzf --zsh)

# kubectl

source <(kubectl completion zsh)
kubectl completion zsh > "${fpath[1]}/_kubectl"

# helm

source <(helm completion zsh)
helm completion zsh > "${fpath[1]}/_helm"

# podman

source <(podman completion zsh)
podman completion -f "${fpath[1]}/_podman" zsh

# autocompletion

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

