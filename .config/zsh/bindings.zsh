ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

ZVM_VI_HIGHLIGHT_BACKGROUND=none
ZVM_VI_HIGHLIGHT_FOREGROUND=none
ZVM_VI_HIGHLIGHT_EXTRASTYLE=none

ZVM_VI_INSERT_ESCAPE_BINDKEY='jj'

zvm_after_init() {
  # Control+Right
  bindkey '^[[1;5C' forward-word
  # Control+Left
  bindkey '^[[1;5D' backward-word

  # Control+E to edit command-line in $EDITOR
  autoload -Uz edit-command-line
  zle -N edit-command-line
  bindkey '^E' edit-command-line

  # Control+F to open fzf without hidden files
  bindkey '^F' _fzf_file_no_hidden

  bindkey '^\' autosuggest-toggle

  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}
