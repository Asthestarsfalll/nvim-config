-- Copy/Paste when using ssh on a remote server
-- Only works on Neovim >= 0.10.0
if vim.clipboard and vim.clipboard.osc52 then
    vim.api.nvim_create_autocmd("VimEnter", {
        group = augroup "ssh_clipboard",
        callback = function()
            if vim.env.SSH_CONNECTION and vim.clipboard.osc52 then
                vim.g.clipboard = {
                    name = "OSC 52",
                    copy = {
                        ["+"] = require("vim.clipboard.osc52").copy,
                        ["*"] = require("vim.clipboard.osc52").copy
                    },
                    paste = {
                        ["+"] = require("vim.clipboard.osc52").paste,
                        ["*"] = require("vim.clipboard.osc52").paste
                    }
                }
            end
        end
    })
end

-- -- auto change root
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function(ctx)
--     local root = vim.fs.root(ctx.buf, { ".git", ".svn", "Makefile", "mvnw", "package.json" })
--     if root and root ~= "." and root ~= vim.fn.getcwd() then
--       ---@diagnostic disable-next-line: undefined-field
--       vim.cmd.cd(root)
--       vim.notify("Set CWD to " .. root)
--     end
--   end,
-- })
