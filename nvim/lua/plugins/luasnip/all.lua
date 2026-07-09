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
        ),
        s(
            "is_pow_of_two",
            fmta(
[[
(<x> & (<x_same> - 1)) == 0
<finish>
]],
                {
                    x      = i(1, "x"),
                    x_same = rep(1),
                    finish = i(0)
                }
            )
        ),
        s(
            "fast_mod",
            fmta(
                [[<dividend> & (<divisor> - 1)<finish>]],
                {
                    dividend = i(1, "dividend"),
                    divisor  = i(2, "divisor"),
                    finish   = i(0)
                }
            )
        )
    }

    ls.add_snippets("all", snippets)
end

return setup_all
