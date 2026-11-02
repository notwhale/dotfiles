eval "$(starship init zsh)"
# prompt
# %-escapes only: no forks, no cost per prompt. gruvbox dark.
# PROMPT=$'%F{#d79921}%~%f\n%# '

# OS file first: it sets fpath and ZSH_SHARE_DIR, both needed by compinit/plugins below.
case "$OSTYPE" in
  darwin*) source "${ZDOTDIR:-$HOME}/.zshrc-darwin" ;;
  linux*)  source "${ZDOTDIR:-$HOME}/.zshrc-linux"  ;;
  *)       print -u2 "unknown OSTYPE: $OSTYPE" ;;
esac

# ENV
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="screen-256color"
export COLORTERM="truecolor"
export VISUAL=nvim
export EDITOR=nvim
export KUBE_EDITOR=nvim
export REGISTRY_AUTH_FILE=$HOME/.config/containers/auth.json

[[ -d $HOME/.opencode/bin ]] && export PATH="$HOME/.opencode/bin:$PATH"

# completion: generate once into fpath, per each tool's own docs
# Regenerated only when the binary is newer. $commands is zsh's hash table, no fork.
() {
  local dir=$HOME/.local/share/zsh/completions tool
  [[ -d $dir ]] || mkdir -p "$dir"
  for tool in kubectl helm podman; do
    (( $+commands[$tool] )) || continue
    [[ -f $dir/_$tool && $dir/_$tool -nt $commands[$tool] ]] && continue
    case $tool in
      kubectl) command kubectl completion zsh     >"$dir/_$tool" ;;
      helm)    command helm    completion zsh     >"$dir/_$tool" ;;
      podman)  command podman  completion zsh -f "$dir/_$tool" ;;
    esac
  done
} 2>/dev/null

fpath=("$HOME/.local/share/zsh/completions" $fpath)  # must before compinit
typeset -U fpath  # .zshrc-linux prepends /usr/share/zsh/site-functions, already in default fpath

bindkey -e
# fzf is sourced at the top and takes ^I; give Tab back to zsh. Removing this
# line silently hands Tab to fzf-completion.
bindkey '^I' expand-or-complete

# No -C: compinit rebuilds the dump when completion files change, and self-heals
# after a tool upgrade. Costs ~9ms vs -C. Force a rebuild with: rm ~/.zcompdump
# Ask why a dump was not loaded: compinit -w
autoload -Uz compinit && compinit

[[ -d ~/.zsh/cache ]] || mkdir -p ~/.zsh/cache
zstyle ':completion:*' use-cache on      # cache match lists per command
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' format '%B%d%b'

autoload -U select-word-style
select-word-style bash

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HISTDUP=erase

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt GLOB_STAR_SHORT
setopt NUMERIC_GLOB_SORT
setopt INTERACTIVE_COMMENTS
setopt NO_FLOW_CONTROL
setopt NO_BEEP

# ZSH Plugins
source $ZSH_SHARE_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
typeset -g ZSH_AUTOSUGGEST_USE_ASYNC=1

source $ZSH_SHARE_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # must be last
ZSH_HIGHLIGHT_STYLES[comment]='fg=102'

# --- kubernetes ------------------------------------------------------------
# KUBECONFIG is joined on kubectl call, not at shell start: glob, no forks, and
# new context files are picked up without a restart. No dir -> leave unset so
# kubectl falls back to ~/.kube/config.
kubectl() {
  local dir=$HOME/.kube/configs
  if [[ -d $dir ]]; then
    local -a cfgs
    cfgs=($dir/*(N.))
    (( $#cfgs )) && export KUBECONFIG=${(j.:.)cfgs}
  fi
  command kubectl "$@"
}

# Aliases
alias ls='ls --color=auto'
alias l='ls -lhF'
alias ll='ls -alhF'
alias la='ls -lhtr'

# alias v='nvim'
# alias vim='nvim'

alias t='tmux a || tmux new'
alias tl='tmux ls'
alias sshpw='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'
alias lg='lazygit'
