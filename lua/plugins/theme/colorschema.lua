return {
      {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("rose-pine").setup {
        highlight_groups = {
          Substitute = { bg = "love", fg = "text" },
          -- Blend colours against the "base" background
          CursorLine = { bg = "iris", blend = 15 },
          StatusLine = { fg = "love", bg = "love", blend = 15 },
        },
      }
    end,
  },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- "folke/tokyonight.nvim",
  {
    "mvllow/modes.nvim",
    -- event = "User AstroFile",
    tag = "v0.2.0",
  specs = {
    { "folke/which-key.nvim", optional = true, opts = { plugins = { presets = { operators = false } } } },
  },
    config = function()
      require("modes").setup {
        colors = {
          copy = "#f5c359",
          -- -- delete = "#c75c6a",
          delete = "#c75c6a",
          insert = "#78ccc5",
          -- insert = "#c75c6a",
          visual = "#9745be",
        },

        -- Set opacity for cursorline and number background
        line_opacity = 0.25,

        -- Enable cursor highlights
        set_cursor = true,

        -- Enable cursorline initially, and disable cursorline for inactive windows
        -- or ignored filetypes
        set_cursorline = true,
        -- Enable line number highlights to match cursorline
        set_number = true,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { "NvimTree", "TelescopePrompt" },
      }
    end,
  },
}