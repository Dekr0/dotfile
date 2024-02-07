local treesitter = function()
    require'nvim-treesitter.configs'.setup {
        auto_install = true,
        ensure_installed = { "c", "cpp", "java", "lua", "python", "rust", "typescript" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        sync_install = false,
    }

    print("treesitter  ")
end

return treesitter
