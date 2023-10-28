local mason_lspconfig = function()
    require("mason-lspconfig").setup {
        ensure_installed = { "astro", "cssls", "clangd", "eslint", "lua_ls", "omnisharp", "tailwindcss", "tsserver" }
    }

    print("Mason-lspconfig  ")
end

return mason_lspconfig
