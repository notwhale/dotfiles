# Debian /etc/zsh/zshrc runs compinit before .zshrc extends fpath, forcing a
# zcompdump rebuild on every shell start (~1s). .zshrc runs compinit itself.
skip_global_compinit=1
