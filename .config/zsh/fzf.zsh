# Setup Fuzzy finder
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
else
  echo "Warning: fzf is not installed"
fi

fd="$(command -v fd 2>/dev/null)"
fdfind="$(command -v fdfind 2>/dev/null)"

if [[ "$fd" == "" && "$fdfind" == "" ]]; then
  echo "Warning: neither fd nor fdinfo command found, will use find instead"
  export FZF_DEFAULT_COMMAND="find . -type f"
elif [[ "$fd" != "" ]]; then
  export FZF_DEFAULT_COMMAND="fd --type f --hidden --strip-cwd-prefix"
elif [[ "$fdinfo" != "" ]]; then
  export FZF_DEFAULT_COMMAND="fdinfo --type f --hidden --strip-cwd-prefix"
fi

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --style=numbers --color=always {}'"

_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "$cmd" | fzf) && LBUFFER+="$result"
  zle reset-prompt
}
zle -N _fzf_file_no_hidden
