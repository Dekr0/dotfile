local setup = function()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
        -- autocomplete window's apperance
        window = {
            completion = {
                scrollbar = false,
            }
        },

        -- formatting for each entry in the autocomplete window
        formatting = {
            -- lspkind create a format instead of hand written one
            format = lspkind.cmp_format({
                mode = "text",
                menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    -- luasnip = "[LuaSnip]",
                    -- nvim_lua = "[Lua]",
                    -- latex_symbols = "[Latex]",
                })
            }),
        },

        -- keybinding when autocomplete is display 
        mapping = {
            ["<C-n>"] = cmp.mapping.select_next_item {
                behavior = cmp.SelectBehavior.Insert
            },

            ["<C-p>"] = cmp.mapping.select_prev_item {
                behavior = cmp.SelectBehavior.Insert
            },

            ["<C-h>"] = cmp.mapping.scroll_docs(-4),
            ["<C-l>"] = cmp.mapping.scroll_docs(4),
            ["<C-q>"] = cmp.mapping.abort(),

            ["<C-s>"] = cmp.mapping(
                cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                -- mode that will activate this keybinding
                { "i", "c" }
            ),

            ["<c-space>"] = cmp.mapping {
                i = cmp.mapping.complete(), -- insert mode
                c = function(               -- change mode
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

        -- source of the autocomplete nvim-cmp will looking for
        sources = cmp.config.sources({
            { name = "buffer", keyword_length = 5 }, -- from current text buf
            -- { name = "luasnip" }, -- Lua Snippet
            -- { name = "nvim_lua" }, -- Neovim's Lua API
            { name = "nvim_lsp" }, -- from nvim lsp
            { name = "path" }, -- from local machine path
        }),

        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        }
    })

    -- autocompletion for typing "/" (search) in normal mode 
    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" }
        }
    })

    -- autocompletion for typing ":" (cmd) in normal mode
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        },
        {
            {
                name = 'cmdline',
                option = {
                    ignore_cmds = { 'Man', '!' }
                }
            }
        })
    })
end

return {
    -- appearance only - symbols shown on the autocomplete 
    {
        "onsails/lspkind.nvim",
        lazy = false
    },

    -- core of the autocomplete
    {
        "hrsh7th/nvim-cmp",
        config = setup,
        lazy = false
    },
}
