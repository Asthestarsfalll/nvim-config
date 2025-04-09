-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "wakatime/vim-wakatime",
    event = "VimEnter",
  },
  {
    "rose-pine/neovim",
    event = "User TrueLoad",
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

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "folke/tokyonight.nvim",
  {
    "h-hg/fcitx.nvim",
    event = "BufEnter",
  },
  {
    "0x00-ketsu/maximizer.nvim",
    config = function()
      require("maximizer").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "User TrueLoad",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "User TrueLoad",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    event = "User TrueLoad",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "ahmedkhalf/project.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "mvllow/modes.nvim",
    event = "User TrueLoad",
    tag = "v0.2.0",
    config = function()
      require("modes").setup {
        colors = {
          -- copy = "#f5c359",
          -- -- delete = "#c75c6a",
          -- delete = "#c75c6a",
          -- -- insert = "#78ccc5",
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
  {
    "Asthestarsfalll/clock.nvim",
    -- event = "User TrueLoad",
    event = "VeryLazy",
    config = function() require("clock").setup {} end,
  },
  { "junegunn/vim-easy-align", event = "User AstroFile" },
  {
    "Aasim-A/scrollEOF.nvim",
    event = "User AstroFile",
    config = function()
      require("scrollEOF").setup {
        -- The pattern used for the internal autocmd to determine
        -- where to run scrollEOF. See https://neovim.io/doc/user/autocmd.html#autocmd-pattern
        pattern = "*",
        -- Whether or not scrollEOF should be enabled in insert mode
        insert_mode = false,
        -- List of filetypes to disable scrollEOF for.
        disabled_filetypes = {},
        -- List of modes to disable scrollEOF for. see https://neovim.io/doc/user/builtin.html#mode() for available modes.
        disabled_modes = {},
      }
    end,
  },
  { "f-person/git-blame.nvim" },
  {
    "karb94/neoscroll.nvim",
    -- event = "User TrueLoad",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
      }
    end,
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
  { "LudoPinelli/comment-box.nvim", event = "BufEnter" },
  {
    "Asthestarsfalll/excore.nvim",
    ft = "toml",
    event = "User TrueLoad",
    config = function()
      require("excore").setup {
        cache_dir = nil,
      }
    end,
  },

  {
    "rebelot/heirline.nvim",
    event = "User TrueLoad",
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = "User TrueLoad",
  },
  {
    "NeogitOrg/neogit",
    event = "User TrueLoad",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
    },
    config = true,
    -- config = function() require("neogit").setup {} end,
  },

  {
    "sindrets/diffview.nvim",
    event = "User TrueLoad",
    config = function()
      require("diffview").setup {
        enhanced_diff_hl = true,
      }
    end,
  },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {
      bg = "gray",
      drop_shadow_blur = "68px",
      drop_shadow = false,
      drop_shadow_offset_y = "20px",
      font_family = "Hack",
      font_size = "18px",
      line_height = "133%",
      line_numbers = true,
      theme = "rose-pine",
      titlebar = "Made with carbon-now.nvim",
      watermark = false,
      width = "680",
      window_theme = "sharp",
      padding_horizontal = "0px",
      padding_vertical = "0px",
    },
  },
  {
    "mikavilpas/yazi.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    enabled = function()
      if vim.fn.executable "yazi" == 1 then return true end
      return false
    end,
    lazy = true,
    keys = {
      {
        "<C-->",
        function() require("yazi").yazi() end,
        desc = "Open the file manager",
      },
      {
        "<leader>a",
        function() require("yazi").yazi(nil, vim.fn.getcwd()) end,
        desc = "Open yazi in CWD",
      },
    },
    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 1,
    },
  },
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function() require("inlay-hints").setup() end,
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
  -- TODO:https://github.com/AstroNvim/AstroNvim/issues/2593{
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "User TureLoad",
    cmd = "HighlightColors",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<Leader>uz"] = { function() vim.cmd.HighlightColors "Toggle" end, desc = "Toggle color highlight" }
        end,
      },
    },
    opts = {
      enabled_named_colors = false,
      render = "virtual",
      virtual_symbol_position = "inline",
      enable_tailwind = true,
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "User AstroFile",
    main = "rainbow-delimiters.setup",
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
  {
    name = "code-tracker",
    dir = "/data/workspace/learning/filereader",
    lazy = false,
    config = function()
      require("code-tracker").setup {
        -- 可选配置
        position = "right", -- 或 "float"
        width = 30,
        height = 20,
        mappings = {
          toggle = "<leader>ct", -- 自定义快捷键
          toggle_float = "<leader>cf",
        },
      }
    end,
  },
}
