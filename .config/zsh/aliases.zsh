alias cd='z' # Zoxide

# Better ls
if command -v eza &>/dev/null; then
  alias ls='eza --icons'
  alias ll='ls -lh --git'
  alias la='ls -lah --git'
  alias tree='ls --tree'
  compdef eza=ls
else
  echo 'Warning: eza command not found, will use ls instead'
  alias ls='ls --color'
  alias ll='ls -lh'
  alias la='ls -lah'
fi

# Better cat
if command -v bat &>/dev/null; then
  alias cat='bat'
  export MANPAGER='bat -l man -p'
elif command -v batcat &>/dev/null; then
  alias bat='batcat'
  alias cat='bat'
  export MANPAGER='bat -l man -p'
else
  echo 'Warning: neither bat nor batcat command found, will use cat instead'
fi

# Better find
if command -v fdfind &>/dev/null; then
  alias fd='fdfind'
fi

# Better grep
if command -v rg &>/dev/null; then
  alias grep='rg --color=auto'
else
  echo 'Warning: rg (ripgrep) command not found, will use grep instead'
  alias grep='grep --color=auto'
fi

alias diff='diff --color=auto'
alias df='df -h'

# Just use dash to cd into previous directory
alias -- -='cd -'

# Neovim instead of vim
alias vim='nvim'
