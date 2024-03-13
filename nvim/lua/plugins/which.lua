-- Guide to read this giant config file. There are multiple sections. Each 
-- section is there for specific setup. Search for the next multiple line lua 
-- comment to go to next section (indicate by --[[--]])
-- TODO: Should come up a better way to structuring this up


local prefix = { prefix = "<leader>" }

--[[ Spec per leading key (categorized by what action they perform) --]]
local which_file = {
    f = {
        name = "file",
        c = {
            function()
                vim.cmd([[ cd %:p:h ]])
                vim.cmd([[ pwd ]])
            end,
            "cd to the current directory shown in nvim file explorer"
        },
        e = { "<cmd>Ex<cr>", "go to nvim file explorer" },
        q = { "<cmd>q<cr>", "close the current file" },
        s = { "<cmd>w<cr>", "save the file" },
        f = {
            "<cmd>%!npx prettier --stdin-filepath %<cr><cmd>w<cr>",
            "save the file with prettier"
        },
        fp = {
            "<cmd>!python -m black %<cr>",
            "save the file with black (Python)"
        },
    }
}

local harpoon = require("harpoon")
harpoon:setup()
local which_harpoon = {
    h = {
        name = "harpoon",
        h = {
            function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            "open harpoon quick menu",
        },
        a = {
            function()
                harpoon:list():append()
            end,
            "harpoon append",
        },
        c = {
            "<cmd>terminal rm ~/.local/share/nvim/harpoon.json<cr><C-\\><C-n><cr>aa",
            "clear out harpon .json file"
        },
        j = {
            function ()
               harpoon:list():select(1)
            end,
            "harpoon select 1",
        },
        k = {
            function ()
               harpoon:list():select(2)
            end,
            "harpoon select 2",
        },
        l = {
            function ()
               harpoon:list():select(3)
            end,
            "harpoon select 3",
        },
    }
}

local which_leap = {
    s = {
        name = "leap"
    }
}

local telescope_builtin = require("telescope.builtin")
local which_lsp = {
    l = {
        name = "LSP",
        ca = { "code action (<leader>ca)" },
        e = { vim.diagnostic.open_float, "open LSP diagnostic" },
        E = { telescope_builtin.diagnostics, "LSP diagnostics (telescope)" },
        D = { "type definition" },
        g = {
            name = "go to",
            d = { "definition" },
            D = { "declartion" },
            r = { "reference" },
            i = { "implementation" },
        },
        f = {
            "format",
        },
        j = { vim.diagnostic.goto_prev, "go to previous diagnostic" },
        k = { vim.diagnostic.goto_next, "go to next diagnostic" },
        K = { "about (hover)" },
        sh = { "signature help (ctrl-k)" },
        rn = { "rename (<leader>rn)" },
        n = { vim.diagnostic.setloclist, "list all diagnostics" },
        w = {
            name = "workplace",
            a = "add workplace",
            l = "list workplace",
            r = "remove workplace"
        },
    }
}

local which_telescope = {
    t = {
        name = "telescope",
        t = { telescope_builtin.find_files, "telescope (cd scope)" },
        tr = { telescope_builtin.treesitter, "telescope (treesitter)" },
        c = { telescope_builtin.commands, "telescope (command)" },
        s = {
            telescope_builtin.lsp_document_symbols,
            "telescope (lsp document symbols)"
        },
        sw = {
            function ()
                local symbol = vim.fn.input("Enter symbol: ")
                telescope_builtin.lsp_workspace_symbols({ query = symbol })
            end,
            "telescope (workspace symbols)"
        },
        swd = {
            telescope_builtin.lsp_dynamic_workspace_symbols,
            "telescope (dynamically list LSP for workspace symbols)"
        },
        g = { telescope_builtin.git_files, "telescope (git scope)" },
        gs = { telescope_builtin.git_status, "telescope (git status)" },
        m = { telescope_builtin.marks, "telescope (marks)" }
    }
}


--[[ Register all specs of leading keys into which.key --]]
local setup = function ()
    local wk = require("which-key")
    wk.register(which_file, prefix)
    wk.register(which_harpoon, prefix)
    wk.register(which_leap, prefix)
    wk.register(which_lsp, prefix)
    wk.register(which_telescope, prefix)
end

return {
    "folke/which-key.nvim",
    config = setup,
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
}
