return {
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
        mappings = {
          i = {
            k = {
              j = "<Esc>",
            },
          },
          c = {
            k = {
              j = "<Esc>",
            },
          },
          t = {
            k = {
              j = "<C-\\><C-n>",
            },
          },
          s = {
            k = {
              j = "<Esc>",
            },
          },
        },
      }
    end,
  },
      {
    "h-hg/fcitx.nvim",
    event = "BufEnter",
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "User AstroFile",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "Asthestarsfalll/clock.nvim",
    -- event = "User TrueLoad",
    event = "VeryLazy",
    config = function() require("clock").setup {} end,
  },
  {
    "simonmclean/triptych.nvim",
    event = "User TrueLoad",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
      require("triptych").setup {
        mappings = {
          -- Everything below is buffer-local, meaning it will only apply to Triptych windows
          show_help = "g?",
          jump_to_cwd = ".", -- Pressing again will toggle back
          nav_left = "h",
          nav_right = { "l", "<CR>" },
          delete = "d",
          add = "a",
          copy = "c",
          rename = "r",
          cut = "x",
          paste = "p",
          quit = "q",
          toggle_hidden = "<leader>.",
        },
        extension_mappings = {},
        options = {
          dirs_first = true,
          show_hidden = false,
          line_numbers = {
            enabled = true,
            relative = false,
          },
          file_icons = {
            enabled = true,
            directory_icon = "",
            fallback_file_icon = "",
          },
          column_widths = { 0.25, 0.25, 0.5 }, -- Must add up to 1 after rounding to 2 decimal places
          highlights = { -- Highlight groups to use. See `:highlight` or `:h highlight`
            file_names = "NONE",
            directory_names = "NONE",
          },
          syntax_highlighting = { -- Applies to file previews
            enabled = true,
            debounce_ms = 100,
          },
        },
        git_signs = {
          enabled = true,
          signs = {
            add = "+",
            modify = "~",
            rename = "r",
            untracked = "?",
          },
        },
        diagnostic_signs = {
          enabled = true,
        },
      }
    end,
    keys = {
      { "<leader>-", ":Triptych<CR>", desc = "pick close", silent = true, noremap = true },
    },
  },
  {
    "arsham/indent-tools.nvim",
    dependencies = { "arsham/arshlib.nvim" },
    event = "User AstroFile",
    config = function()
      require("indent-tools").config {
        normal = {
          up = "[p",
          down = "][",
          repeatable = true, -- requires nvim-treesitter-textobjects
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufEnter",
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    },
    keys = {
      {
        "[c",
        function() require("treesitter-context").go_to_context(vim.v.count1) end,
        desc = "Jumping to context (upwards)",
      },
    },
  },
}