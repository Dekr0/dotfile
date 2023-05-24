local mason_lspconfig = function()
    require("mason-lspconfig").setup {
        ensure_installed = { "clangd", "lua_ls", "omnisharp", "tsserver" }
    }

    print("Mason-lspconfig  ")
end

return mason_lspconfig
