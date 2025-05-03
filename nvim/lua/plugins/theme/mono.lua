local zenbones = {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.zenbones_darken_comments = 45
        vim.cmd.colorscheme('xzenbones')
    end
}

local mono = {
    'slugbyte/lackluster.nvim',
    -- 'pgdouyon/vim-yin-yang',
    -- 'ewilazarus/preto',
    -- dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("lackluster")
    end
}

return mono
