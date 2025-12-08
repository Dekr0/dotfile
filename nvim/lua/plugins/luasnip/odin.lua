local setup_odin = function ()
    local ls = require("luasnip")

    local fmta = require("luasnip.extras.fmt").fmta
    local rep = require("luasnip.extras").rep

    local s = ls.snippet
    local c = ls.choice_node
    local i = ls.insert_node
    local t = ls.text_node

    local snippets = {
        s(
            "log_err",
            fmta(
[[
log.errorf("<op_desc>: %s", <err>)
<finish>
]],
                {
                    op_desc = i(1, "op desc"),
                    err = i(2, "err"),
                    finish = i(0),
                }
            )
        ),
        s(
            "virtual_arena_grow",
            fmta(
[[
<arena_var>: virtual.Arena
if <init_err> := virtual.arena_init_growing(&<arena_var_same_01>);
   <init_err_same_01> != nil && <init_err_same_02> != .None
{
    <error_handling>
}
<allocator_var> := virtual.arena_allocator(&<arena_var_same_02>)
<finish>
]],
                {
                    arena_var = i(1, "arena"),
                    init_err = i(2, "err"),
                    arena_var_same_01 = rep(1),
                    init_err_same_01 = rep(2),
                    init_err_same_02 = rep(2),
                    allocator_var = i(3, "allocator"),
                    arena_var_same_02 = rep(1),
                    error_handling = c(4, {
                        t("log_err"),
                        t("return")
                    }),
                    finish = i(0)
                }
            )
        ),
        s(
            "tracking_allocator",
            fmta(
[[
<tracker_var>: mem.Tracking_Allocator
mem.tracking_allocator_init(&<tracker_var_same_01>, <backing_allocator>)
<tracking_allocator> <assign> mem.tracking_allocator(&<tracker_var_same_02>)
<finish>
]],
                {
                    tracker_var = i(1, "tracker"),
                    tracker_var_same_01 = rep(1),
                    backing_allocator = i(2, "backing"),
                    tracking_allocator = i(3, "allocator"),
                    assign = c(4, {
                        t(":="),
                        t("=")
                    }),
                    tracker_var_same_02 = rep(1),
                    finish = i(0)
                }
            )
        )
    }

    ls.add_snippets("odin", snippets)
end

return setup_odin
