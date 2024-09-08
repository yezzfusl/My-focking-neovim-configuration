# My-focking-neovim-configuration

Welcome to my Neovim configuration repository! This README provides a comprehensive list of all key bindings defined in the configuration.

## Table of Contents

1. [General Keybindings](#general-keybindings)
2. [File Operations](#file-operations)
3. [Git Operations](#git-operations)
4. [LSP Keybindings](#lsp-keybindings)
5. [Debugger Keybindings](#debugger-keybindings)
6. [Flutter and Dart Keybindings](#flutter-and-dart-keybindings)
7. [Telescope Keybindings](#telescope-keybindings)
8. [Copilot Keybindings](#copilot-keybindings)
9. [Split Navigation](#split-navigation)
10. [Terminal Mappings](#terminal-mappings)
11. [Quickfix List Navigation](#quickfix-list-navigation)
12. [Buffer Navigation](#buffer-navigation)
13. [Markdown Preview](#markdown-preview)

## General Keybindings

| Keybinding | Description |
|------------|-------------|
| `<space>` | Leader key |
| `<leader>e` | Toggle Neo-tree file explorer |
| `<leader>z` | Toggle Zen mode |
| `<leader>tw` | Toggle Twilight |
| `<leader>h` | Clear search highlighting |
| `<leader>w` | Toggle word wrap |
| `<leader>ln` | Toggle line numbers |
| `<leader>sp` | Toggle spell check |
| `<leader>rn` | Toggle relative line numbers |
| `n` | Center view on next search result |
| `N` | Center view on previous search result |
| `<` (in visual mode) | Decrease indentation and keep selection |
| `>` (in visual mode) | Increase indentation and keep selection |
| `J` (in visual mode) | Move selected lines down |
| `K` (in visual mode) | Move selected lines up |
| `<leader>y` | Yank to system clipboard |
| `<leader>p` | Paste from system clipboard |
| `<leader>w` | Quick save |
| `<leader>q` | Quick quit |
| `<leader>so` | Source current file |

## File Operations

| Keybinding | Description |
|------------|-------------|
| `<leader>nf` | Create a new file |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Browse files |
| `<leader>fh` | Help tags |
| `<leader>fp` | Browse projects |
| `<leader>fr` | Recent files |
| `<leader>fs` | Save file |
| `<leader>fS` | Save all files |
| `<leader>fd` | Find in dotfiles |

## Git Operations

| Keybinding | Description |
|------------|-------------|
| `<leader>gc` | Open LazyGit |
| `<leader>gg` | Toggle Gitsigns |
| `<leader>gb` | Toggle git blame |
| `<leader>gd` | View git diff |
| `<leader>gp` | Preview git hunk |
| `<leader>gc` | Generate commit message |
| `<leader>cc` | Open conventional commits |

## LSP Keybindings

| Keybinding | Description |
|------------|-------------|
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `K` | Hover information |
| `gi` | Go to implementation |
| `<C-k>` | Signature help |
| `<space>wa` | Add workspace folder |
| `<space>wr` | Remove workspace folder |
| `<space>wl` | List workspace folders |
| `<space>D` | Type definition |
| `<space>rn` | Rename |
| `<space>ca` | Code action |
| `gr` | Find references |
| `<space>f` | Format code |

## Debugger Keybindings

| Keybinding | Description |
|------------|-------------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Open REPL |
| `<leader>dl` | Run last |
| `<leader>du` | Toggle DAP UI |

## Flutter and Dart Keybindings

| Keybinding | Description |
|------------|-------------|
| `<leader>fr` | Flutter Run |
| `<leader>fd` | Flutter Devices |
| `<leader>fe` | Flutter Emulators |
| `<leader>fR` | Flutter Reload |
| `<leader>fF` | Flutter Restart |
| `<leader>fq` | Flutter Quit |
| `<leader>fD` | Flutter Detach |
| `<leader>fo` | Flutter Outline Toggle |
| `<leader>fO` | Flutter Outline Open |
| `<leader>ft` | Flutter DevTools |
| `<leader>fp` | Flutter Copy Profiler URL |
| `<leader>fl` | Flutter LSP Restart |
| `<leader>fc` | Create Flutter Project |
| `<leader>fw` | Run Flutter Web |
| `<leader>fb` | Build Flutter Web |
| `<leader>ft` | Run Flutter Tests |

## Telescope Keybindings

| Keybinding | Description |
|------------|-------------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Browse buffers |
| `<leader>fh` | Help tags |
| `<leader>fc` | Colorscheme |
| `<leader>f/` | Fuzzy find in current buffer |
| `<leader>gc` | Git commits |
| `<leader>gfc` | Git commits (for current buffer) |
| `<leader>gb` | Git branches |
| `<leader>gs` | Git status |

## Copilot Keybindings

| Keybinding | Description |
|------------|-------------|
| `<C-J>` | Accept Copilot suggestion |
| `<C-H>` | Previous Copilot suggestion |
| `<C-K>` | Next Copilot suggestion |

## Split Navigation

| Keybinding | Description |
|------------|-------------|
| `<C-h>` | Move to left split |
| `<C-j>` | Move to bottom split |
| `<C-k>` | Move to top split |
| `<C-l>` | Move to right split |

## Terminal Mappings

| Keybinding | Description |
|------------|-------------|
| `<Esc>` | Exit terminal mode |
| `<leader>t` | Open terminal in split |

## Quickfix List Navigation

| Keybinding | Description |
|------------|-------------|
| `]q` | Next quickfix item |
| `[q` | Previous quickfix item |
| `<leader>qo` | Open quickfix list |
| `<leader>qc` | Close quickfix list |

## Buffer Navigation

| Keybinding | Description |
|------------|-------------|
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bd` | Delete buffer |

## Markdown Preview

| Keybinding | Description |
|------------|-------------|
| `<leader>mp` | Start Markdown preview |
| `<leader>ms` | Stop Markdown preview |
| `<leader>mt` | Toggle Markdown preview |


