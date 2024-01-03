local which = function()
    local wk = require("which-key")
    local harpoon = require("harpoon")
    harpoon:setup()
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
                n = { "<cmd>Neotree<cr>", "neotree" },
                nc = { "<cmd>NeoTreeClose<cr>", "close neotree" },
                q = { "<cmd>q<cr>", "close the current file" },
                s = { "<cmd>w<cr>", "save the file" },
                f = { "<cmd>%!npx prettier --stdin-filepath %<cr><cmd>w<cr>", "save the file with prettier" },
                fp = { "<cmd>!python -m black %<cr>", "save the file with black (Python)" },
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
                    function ()
                       harpoon:list().clear()
                    end,
                    "harpoon clear"
                },
                d = {
                    function ()
                        harpoon:list():remove()
                    end,
                    "harpoon delete",
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
        },
        {
            prefix = "<leader>"
        }
    )

    wk.register(
        {
            t = {
                name = "telescope",
                t = { telescope_builtin.find_files, "telescope (cd scope)" },
                tr = { telescope_builtin.treesitter, "telescope (treesitter)" },
                c = { telescope_builtin.commands, "telescope (command)" },
                s = { telescope_builtin.lsp_document_symbols, "telescope (lsp document symbols)" },
                sw = { function ()
                        local symbol = vim.fn.input("Enter symbol: ")
                        telescope_builtin.lsp_workspace_symbols({ query = symbol })
                    end,
                    "telescope (workspace symbols)" },
                swd = {
                    telescope_builtin.lsp_dynamic_workspace_symbols,
                    "telescope (dynamically list LSP for workspace symbols)"
                },
                g = { telescope_builtin.git_files, "telescope (git scope)" },
                gs = { telescope_builtin.git_status, "telescope (git status)" },
                m = { telescope_builtin.marks, "telescope (marks)" }
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
        },
        {
            prefix = "<leader>"
        }
    )
end

return which
