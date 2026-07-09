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

    vim.api.nvim_create_user_command("Tsymb", "Telescope lsp_document_symbols", {})
    vim.api.nvim_create_user_command("Tlref", "Telescope lsp_references", {})
    vim.api.nvim_create_user_command("Thist", "Telescope search_history", {})
    vim.api.nvim_create_user_command("Tchist", "Telescope command_history", {})
    vim.api.nvim_create_user_command("Tlgrep", "Telescope live_grep", {})
    vim.api.nvim_create_user_command("Tbgrep", "Telescope current_buffer_fuzzy_find", {})
    vim.api.nvim_create_user_command("Tbuffs", "Telescope buffers", {})
end

return {
    -- telescope (detail setup is in which.lua)
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-live-grep-args.nvim', build = 'make' }
        },
        config = setup,
        lazy = true
    },
}
