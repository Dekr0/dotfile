local setup_json = function()
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
            "odin_launch",
            fmta(
[[
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "preLaunchTask": "<task_name_in_tasks_json>",
            "name": "<name>",
            "program": "${workspaceFolder}/${workspaceFolderBasename}",
            "args": [<args>],
            "cwd": "${workspaceFolder}"
        }
    ]
}
<finish>
]],
                {
                    name = i(1, "name"),
                    task_name_in_tasks_json = i(2, "task_name"),
                    args = i(3, "args"),
                    finish = i(0),
                }
            )
        ),
        s(
            "odin_build_task",
            fmta(
[[
{
    "version": "2.0.0",
    "command": "",
    "args": [],
    "tasks": [
        {
            "label": "<task_name>",
            "type": "shell",
            "command": "<task_cmd>",
            "group": "build"
        }
    ]
}
<finish>
]],
                {
                    task_name = i(1, "task_name"),
                    task_cmd = i(2, "odin build . -debug"),
                    finish = i(0),
                }
            )
        ),
        s(
            "odin_setting",
            fmta(
[[
{
    "debug.allowBreakpointsEverywhere": true
}
]],
                {}
            )
        )
    }

    ls.add_snippets("json", snippets)
end

return setup_json
