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
            large_buf = {size = 1024 * 256, lines = 10000}, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics = {virtual_text = true, virtual_lines = false}, -- diagnostic settings on startup
            highlighturl = true, -- highlight URLs at start
            notifications = true -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {virtual_text = true, underline = true},
        -- passed to `vim.filetype.add`
        filetypes = {
            -- see `:h vim.filetype.add` for usage
            extension = {foo = "fooscript"},
            filename = {[".foorc"] = "fooscript"},
            pattern = {[".*/etc/foo/.*"] = "fooscript"}
        },
        -- vim options can be configured here
        options = {
            opt = { -- vim.opt.<key>
                relativenumber = true, -- sets vim.opt.relativenumber
                number = true, -- sets vim.opt.number
                spell = false, -- sets vim.opt.spell
                signcolumn = "yes", -- sets vim.opt.signcolumn to yes
                wrap = false, -- sets vim.opt.wrap
                -- guifont = { "CaskaydiaCove Nerd Font", "Maple Mono", "JetBrains Mono", "WenQuanYi Micro Hei Mono:h12" }
                guifont = { "Maple Mono", "JetBrains Mono", "WenQuanYi Micro Hei Mono:h12" }
            },
            g = { -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
            }
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
            n = {
                -- second key is the lefthand side of the map

                -- navigate buffer tabs
                ["]b"] = {
                    function()
                        require("astrocore.buffer").nav(vim.v.count1)
                    end,
                    desc = "Next buffer"
                },
                ["[b"] = {
                    function()
                        require("astrocore.buffer").nav(-vim.v.count1)
                    end,
                    desc = "Previous buffer"
                },

                -- mappings seen under group name "Buffer"
                ["<Leader>bd"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(
                            function(bufnr)
                                require("astrocore.buffer").close(bufnr)
                            end)
                    end,
                    desc = "Close buffer from tabline"
                },

                -- tables with just a `desc` key will be registered with which-key if it's installed
                -- this is useful for naming menus
                ["<Leader>bn"] = {"<cmd>tabnew<cr>", desc = "New tab"},
                ["<C-s>"] = {":w!<cr>", desc = "Save File"}, -- change description but the same command
                ["<C-\\>"] = {
                    "<cmd>ToggleTerm direction=float<cr>",
                    desc = "Toggle terminal"
                },
                ["<S-w>"] = {
                    function()
                        require("astrocore.buffer").close()
                    end,
                    desc = "Close buffer"
                },
                ["<Leader>nh"] = {
                    function()
                        require("snacks").notifier.show_history()
                    end,
                    desc = "Notification History"
                },
                ["<Leader>nc"] = {
                    function()
                        require("snacks").notifier.hide()
                    end,
                    desc = "Dismiss All Notifications"
                },

                -- Navigate tabs
                ["<Leader>]"] = {
                    function() vim.cmd.tabnext() end,
                    desc = "Next tab"
                },
                ["<Leader>["] = {
                    function() vim.cmd.tabprevious() end,
                    desc = "Previous tab"
                },

                -- Cursorline
                -- ["<Leader>Ou"] = { "<cmd>highlight CursorLine gui=underline cterm=underline<cr>", desc = "CursorLine Underine" },
                -- ["<Leader>Or"] = { "<cmd>highlight CursorLine gui=reverse cterm=reverse<cr>", desc = "CursorLine Reverse" },

                -- maximizer
                ["mt"] = {"<cmd>lua require('maximizer').toggle()<CR>"},
                ["mn"] = {"<cmd>lua require('maximizer').maximize()<CR>"},
                ["mr"] = {"<cmd>lua require('maximizer').restore()<CR>"},

                ["ga"] = {"<cmd>EasyAlign<CR>"},

                ["<Leader>wa"] = {"<cmd>WindowsToggleAutowidth<CR>"},
                ["<Leader>we"] = {"<cmd>WindowsEqualize<CR>"},
                ["<Leader>wm"] = {"<cmd>WindowsMaximize<CR>"},
                ["<Leader>wv"] = {"<cmd>WindowsMaximizeVertically<CR>"},
                ["<Leader>ws"] = {"<cmd>WindowsMaximizeHorizontally<CR>"}
            },
            v = {["ga"] = {"<cmd>EasyAlign<CR>"}},
            t = {["<C-\\>"] = {"<cmd>ToggleTerm<cr>", desc = "Toggle terminal"}},
            i = {
                ["<C-\\>"] = {
                    "<cmd>ToggleTerm direction=float<cr>",
                    desc = "Toggle terminal"
                },

                ["<C-h>"] = {"<Left>"},
                ["<C-j>"] = {"<Down>"},
                ["<C-k>"] = {"<up>"},
                ["<C-l>"] = {"<Right>"}

            }
            -- setting a mapping to false will disable it
            -- ["<C-S>"] = false,
        }
    }
}
