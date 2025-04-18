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

local ts_ls = {
    filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    }
}

local zls = {
    setting = {
        zls = {
            semantic_tokens = "partial"
        }
    }
}

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
            lspconfig.ts_ls.setup(ts_ls)
            lspconfig.zls.setup(zls)

            vim.diagnostic.config(diagnostic)
        end,
        lazy = false
    },
}
