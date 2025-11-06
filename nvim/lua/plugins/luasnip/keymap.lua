local setup_keymap = function ()
    local ls = require("luasnip")

    vim.keymap.set(
        { "i" },
        "<c-v>",
        function ()
            ls.expand()
        end
    )

    -- when a snippet is selected and nvim enters select mode from insert mode, 
    -- jump back the previous node of this selected snippet
    vim.keymap.set(
        { "i", "s" },
        "<c-q>",
        function ()
           ls.jump(-1)
        end
    )

    -- when a snippet is selected and nvim enters select mode from insert mode, 
    -- jump back the next node of this selected snippet
    vim.keymap.set(
        { "i", "s" },
        "<c-e>",
        function ()
           ls.jump(1)
        end
    )

    vim.keymap.set(
        { "i", "s" },
        "<c-b>",
        function ()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end
    )
end

return setup_keymap
