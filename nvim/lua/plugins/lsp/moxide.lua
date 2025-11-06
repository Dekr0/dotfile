local function command_factory(client, bufnr, cmd)
    return client:exec_cmd(
        {
            title = ('Markdown-Oxide-%s'):format(cmd),
            command = 'jump',
            arguments = { cmd },
        },
        {
            bufnr = bufnr
        }
    )
end

return {
    root_markers = {
        '.git',
        '.obsidian',
        '.moxide.toml'
    },
    filetypes = { 'markdown' },
    cmd = { 'markdown-oxide' },
    on_attach = function(client, bufnr)
        for _, cmd in ipairs({
            'today',
            'tomorrow',
            'yesterday'
        }) do
            local s = 'Lsp' .. ('%s'):format(cmd:gsub('^%l', string.upper))
            vim.api.nvim_buf_create_user_command(
                bufnr,
                s,
                function()
                    command_factory(client, bufnr, cmd)
                end,
                {
                    desc = ('Open %s daily note'):format(cmd),
                })
        end
    end,
}
