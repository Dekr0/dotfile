local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)



local plugins = {
    --autocomplete
    {
        "L3MON4D3/LuaSnip",
        opts = { history = true, updateevents = "TextChanged, TextChangedI" },
        config = function(_, opts)
            require("complete.luasnippet").luasnip(opts)
        end,
        dependencies = "rafamadriz/friendly-snippets",
        lazy = false
    },
    {
        "windwp/nvim-autopairs",
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)
        end,
        lazy = false
    },
    {
        "onsails/lspkind.nvim",
        lazy = false
    },
    -- autocompletion source for nvim-cmp
    { "hrsh7th/cmp-buffer", lazy = false }, -- from current text buffer
    { "hrsh7th/cmp-cmdline", lazy = false },
    { "hrsh7th/cmp-nvim-lua", lazy = false },
    { "hrsh7th/cmp-nvim-lsp", lazy = false }, -- from nvim lsp
    { "hrsh7th/cmp-path", lazy = false }, -- from local machine file path
    { "saadparwaiz1/cmp_luasnip", lazy = false },
    {
        "hrsh7th/nvim-cmp",
        config = require("complete.complete"),
        lazy = false
    },

    --harpoon
    {
        "ThePrimeagen/harpoon",
        config = require("plugins.harpoon"),
        lazy = false
    },

    --mason
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = require("lsp.mason"),
        lazy = false,
        priority = 100
    },
    --mason-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        config = require("lsp.mason-lspconfig"),
        lazy = false,
        priority = 100
    },
    --lsp
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp.lsp")()
            require("lsp.lspkey")()
        end,
        lazy = false
    },
    --treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = {
            "TSInstall",
            "TSBufEnable",
            "TSBufDisable",
            "TSModuleInfo"
        },
        config = require("lsp.treesitter"),
        lazy = false
    },
    --treesitter-playground
    {
        "nvim-treesitter/playground",
        lazy = false
    },

    --neotree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        config = require("plugins.neotree"),
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim"
        },
        lazy = false
    },

    --telescope
    {
        "nvim-telescope/telescope.nvim",
        config = require("plugins.telescope"),
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        tag = "0.1.1",
        lazy = false
    },

    --vim-airline
    {
        "vim-airline/vim-airline",
        lazy = false
    },
    {
        "vim-airline/vim-airline-themes",
        lazy = false
    },

    --vscode theme
    {
        "tomasiser/vim-code-dark",
        lazy = false,
        config = function()
            vim.cmd([[ colorscheme codedark ]])
        end
    }
}

local options = {
    defaults = {
        lazy = true
    },
    install = {
        missing = true
    }
}

require("lazy").setup(plugins, options)
