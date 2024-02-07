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

    --folding
    --{
    --    "kevinhwang91/nvim-ufo",
    --    dependencies = "kevinhwang91/promise-async",
    --    config = require("plugins.ufo"),
    --    lazy = false
    --},

    --harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = false
    },

    --leap
    {
        "ggandor/leap.nvim",
        config = require("plugins.jump"),
        dependencies = "tpope/vim-repeat",
        lazy = false,
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

    {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    --lualine
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = require('plugins.ll')
    },


    --which
    {
        "folke/which-key.nvim",
        config = require("plugins.which"),
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },

    --rose pine (9d7474f)
    {
        'rose-pine/neovim',
        config = require('plugins.rose'),
        lazy = false,
        priority = 1000,
        opts = {}
    },

    -- ransetsu
    {
        "dekr0/ransetsu.nvim",
        dir = "/home/dekr0/codebase/nvim-plugins/ransetsu.nvim/",
        lazy = "false"
    }

    --tokyonight
    --{
    --    "folke/tokyonight.nvim",
    --    config = require('plugins.tokoyonight'),
    --    lazy = false,
    --    priority = 1000,
    --    opts = {}
    --}
    --

    --kanagawa
    --{
    --    "rebelot/kanagawa.nvim",
    --    config = require('plugins.kanagawa'),
    --    lazy = false,
    --    priority = 1000,
    --    opts = {}
    --}
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
