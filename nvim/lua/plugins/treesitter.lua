return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        cmd = {
            "TSInstall",
            "TSBufEnable",
            "TSBufDisable",
            "TSModuleInfo"
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            })
        end,
        lazy = false
    }
}
