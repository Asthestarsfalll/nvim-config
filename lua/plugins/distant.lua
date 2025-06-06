return {
  "chipsenkbeil/distant.nvim",
  enable = false,
  branch = "v0.3",
  cmd = {
    "DistantLaunch",
    "DistantOpen",
    "DistantConnect",
    "DistantInstall",
    "DistantMetadata",
    "DistantShell",
    "DistantShell",
    "DistantSystemInfo",
    "DistantClientVersion",
    "DistantSessionInfo",
    "DistantCopy",
  },
  opts = function(_, opts) opts["*"] = require("distant.settings").chip_default() end,
}
