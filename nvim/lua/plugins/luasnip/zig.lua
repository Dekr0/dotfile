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
            "build_script_bare",
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
            "build_script_exe",
            fmta(
[[
pub fn build(b: *std.Build) void
{
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "<exe_name>",
        .root_module = b.createModule(.{
            .root_source_file = b.path("<path>.zig"),
            .target = target,
            .optimize = optimize,
        })
    });

    b.installArtifact(exe);

    const run_exe = b.addRunArtifact(exe);
    const run_step = b.step("<run_cmd>", "<description>");
    run_step.dependOn(&run_exe.step);
    <finish>
}
]],
                {
                    exe_name = i(1, "exe_name"),
                    path = i(2, "path"),
                    run_cmd = i(3, "run_cmd"),
                    description = i(4, "description"),
                    finish = i(0),
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
        ),
        s(
            "build_target_opt",
            fmta(
[[
const target = b.standardTargetOptions(.{});
]],
                {}
            )
        ),
        s(
            "build_optimize_opt",
            fmta(
[[
const target = b.standardOptimizeOption(.{});
]],
                {}
            )
        ),
        s(
            "build_create_module",
            fmta(
[[
const <module_var> = b.createModule(.{
    .root_source_file = b.path("<source_file>"),
    .target = <target_opt_var>,
    .optimize = <optimize_opt_var>
});
<finish>
]],
                {
                    module_var = i(1, "module"),
                    source_file = i(2, "src/root.zig"),
                    target_opt_var = i(3, "target"),
                    optimize_opt_var = i(4, "optimize"),
                    finish = i(0)
                }
            )
        ),
        s(
            "build_dependency",
            fmta(
[[
const <dependency_var> = b.dependency("<dependency_name>", .{
    .target = <target_opt_var>,
    .optimize = <optimize_opt_var>
});
<finish>
]],
                {
                    dependency_var = i(1, "dep"),
                    dependency_name = i(2, "name"),
                    target_opt_var = i(3, "target"),
                    optimize_opt_var = i(4, "optimize"),
                    finish = i(0)
                }
            )
        ),
        s(
            "build_add_exec",
            fmta(
[[
const <exe_var> = b.addExecutable(.{
    .name = "<exe_name>",
    .root_module = b.createModule(.{
        .root_source_file = b.path("<source_file>"),
        .target = <target_opt_var>,
        .optimize = <optimize_opt_var>
    }),
});
<finish>

// <exe_var_same>.addImport("...", mod.module("..."));

// b.installArtifact(<exe_var_same>);

// const run_exe = b.addRunArtifact(<exe_var_same>);
// if (b.args) |args|
// {
//     run_exe.addArgs(args);
// }
// const run_step = b.step("...", "...");
// run_step.dependOn(&run_exe.step);
]],
                {
                    exe_var = i(1, "exe"),
                    exe_name = i(2, "name"),
                    source_file = i(3, "src/main.zig"),
                    target_opt_var = i(4, "target"),
                    optimize_opt_var = i(5, "optimize"),
                    exe_var_same = rep(1),
                    finish = i(0)
                }
            )
        ),
        s(
            "test_block",
            fmta(
[[
test "<test_name>"
{
    std.debug.print("running <test_name_same>\n", .{});
    {
    <finish>
    }
    std.debug.print("\n", .{});
}
]],
                {
                    test_name = i(1, "test_name"),
                    test_name_same = rep(1),
                    finish = i(0)
                }
            )
        )
    }

    ls.add_snippets("zig", snippets)
end

return setup_zig
