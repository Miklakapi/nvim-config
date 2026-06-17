# nvim-config

Personal Neovim configuration used together with my dotfiles setup.

## Structure

- `init.lua` is the entry point.
- `lua/miklakapi/core/` contains general Neovim behavior: diagnostics, options, keymaps, and autocommands.
- `lua/miklakapi/lazy.lua` bootstraps lazy.nvim and loads plugins from `lua/miklakapi/plugins/`.
- `lua/miklakapi/plugins/` contains one plugin group per file.
- `after/queries/` contains custom Tree-sitter query overrides.
- `lazy-lock.json` locks plugin versions.

## Core

The core configuration defines the general editing behavior before plugins are loaded.

- `options.lua` sets the leader key to space, enables true color, line numbers, relative line numbers, mouse support, 4-space indentation, a 120-character guide, incremental search, and English spell checking.
- `diagnostics.lua` configures Neovim diagnostics with virtual text, signs, underline, sorted severity, and rounded floating windows.
- `autocmds.lua` adds editor automation such as yank highlighting, LSP keymaps, PHP indentation behavior, and custom spellcheck highlighting after colorscheme changes.

## Keymaps

This README does not list every keymap.
Most mappings are documented directly in `lua/miklakapi/core/keymaps.lua`.

A few important behaviors:

- `<C-f>` opens the `tmuxs` project picker in a new tmux window.
- `<C-j>` and `<C-k>` move through quickfix items.
- `<C-d>` and `<C-u>` scroll by a smaller fixed amount and keep the cursor centered.
- `Y` yanks to the system clipboard.
- visual `J` and `K` move selected lines up and down.

## Dotfiles integration

This config is designed to work together with my dotfiles repository.

The most visible integration is `<C-f>`, which opens the `tmuxs` project picker from the dotfiles setup.
That means the full project-switching workflow depends on the global commands installed by:

    ./run bin

from the dotfiles repository.

## Plugin groups

| File | Purpose |
| --- | --- |
| `theme.lua` | Loads the current colorscheme. This is intentionally simple because the theme may change over time. |
| `lualine.lua` | Configures the statusline with mode, branch, diff, filename, diagnostics, filetype, progress, and cursor location. |
| `satellite.lua` | Adds a scrollbar-like overview with Git changes and quickfix markers. |
| `fugitive.lua` | Adds Git commands inside Neovim, including status, blame, diff, push, and pull. |
| `gitsigns.lua` | Shows Git changes in the sign column and adds hunk actions such as preview, stage, reset, blame, and diff. |
| `autopairs.lua` | Automatically inserts matching pairs such as brackets, quotes, and parentheses while typing. |
| `autotag.lua` | Automatically closes and renames HTML/JSX/TSX tags using Tree-sitter. |
| `surround.lua` | Adds text object actions for adding, changing, and deleting surrounding characters or tags. |
| `telescope.lua` | Adds fuzzy finding for files, Git files, live grep, and open buffers. |
| `harpoon.lua` | Keeps a small project-specific list of frequently used files for quick switching. |
| `illuminate.lua` | Highlights other occurrences of the word under the cursor using LSP, Tree-sitter, or regex. |
| `treesitter.lua` | Installs and enables Tree-sitter parsers for the languages used in my projects. |
| `treesitter-context.lua` | Shows the current code context at the top of the window and can be toggled when needed. |
| `completion.lua` | Configures completion and snippets with nvim-cmp, LuaSnip, LSP, path, buffer, and command-line sources. |
| `lsp.lua` | Installs and configures language servers through Mason for Lua, TypeScript, Vue, ESLint, CSS/SCSS, PHP, Go, Python, Bash, and typos. |
| `formatting.lua` | Formats files with conform.nvim using Prettier, Stylua, shfmt, LSP fallback, and a project-local PHP CS Fixer command. |

The TypeScript setup uses `vtsls` with Vue support and optionally enables `ts-lit-plugin` when it is available in the current project.

PHP formatting expects a project-local `bin/php-cs-fixer` command.
