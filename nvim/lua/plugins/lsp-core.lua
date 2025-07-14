-- [[ LSP server setup configuration (Encapsulated by tables) ]]
local clangd = {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
}

local gopls = {
    filetypes = { "go", "gomod", "gowork", "gotmpl" }
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)
local markdown_oxide = {
    cmd = { "markdown-oxide" },
    filetypes = { "markdown" },
    capabilities = vim.tbl_deep_extend(
        'force',
        capabilities,
        {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
            },
        }
    )
}

local lua = {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
            return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = { Lua = {} }
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
            lspconfig.lua_ls.setup(lua)
            -- lspconfig.omnisharp.setup(omnisharp)
            lspconfig.markdown_oxide.setup(markdown_oxide)
            lspconfig.pyright.setup(pyright)
            lspconfig.ts_ls.setup(ts_ls)
            lspconfig.zls.setup(zls)

            vim.diagnostic.config(diagnostic)
        end,
        lazy = false
    },
}
