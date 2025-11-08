local setup = function (opts)
    require("luasnip").config.set_config(opts)

    local setup_keymap = require("plugins.luasnip.keymap")
    local setup_go = require("plugins.luasnip.go")
    local setup_zig = require("plugins.luasnip.zig")
    local load_fmt = require("plugins.luasnip.load_fmt")
    local setup_autocmd = require("plugins.luasnip.autocmd")

    setup_keymap()
    setup_autocmd()
    load_fmt()
    setup_go()
    setup_zig()
end

return {
    { -- snippet (bridge to nvim-cmp using cmp_luanisp)
        "L3MON4D3/LuaSnip",
        opts = {
            history = true,
            updateevents = "TextChanged, TextChangedI"
        },
        config = function(_, opts)
            setup(opts)
        end,
        dependencies = "rafamadriz/friendly-snippets",
        lazy = false
    },
}
