# Daric Neovim Theme

Daric is a [Nord](https://www.nordtheme.com/) based colorscheme for Neovim, crafted with a significantly darker background for a focused, moon-like vibe. It aims for clear syntax highlighting while embracing a more subdued and monochrome feel, with tasteful Nord accents.

## ✨ Features

- Darker background based on Nord's Polar Night.
- Nord accent colors for syntax elements.
- Support for common Neovim plugins (Treesitter, LSP, Telescope, Lualine, etc.).
- Customizable options:
  - Italics for comments, keywords, functions.
  - Bold for keywords, functions.
  - Undercurl for errors.
  - Option for colored or monochrome variables.
  - Optional transparent floating windows.
  - Ability to override specific palette colors and highlight groups.

## 🖼️ Installation

Using `lazy.nvim`:

```lua
{
  "hangaos/daric.nvim", -- Replace with your GitHub username
  name = "daric",
  lazy = false,
  priority = 1000,
  config = function()
    require("daric").setup({
      -- Your preferred options here, e.g.:
      italic_comments = true,
      bold_keywords = true,
      -- ... more options ...
    })
    vim.cmd("colorscheme daric")
  end,
}
```
