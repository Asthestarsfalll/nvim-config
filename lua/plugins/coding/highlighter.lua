return {
  "azabiong/vim-highlighter",
  lazy = false, -- Not Lazy by default
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["]<C-R>"] = { "<Cmd>Hi><CR>", desc = "Next Recently Set Highlight" },
            ["[<C-R>"] = { "<Cmd>Hi<<CR>", desc = "Previous Recently Set Highlight" },
            ["]<C-F>"] = { "<Cmd>Hi{<CR>", desc = "Next Nearest Highlight" },
            ["[<C-F>"] = { "<Cmd>Hi}<CR>", desc = "Previous Nearest Highlight" },
          },
        },
      },
    },
  },
}