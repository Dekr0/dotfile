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
            "zig_launch_no_build",
            fmta(
[[
{
    "version": "0.2.0",
    "configurations": \[
        {
            "args": \[\],
            "console": "integratedTerminal",
            "cwd": "${workspaceFolder}",
            "internalConsoleOptions": "neverOpen",
            "name": "Launch",
            "program": "zig-out/bin/<program>",
            "request": "launch",
            "type": "lldb"
        }
    \]
}
]],
                {
                    program = i(1, "program")
                }
            )
        ),
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
        ),
        s(
            "manifest",
            fmta(
[[
{
    "Version": "1",
    "Guid": "<uuid>",
    "Name": "<name>",
    "Description": "<description>",
    "Options": [
        <option>
    ]
}
<finish>
]],
                {
                    uuid = i(1, "uuid"),
                    name = i(2, "name"),
                    description = i(3, "description"),
                    option = i(4, "option"),
                    finish = i(0),
                }
            )
        ),
        s(
            "option",
            fmta(
[[
{
    "Name": "<name>",
    "Description": "<description>",
    "SubOptions": [
        <suboption>
    ]
}
<finish>
]],
                {
                    name = i(1, "name"),
                    description = i(2, "description"),
                    suboption = i(3, "suboption"),
                    finish = i(0),
                }
            )
        ),
        s(
            "suboption",
            fmta(
[[
{
    "Name": "<name>",
    "Description": "<description>",
    "Include": [
        <include>
    ]
}
<finish>
]],
                {
                    name = i(1, "name"),
                    description = i(2, "description"),
                    include = i(3, "include"),
                    finish = i(0),
                }
            )
        )
    }

    ls.add_snippets("json", snippets)
end

return setup_json
