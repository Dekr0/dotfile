local tokyonight = function ()
    require('tokyonight').setup({
        style = 'night',
        on_colors = function (colors)
            colors.bg = '#0c0c0c'
            colors.bg_dark = '#0c0c0c'
            colors.bg_float = '#0c0c0c'
            colors.bg_popup = '#0c0c0c'
            colors.bg_sidebar = '#0c0c0c'
            colors.bg_statusline = '#0c0c0c'
        end
    })

    vim.cmd[[colorscheme tokyonight-night]]
end

return tokyonight
