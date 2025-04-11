-- local osaka_setup = function()
--     require("solarized-osaka").setup({
--         transparent = false,
--         terminal_colors = true,
--         styles = {
--             comments = { italic = true },
--             keywords = { italic = true },
--             sidebars = "dark",
--             floats = "dark"
--         },
--         on_colors = function(_) end,
--         on_highlights = function(hl, c)
--             hl.TelescopeNormal = {
--               bg = c.none,
--               fg = c.fg_float,
--             }
--             hl.TelescopeBorder = {
--               bg = c.none,
--               fg = c.fg_float,
--             }
--             hl.TelescopePromptNormal = {
--               bg = c.none,
--             }
--             hl.TelescopePromptBorder = {
--               bg = c.none,
--               fg = c.fg_float,
--             }
--             hl.TelescopePromptTitle = {
--               bg = c.none,
--               fg = c.fg_float,
--             }
--             hl.TelescopePreviewTitle = {
--               bg = c.none,
--               fg = c.fg_float,
--             }
--             hl.TelescopeResultsTitle = {
--               bg = c.none,
--               fg = c.fg_float,
--             }
--             hl.FloatBorder = {
--                 bg = c.none,
--                 fg = c.none,
--             }
--             hl.NormalFloat = {
--                 bg = c.none,
--                 fg = c.none
--             }
--             hl.Pmenu = {
--                 bg = c.none,
--                 fg = c.none
--             }
--         end
--     })
--     vim.cmd.colorscheme("solarized-osaka")
-- end
-- 
-- return {
--     "craftzdog/solarized-osaka.nvim",
--     lazy = false,
--     priority = 1000,
--     config = osaka_setup
-- }

return {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {
        variant = "autumn"
    },
    config = function(_, opts)
        vim.o.termguicolors = true
        vim.o.background = 'dark'
        require('solarized').setup(opts)
        vim.cmd.colorscheme 'solarized'
    end,
}
