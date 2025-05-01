return {
    { 
        'echasnovski/mini.statusline',
        lazy = false,
        version = false,
        config = function()
            require("mini.statusline").setup({

            })
        end
    },
    { 
        'echasnovski/mini.misc',
        lazy = false,
        version = false,
        config = function()
            misc = require("mini.misc")
            misc.setup_termbg_sync()
        end
    },
   -- {
    --     "echasnovski/mini-git", 
    --     lazy = false,
    --     main = 'mini.git',
    --     version = false, 
    --     config = function()
    --         require("mini.git").setup({

    --         })
    --     end
    -- },
    -- {
    --     "echasnovski/mini.diff",
    --     lazy = false,
    --     version = false,
    --     config = function()
    --         require("mini.diff").setup({

    --         })
    --     end
    -- }
}
