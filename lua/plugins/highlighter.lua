return {
  "azabiong/vim-highlighter",
  lazy = true, -- Not Lazy by default
  event="User TrueLoad",
  keys = {
    -- These are basing keymaps to guide new users
    { "f<Enter>", desc = "Highlight" },
    { "f<BS>", desc = "Remove Highlight" },
    { "f<C-L>", desc = "Clear Highlight" },
    { "f<Tab>", desc = "Find Highlight (similar to Telescope grep)" },
    -- They are derivated from the default keymaps, see README.md to github repo for documentation
    { "]<C-R>", "<cmd>Hi><CR>", desc = "Next Recently Set Highlight" },
    { "[<C-R>", "<cmd>Hi<<CR>", desc = "Previous Recently Set Highlight" },
    { "]<C-F>", "<cmd>Hi{<CR>", desc = "Next Nearest Highlight" },
    { "[<C-F>", "<cmd>Hi}<CR>", desc = "Previous Nearest Highlight" },
  },
}
