if command -v nvim &> /dev/null; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

export PATH="/opt/homebrew/bin:$PATH"

eval "$(starship init zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pnpm
export PNPM_HOME="/Users/goox/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/goox/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/goox/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/goox/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/goox/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

set -o vi
bindkey -M viins 'jj' vi-cmd-mode

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.4.0/bin:$PATH"

. "$HOME/.local/bin/env"

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

