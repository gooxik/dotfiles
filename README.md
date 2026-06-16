# dotfiles

My personal, XDG-compliant dotfiles. The repository mirrors `~/.config` and is
managed with [GNU Stow](https://www.gnu.org/software/stow/), which symlinks the
tracked files into your home directory. Plugins and tooling are
**self-bootstrapping** — they install themselves on first launch.

Everything is themed with **Catppuccin Mocha** for a consistent look across the
shell, editor, prompt, and terminal.

## Contents

| Tool | Config | Description |
|------|--------|-------------|
| [Zsh](https://www.zsh.org/) | `.config/zsh/` | Primary shell with a modular config |
| [Neovim](https://neovim.io/) | `.config/nvim/` | Editor configured in Lua via [lazy.nvim](https://github.com/folke/lazy.nvim) |
| [Starship](https://starship.rs/) | `.config/starship.toml` | Cross-shell prompt |
| [Ghostty](https://ghostty.org/) | `.config/ghostty/config` | Terminal emulator |

## Prerequisites

These tools are expected to be on your `PATH` (install via Homebrew or your
package manager):

- Core: `zsh`, `neovim`, `starship`, `git`, `gpg`, `stow`
- CLI replacements: `zoxide`, `fzf`, `eza`, `bat`, `fd`, `ripgrep`

The Zsh config gracefully falls back to standard tools (`ls`, `cat`, `find`,
`grep`, `cd`) when a replacement is not installed.

## Installation

1. **Clone the repo into your home directory:**

   ```sh
   git clone https://github.com/gooxik/dotfiles.git "$HOME/dotfiles"
   ```

2. **Symlink the files with Stow.** Run from the repo root with `$HOME` as the
   target:

   ```sh
   cd "$HOME/dotfiles"
   stow --target="$HOME" .
   ```

   This symlinks the tracked `.config/` contents into `~/.config`. Use
   `stow -D .` to unstow or `stow -R .` to restow after changes.

3. **Point Zsh at the config directory.** This config uses
   `$ZDOTDIR/.config/zsh`, so you must set `ZDOTDIR` in a `~/.zshenv` (this file
   lives in `$HOME` and is intentionally **not** part of the repo):

   ```sh
   echo 'export ZDOTDIR="$HOME/.config/zsh"' >> "$HOME/.zshenv"
   ```

4. **Start a new shell.** On first launch:
   - the custom Zsh plugin loader clones any missing plugins into
     `.config/zsh/plugins/` (gitignored),
   - Neovim bootstraps `lazy.nvim` and installs all plugins the first time you
     run `nvim`.

## Structure

```
.config/
├── ghostty/config        # terminal: Catppuccin Mocha, blur, opacity
├── starship.toml         # prompt: single-line, git + language versions
├── nvim/
│   ├── init.lua
│   ├── lazy-lock.json    # pinned plugin versions
│   └── lua/
│       ├── config/       # options, keymaps, autocmds, lazy bootstrap
│       ├── plugins/      # one spec file per plugin
│       └── servers/      # LSP server configs (lua_ls, bashls, ts_ls)
└── zsh/
    ├── .zshenv           # XDG base dirs, EDITOR/VISUAL, GPG_TTY
    ├── .zshrc            # entry point: history, options, sources modules
    ├── aliases.zsh       # modern CLI replacements w/ fallbacks
    ├── bindings.zsh      # vi-mode, history search, fzf widgets
    ├── fzf.zsh           # fzf defaults (fd source, bat preview)
    ├── plugins.zsh       # lightweight git-clone plugin manager
    └── prompt.zsh        # starship init
```

## Zsh

- **Modular**: `.zshrc` sources `fzf → plugins → aliases → bindings → prompt`.
- **Plugin manager**: a small custom loader (`_zplugin_load`) clones plugins
  from GitHub on demand. Update them all with `zplugin-update`.
- **Plugins**: syntax highlighting (zsh-syntax-highlighting + fast-syntax-
  highlighting), autosuggestions, history-substring-search, and zsh-vi-mode.
- **Vi mode**: `jj` exits insert mode; cursor changes shape per mode; Ctrl+R
  still opens fzf history.
- **Aliases**: `cd`→zoxide, `ls`→eza, `cat`→bat, `find`→fd, `grep`→ripgrep,
  `vim`→nvim, and more.
- **Cross-platform**: handles both macOS (`/opt/homebrew`) and Linux Homebrew.

## Neovim

- Lua config managed by **lazy.nvim** (auto-bootstrapped).
- **LSP** via `nvim-lspconfig` + **Mason** (`lua_ls`, `bashls`, `ts_ls`).
- **Completion** via `nvim-cmp` + LuaSnip + friendly-snippets.
- **Fuzzy finding** with `fzf-lua` (`<leader>f*`).
- File tree (`nvim-tree`), statusline (`lualine`), `treesitter`, `which-key`,
  and a suite of `mini.nvim` modules.
- Leader key is `<Space>`. Persistent undo, system clipboard, spell (en/de),
  and treesitter-based folding are enabled.

## Notes

- Vendored Zsh plugins and `.zcompdump` are gitignored and regenerated locally.
- Files are symlinked with Stow; plugins install themselves on first launch.
