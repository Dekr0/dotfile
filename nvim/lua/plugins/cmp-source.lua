return {
    -- source of the autocomplete nvim-cmp will looking for
    { -- from current text buffer
        "hrsh7th/cmp-buffer", lazy = false
    },
    { -- vim commandline suggestions
        "hrsh7th/cmp-cmdline", lazy = false
    },
    { -- from Nevovim's Lua API
        "hrsh7th/cmp-nvim-lua", lazy = false
    },
    { -- from nvim lsp
        "hrsh7th/cmp-nvim-lsp", lazy = false
    },
    { -- from local machine file path
        "hrsh7th/cmp-path", lazy = false
    },
    { -- from LuaSnip

        "saadparwaiz1/cmp_luasnip",
        lazy = false,
        version = "v2.*",
        build = "make install_jsregexp"
    },
}
