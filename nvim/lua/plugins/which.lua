local which = function()
    local wk = require("which-key")
    -- local harpoon = require("harpoon.mark")
    -- local harpoon_ui = require("harpoon.ui")
    local telescope_builtin = require("telescope.builtin")

    wk.register(
        {
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
                -- h = {
                --     name = "harpoon",
                --     c = { harpoon.clear_all, "harpoon clear all" },
                --     m = { harpoon.add_file, "harpoon mark" },
                --     M = { harpoon.rm_file, "harpoon unmark" },
                --     s = { harpoon_ui.toggle_quick_menu, "harpoon menu" },
                -- },
                n = { "<cmd>Neotree<cr>", "neotree" },
                nc = { "<cmd>NeoTreeClose<cr>", "close neotree" },
                q = { "<cmd>q<cr>", "close the current file" },
                s = { "<cmd>w<cr>", "save the file" },
                f = { "<cmd>%!npx prettier --stdin-filepath %<cr><cmd>w<cr>", "save the file with prettier" },
                fp = { "<cmd>!python -m black %<cr>", "save the file with black (Python)" },
                t = { telescope_builtin.find_files, "telescope (cd scope)" },
                tc = { telescope_builtin.commands, "telescope (command)" },
                tg = { telescope_builtin.git_files, "telescope (git scope)" },
                tgs = { telescope_builtin.git_status, "telescope (git status)" },
                tm = { telescope_builtin.marks, "telescope (marks)" }
            }
        },
        {
            prefix = "<leader>"
        }
    )

    wk.register(
        {
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
                }
            }
        },
        {
            prefix = "<leader>"
        }
    )

    wk.register(
        {
            s = {
                name = "leap"
            }
        }
    )
end

return which
