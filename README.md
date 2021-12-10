# Sourcery

A colorscheme

### Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Lightline](https://github.com/itchyny/lightline.vim)
- [Neogit](https://github.com/TimUntersberger/neogit)
- [vim-sneak](https://github.com/justinmk/vim-sneak)
- [Fern](https://github.com/lambdalisue/fern.vim)
- [Barbar](https://github.com/romgrk/barbar.nvim)

## Requirements

- Neovim >= 0.5.0

## Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'druskus20/sourcery.nvim', { 'branch': 'main' }
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'druskus20/sourcery.nvim'
```

## Usage

Enable the colorscheme:

```vim
" Vim Script
colorscheme sourcery
```

```lua
-- Lua
vim.cmd[[colorscheme sourcery]]
```

To enable the `sourcery` theme for `Lualine`, simply specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'sourcery'
    -- ... your lualine config
  }
}
```

To enable the `sourcery` colorscheme for `Lightline`:

```vim
" Vim Script
let g:lightline = {'colorscheme': 'sourcery'}
```

## ⚙️ Configuration

> ❗️ configuration needs to be set **BEFORE** loading the color scheme with `colorscheme sourcery`

The theme comes in three styles, `storm`, a darker variant `night` and `day`.

The **day** style will be used if:

- `vim.g.sourcery_style == "day"`
- or `vim.o.background == "light"`

| Option                              | Default   | Description                                                                                                                                                     |
| ----------------------------------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| sourcery_terminal_colors          | `true`    | Configure the colors used when opening a `:terminal` in Neovim                                                                                                  |
| sourcery_italic_comments          | `true`    | Make comments italic                                                                                                                                            |
| sourcery_italic_keywords          | `true`    | Make keywords italic                                                                                                                                            |
| sourcery_italic_functions         | `false`   | Make functions italic                                                                                                                                           |
| sourcery_italic_variables         | `false`   | Make variables and identifiers italic                                                                                                                           |
| sourcery_transparent              | `false`   | Enable this to disable setting the background color                                                                                                             |
| sourcery_hide_inactive_statusline | `false`   | Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**. |
| sourcery_sidebars                 | `{}`      | Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`                                                      |
| sourcery_transparent_sidebar      | `false`   | Sidebar like windows like `NvimTree` get a transparent background                                                                                               |
| sourcery_dark_sidebar             | `true`    | Sidebar like windows like `NvimTree` get a darker background                                                                                                    |
| sourcery_dark_float               | `true`    | Float windows like the lsp diagnostics windows get a darker background.                                                                                         |
| sourcery_colors                   | `{}`      | You can override specific color groups to use other groups or a hex color                                                                                       |
| sourcery_lualine_bold             | `false`   | When `true`, section headers in the lualine theme will be bold                                                                                                  |

```lua
-- Example config in Lua
vim.g.sourcery_italic_functions = true
vim.g.sourcery_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.sourcery_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme sourcery]]
```

```vim
" Example config in VimScript
let g:sourcery_style = "night"
let g:sourcery_italic_functions = 1
let g:sourcery_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:sourcery_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme sourcery
```

