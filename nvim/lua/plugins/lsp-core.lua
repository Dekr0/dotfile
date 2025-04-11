-- [[ LSP server setup configuration (Encapsulated by tables) ]]

local clangd = {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
}

local gopls = {
    filetypes = { "go", "gomod", "gowork", "gotmpl" }
}

local pyright = {}

-- local omnisharp = {
--     cmd = { 
--         "C:\\omnisharp\\Omnisharp.exe",
--         "--languageserver",
--         "--hostPID",
--         tostring(pid)
--     }
-- }

-- [[ Section end ]]


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
            local lspconfig = require('lspconfig')

            -- Passing all LSP setup configuration into `lspconfig`
            lspconfig.clangd.setup(clangd)
            lspconfig.gopls.setup(gopls)
            -- lspconfig.omnisharp.setup(omnisharp)
            lspconfig.pyright.setup(pyright)
            lspconfig.ts_ls.setup({
                filetypes = {
                    "javascript",
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx"
                }
            })

            vim.diagnostic.config(diagnostic)
        end,
        lazy = false
    },
}
