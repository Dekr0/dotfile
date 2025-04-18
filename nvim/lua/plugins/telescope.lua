local setup = function()
    local telescope = require("telescope")
    
    telescope.setup({
        pickers = {
            find_files = {
                disable_devicons = true
            }
        },
        file_ignore_patterns = {
            ".git",
            ".venv"
        }
    })

    telescope.load_extension("live_grep_args")

    vim.api.nvim_create_user_command("Symbol", "Telescope lsp_document_symbols", {})
    vim.api.nvim_create_user_command("SearchHistory", "Telescope search_history", {})
    vim.api.nvim_create_user_command("CmdHistory", "Telescope command_history", {})
end

return {
    -- telescope (detail setup is in which.lua)
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim'
        },
        config = setup,
        lazy = true
    },
}
