local complete = function()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
        window = {
            completion = {
                scrollbar = false,
            }
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = "symbol_text",
                menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[Latex]",
                })
            }),
        },
        mapping = {
            ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-h>"] = cmp.mapping.scroll_docs(-4),
            ["<C-l>"] = cmp.mapping.scroll_docs(4),
            ["<C-q>"] = cmp.mapping.abort(),

            ["<C-s>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { "i", "c" }
            ),

            ["<c-space>"] = cmp.mapping {
                i = cmp.mapping.complete(),
                c = function(
                    _ --[[fallback]]
                    )
                    if cmp.visible() then
                        if not cmp.confirm { select = true } then
                            return
                        end
                    else
                        cmp.complete()
                    end
                end,
            },

            ["<tab>"] = cmp.config.disable
        },

        sources = cmp.config.sources({
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
            { name = "buffer", keyword_length = 5 }
        }),

        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        }
    })
    print("nvim-cmp  ")
end

return complete
