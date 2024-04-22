-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "rose-pine",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        CursorLineFold = { link = "CursorLineNr" }, -- highlight fold indicator as well as line number
        CursorLineNr = { fg = "#eb6f92", bold = true },
        TermCursor = { bg = "#eb6f92" },
        -- GitSignsCurrentLineBlame = { fg = nontext.fg, italic = true }, -- italicize git blame virtual text
        HighlightURL = { underline = true }, -- always underline URLs
        OctoEditable = { fg = "NONE", bg = "NONE" }, -- use treesitter for octo.nvim highlighting
        PmenuSel = { bg = "#31748f", fg = "#21202e", bold = true, italic = true },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
      BufferClose = "",
    },
    status = {
      attributes = {
        git_branch = { bold = true }, -- bold the git branch statusline component
        buffer_picker = { bold = true },
        buffer_active = { bold = true, italic = true },
        macro_recording = { bold = true },
        git_diff = { bold = false },
      },
      colors = {
        tabline_bg = "#191724",
        tabline_fg = "#191724",
        buffer_fg = "#31748f",
        buffer_close_fg = "#9ccfd8",
        buffer_bg = "#191724",
        buffer_active_fg = "#b4637a",
        buffer_active_close_fg = "#b4637a",
        buffer_active_bg = "#23223a",
      },
      icon_highlights = {
        breadcrumbs = false, -- LSP symbols in the breadcrumbs
        file_icon = {
          winbar = true, -- Filetype icon in the winbar inactive windows
          statusline = true, -- Filetype icon in the statusline
          tabline = true, -- Filetype icon in the tabline
        },
      },
      separators = {
        breadcrumbs = " > ",
        tab = { "", "" },
      },
    },
  },
}
