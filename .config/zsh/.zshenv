export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

if command -v nvim &>/dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
else
    export EDITOR="vim"
    export EDITOR="vim"
fi

export GPG_TTY=$(tty)

# need to set this in .zshrc on mac, otherwize .zprofile overrides it
# export PATH="/opt/homebrew/bin:$PATH"
# export PATH="$(brew --prefix ruby)/bin:$PATH"
# export PATH="$HOME/.gem/ruby/3.4.0/bin:$PATH"
# export PATH="$(brew --prefix openssh)/bin:$PATH"

# . "$HOME/.local/bin/env"
