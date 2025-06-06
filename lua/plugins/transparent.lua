local prefix = "<leader>u"
return {
  "xiyaowong/transparent.nvim",
  -- envent="User TrueLoad",
  lazy = false,
  config = function()
    local transparent = require "transparent"
    transparent.setup {
      groups = { -- table: default groups
        -- "Normal",
        -- "NormalNC",
        -- "Comment",
        -- "Constant",
        -- "Special",
        -- "Identifier",
        -- "Statement",
        -- "PreProc",
        -- "Type",
        -- "Underlined",
        -- "Todo",
        -- "String",
        -- "Function",
        -- "Conditional",
        -- "Repeat",
        -- "Operator",
        -- "Structure",
        -- "LineNr",
        -- "NonText",
        -- "SignColumn",
        -- "CursorLine",
        -- "CursorLineNr",
        -- "StatusLine",
        -- "StatusLineNC",
        -- "EndOfBuffer",
        -- "TabLine",
        -- "TabLineSel",
        -- "TabLineFill",
      },
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
      },
      exclude_groups = {
        "NotifyBackground",
        "CursorLine",
        "CursorLineNr",
        -- "StatusLine",
        -- "TabLine",
      },
    }
    transparent.clear_prefix "BufferLine"
    transparent.clear_prefix "NeoTree"
    transparent.clear_prefix "lualine"
    require("notify").setup {
      background_colour = "#000000",
    }
  end,
  keys = {
    { prefix .. "T", "<cmd>TransparentToggle<CR>", desc = "Toggle transparency" },
  },
}
