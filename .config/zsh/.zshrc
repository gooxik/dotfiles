# Linux Homebrew
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -d /opt/homebrew/opt && eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$(brew --prefix ruby)/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.4.0/bin:$PATH"
export PATH="$(brew --prefix openssh)/bin:$PATH"

[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# Initialize zoxide (better cd command)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
else
  echo 'Warning: zoxide is not installed'
fi

# Setup autocompletion system
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/bindings.zsh"
source "$ZDOTDIR/prompt.zsh"
