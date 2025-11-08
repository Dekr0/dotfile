local setup_zig = function ()
    local ls = require("luasnip")

    local fmta = require("luasnip.extras.fmt").fmta
    local rep = require("luasnip.extras").rep

    local s = ls.snippet
    local c = ls.choice_node
    local i = ls.insert_node
    local t = ls.text_node

    local snippets = {
        s(
            "build_main",
            fmta(
[[
pub fn build(b: *std.Build) void
{
    // const step = b.step("step", "step description");
    // step.makeFn = stepFn;
}

pub fn stepFn(_: *std.Build.Step, _: std.Build.Step.MakeOptions) anyerror!void
{
    // ...
}

const std = @import("std");
]],
                {}
            )
        ),
        s(
            "build_step",
            fmta(
[[
const <step> = b.step("<step_name>", "<step_desc>");
<step_same>.makeFn = <step_fn_name>;<finish>
]],
                {
                    step = i(1, "step"),
                    step_name = i(2, "step_name"),
                    step_desc = i(3, "step_desc"),
                    step_same = rep(1),
                    step_fn_name = i(4, "step_fn_name"),
                    finish = i(0)
                }
            )
        ),
        s(
            "build_fn",
            fmta(
[[
pub fn <step_fn_name>(<step_var>: *std.Build.Step, <opt_var>: std.Build.Step.MakeOptions) anyerror!void
{
    <finish>
}
]],
                {
                    step_fn_name = i(1, "step_fn_name"),
                    step_var = c(2, {
                        t("_"),
                        t("step"),
                    }),
                    opt_var = c(3, {
                        t("_"),
                        t("opts"),
                    }),
                    finish = i(0)
                }
            )
        )
    }

    ls.add_snippets("zig", snippets)
end

return setup_zig
