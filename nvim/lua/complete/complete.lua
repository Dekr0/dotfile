local complete = function()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind");

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
            ["<C-k>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-j>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
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

            ["<C-e>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<C-r>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),

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
                luasnip.lsp_expand(args.body)
            end,
        }
    })
    print("nvim-cmp  ")
end

return complete
