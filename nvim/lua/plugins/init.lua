return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        config = function (_, opts)
            vim.api.nvim_create_user_command("Gst", "vertical Git", {})
            vim.api.nvim_create_user_command("Gco", "vertical Git commit", {})
            vim.api.nvim_create_user_command("HGco", "Git commit", {})
        end
    },

    {
        "LunarVim/bigfile.nvim",
        event = "BufReadPre",
        opts = {
            filesize = 2
        },
        config = function (_, opts)
            require("bigfile").setup(opts)
        end
    },

    {
        "cohama/lexima.vim",
        lazy = false,
    },

    -- harpoon (detail setup is in which.lua)
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true
    },

    -- undo tree
    {
        "mbbill/undotree",
        url = "https://github.com/mbbill/undotree",
        lazy = true
    },

    -- zen mode
    {
        "folke/zen-mode.nvim",
        lazy = false,
        opts = {
            window = {
                width = 0.5
            }
        }
    },
    
    -- {
    --    "m4xshen/hardtime.nvim",
    --    lazy = false,
    --    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --    opts = {}
    -- }
}
