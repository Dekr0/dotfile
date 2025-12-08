local setup_all = function()
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
            "xor_var_swap",
            fmta(
[[
{
    int a = 1;
    int b = 2;
    // xor property: x^y^y = x
    a ^= b; // a = a^b
    b ^= a; // b = b^a^b = a^b^b = a
    a ^= b; // a = a^b^a = b^a^a = b
}
]],
                {

                }
            )
        )
    }

    ls.add_snippets("all", snippets)
end

return setup_all
