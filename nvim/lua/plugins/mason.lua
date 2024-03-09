local mason_core = function()
    require("mason").setup({
        max_concurrent_installers = 10
    })

    print("Mason  ")
end

local mason_config = function()
    require("mason-lspconfig").setup {
        ensure_installed = {
            "astro",
            "cssls",
            "clangd",
            "eslint",
            "gopls",
            "lua_ls",
            "pyright",
            "tailwindcss",
            "tsserver"
        }
    }

    print("Mason-lspconfig  ")
end

return {
    -- mason (helper plugins for installing lsp server)
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = mason_core,
        lazy = false,
        priority = 100
    },

    -- mason-lspconfig (configuration plugin for mason)
    {
        "williamboman/mason-lspconfig.nvim",
        config = mason_config,
        lazy = false,
        priority = 100
    },
}
