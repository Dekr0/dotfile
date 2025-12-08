local setup_lua = function()
    local ls = require("luasnip")

    -- formatting snippet with angle bracket
    local fmta = require("luasnip.extras.fmt").fmta
    -- repetitive node
    local rep = require("luasnip.extras").rep

    local s = ls.snippet
    local c = ls.choice_node
    local i = ls.insert_node
    local t = ls.text_node

    local snippets = {
        s(
            "luasnip_setup",
            fmta(
[[
local setup = function()
    local ls = require("luasnip")

    -- formatting snippet with angle bracket
    local fmta = require("luasnip.extras.fmt").fmta
    -- repetitive node
    local rep = require("luasnip.extras").rep

    local s = ls.snippet
    local c = ls.choice_node
    local i = ls.insert_node
    local t = ls.text_node

    -- remember to put angle bracket
    local snippets = {
        s(
            "snippet_name",
            fmta(
                \[\[example_01, example_02, example_01_same, finish \]\],
                {
                    example_01 = i(1),
                    example_02 = c(2, {
                        t("choice_01"),
                        t("choice_02"),
                    }),
                    example_01_same = rep(1),
                    finish = i(0)
                }
            )
        )
    }

    ls.add_snippets("lang", snippets)
end
]],
                {}
            )
        )
    }

    ls.add_snippets("lua", snippets)
end

return setup_lua
