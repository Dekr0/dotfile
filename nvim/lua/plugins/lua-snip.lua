local setup = function (opts)
    require("luasnip").config.set_config(opts)

    local setup_keymap = require("plugins.luasnip.keymap")
    local setup_all = require("plugins.luasnip.all")
    local setup_go = require("plugins.luasnip.go")
    local setup_json = require("plugins.luasnip.json")
    local setup_lua = require("plugins.luasnip.lua")
    local setup_odin = require("plugins.luasnip.odin")
    local setup_zig = require("plugins.luasnip.zig")
    local load_fmt = require("plugins.luasnip.load_fmt")
    local setup_autocmd = require("plugins.luasnip.autocmd")

    setup_keymap()
    setup_autocmd()
    load_fmt()
    setup_all()
    setup_go()
    setup_json()
    setup_lua()
    setup_odin()
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
