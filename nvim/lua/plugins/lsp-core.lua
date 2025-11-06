-- [[ Diagnostic display styling and formatting ]]
local diagnostic = {
    virtual_text = true,
    signs = true,
    float = {
        border = "single",
        format = function(diagnostic)
            return string.format(
                "%s (%s) [%s]",
                diagnostic.message,
                diagnostic.source,
                diagnostic.code or diagnostic.user_data.lsp.code
            )
        end,
    },
}
-- [[ Section end ]]

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local gopls = require("plugins.lsp.gopls")
            local luals = require("plugins.lsp.luals")
            local moxide = require("plugins.lsp.moxide")
            local ols = require("plugins.lsp.ols")
            local pyright = require("plugins.lsp.pyright")
            local tsls = require("plugins.lsp.tsls")
            local zls = require("plugins.lsp.zls")

            vim.lsp.config("gopls", gopls)
            vim.lsp.config("lua_ls", luals)
            vim.lsp.config("markdown_oxide", moxide)
            vim.lsp.config("ols", ols)
            vim.lsp.config("pyright", pyright)
            vim.lsp.config("ts_ls", tsls)
            vim.lsp.config("zls", zls)

            vim.diagnostic.config(diagnostic)
        end,
        lazy = false
    },
}
