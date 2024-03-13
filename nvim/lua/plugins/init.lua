-- plugins that do not require too much setup
return {
    -- harpoon (detail setup is in which.lua)
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = false
    },

    -- telescope (detail setup is in which.lua)
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- undo tree
    {
        "mbbill/undotree",
        url = "https://github.com/mbbill/undotree",
        config = function ()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
        lazy = false
    },

    -- zen mode
    {
        "folke/zen-mode.nvim",
        lazy = false,
        opts = {
            width = 0.9
        }
    }
}
