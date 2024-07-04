-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.bars-and-lines.statuscol-nvim" },
  -- { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.color.headlines-nvim" },

  { import = "astrocommunity.color.mini-hipatterns" },
  { import = "astrocommunity.color.tint-nvim" },
  -- import/override with your plugins folder
}
