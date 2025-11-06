return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    },
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            local a = path ~= vim.fn.stdpath('config')
            local b = vim.uv.fs_stat(path .. '/.luarc.json')
            local c = vim.uv.fs_stat(path .. '/.luarc.jsonc')
            if a and (b or c) then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend(
            'force',
            client.config.settings.Lua,
            {
                runtime = {
                    version = 'LuaJIT',
                    -- location for referencing Lua modules 
                    -- (see `:h lua-module-load`)
                    path = {
                        'lua/?.lua',
                        'lua/?/init.lua',
                    },
                },
                workspace = { -- Make the server aware of Neovim runtime files
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                        -- Might want to add additional paths here.
                        -- '${3rd}/luv/library'
                        -- '${3rd}/busted/library'
                    }
                }
            })
    end,
    settings = {
        Lua = {}
    }
}
