-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        -- guifont = "CaskaydiaCove Nerd Font:h14",
        foldlevel = 99,
        foldmethod = "expr",
        foldexpr = "v:lua.require'utils'.foldexpr()",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        -- ["<Leader>r"] = { "<cmd>RustRun<cr>" },
        ["<Leader>="] = { "<cmd>Navbuddy<cr>" },
        ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        ["<C-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal" },
        ["<S-w>"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },

        -- Navigate tabs
        ["<Leader>]"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
        ["<Leader>["] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },

        -- Cursorline
        ["<Leader>Ou"] = { "<cmd>highlight CursorLine gui=underline cterm=underline<cr>", desc = "CursorLine Underine" },
        ["<Leader>Or"] = { "<cmd>highlight CursorLine gui=reverse cterm=reverse<cr>", desc = "CursorLine Reverse" },

        -- maximizer
        ["mt"] = { "<cmd>lua require('maximizer').toggle()<CR>" },
        ["mn"] = { "<cmd>lua require('maximizer').maximize()<CR>" },
        ["mr"] = { "<cmd>lua require('maximizer').restore()<CR>" },

        ["ga"] = { "<cmd>EasyAlign<CR>" },

        ["<Leader>ln"] = { "<cmd>NoiceDismiss<CR>" },
        ["ge"] = { "<cmd>ToClass<CR>" },
      },
      v = {

        ["ga"] = { "<cmd>EasyAlign<CR>" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      },
      i = {
        ["<C-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal" },

        ["<C-h>"] = { "<Left>" },
        ["<C-j>"] = { "<Down>" },
        ["<C-k>"] = { "<up>" },
        ["<C-l>"] = { "<Right>" },
      },
    },
  },
}
