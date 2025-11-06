local setup_go = function()
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
            "wrap_err",
            fmta(
                [[fmt.Errorf("<err_op>: %w", <err>)]],
                {
                    err_op = i(1), -- no default value
                    err = i(2, "err"), -- default value is err
                }
            )
        ),
        s(
            "ret_err",
            fmta(
[[
if <err> != nil {
    return <err_same>
}
<finish>
]],
                {
                    err = i(1, "err"),
                    err_same = rep(1),
                    finish = i(0),
                }
            )
        ),
        s(
            "ret_wrap_err",
            fmta(
[[
if <err> != nil {
    return fmt.Errorf("<err_op>: %w", <err_same>)
}
<finish>
]],
                {
                    err = i(1, "err"),
                    err_op = i(2),
                    err_same = rep(1),
                    finish = i(0)
                }
            )
        ),
        s(
            "cond_err",
            fmta(
[[
if <cond> {
    return fmt.Errorf("<err_ops>", <args>)
}
<finish>
]],
                {
                    cond = i(1),
                    err_ops = i(2),
                    args = i(3),
                    finish = i(0)
                }
            )
        ),
        s(
            "func_err",
            fmta(
[[
<val>, <err> := <func>(<args>)
if <err_same> != nil {
    return <err_choice>
}
<finish>
]],
                {
                    val = i(1),
                    err = i(2),
                    func = i(3),
                    args = i(4),
                    err_same = rep(2),
                    err_choice = c(5, {
                        t("err"),
                        t("wrap_err"),
                    }),
                    finish = i(0)
                }
            )
        ),
        s(
            "func_err_inline",
            fmta(
[[
if <err> := <func>(<args>); <err_same> != nil {
    return <err_choice>
}
<finish>
]],
                {
                    err = i(1),
                    func = i(2),
                    args = i(3),
                    err_same = rep(1),
                    err_choice = c(4, {
                        t("err"),
                        t("wrap_err"),
                    }),
                    finish = i(0)
                }
            )
        )
    }

    ls.add_snippets("go", snippets)
end

return setup_go
