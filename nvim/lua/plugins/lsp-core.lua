-- Guide to read this giant config file. There are multiple sections. Each 
-- section is there for specific setup. Search for the next multiple line lua 
-- comment to go to next section (indicate by --[[--]])
-- TODO: Should come up a better way to structuring this up


--[[ setup spec per lsp server --]]
local astro = {
    filetypes = { "astro" }
}

local bufls = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local clangd = {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
}

local cssls = {
    capabilities = capabilities
}

local eslint = {
    on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll"
        })
    end,
    filetypes = {
        "astro",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
        "svelte"
    }
}

local gopls = {
    filetypes ={ "go", "gomod", "gowork", "gotmpl" }
}

local lua_ls = {
   settings = {
       Lua = {
           diagnostics = {
               globals = { 'vim' }
           },
           workspace = {
               library = vim.api.nvim_get_runtime_file("", true)
           }
       }
   }
}

--local dll = "/home/dekr0/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"
--local omnisharp = {
--    cmd = { "dot", dll },
--    -- Enables support for reading code style, naming convention and analyzer
--    -- settings from .editorconfig.
--    enable_editorconfig_support = true,
--
--    -- If true, MSBuild project system will only load projects for files that
--    -- were opened in the editor. This setting is useful for big C# codebases
--    -- and allows for faster initialization of code navigation features only
--    -- for projects that are relevant to code that is being edited. With this
--    -- setting enabled OmniSharp may load fewer projects and may thus display
--    -- incomplete reference lists for symbols.
--    enable_ms_build_load_projects_on_demand = false,
--
--    -- Enables support for roslyn analyzers, code fixes and rulesets.
--    enable_roslyn_analyzers = false,
--
--    -- Specifies whether 'using' directives should be grouped and sorted during
--    -- document formatting.
--    organize_imports_on_format = false,
--
--    -- Enables support for showing unimported types and unimported extension
--    -- methods in completion lists. When committed, the appropriate using
--    -- directive will be added at the top of the current file. This option can
--    -- have a negative impact on initial completion responsiveness,
--    -- particularly for the first few completion sessions after opening a
--    -- solution.
--    enable_import_completion = false,
--
--    -- Specifies whether to include preview versions of the .NET SDK when
--    -- determining which version to use for project loading.
--    sdk_include_prereleases = true,
--
--    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--    -- true
--    analyze_open_documents_only = false,
--}

local postgres_lsp = {}

local pyright = {}

--local rust_analyzer = {
--    on_attach=function(client)
--        require'completion'.on_attach(client)
--    end,
--    settings = {
--        ["rust-analyzer"] = {
--            imports = {
--                granularity = {
--                    group = "module",
--                },
--                prefix = "self",
--            },
--            cargo = {
--                buildScripts = {
--                    enable = true,
--                },
--            },
--            procMacro = {
--                enable = true
--            },
--        }
--    }
--}

local tsserver = {
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    }
}

local tailwindcss = {}

local volar = {
    filetypes = {'vue'}
}


--[[ 
--basic lspconfig setup and passing all setup specs to each specific lsp server 
----]]
local core = function()
    local lspconfig = require('lspconfig')

    lspconfig.astro.setup(astro)
    lspconfig.bufls.setup(bufls)
    lspconfig.clangd.setup(clangd)
    lspconfig.cssls.setup(cssls)
    lspconfig.eslint.setup(eslint)
    lspconfig.gopls.setup(gopls)
    lspconfig.lua_ls.setup(lua_ls)
    -- lspconfig.omnisharp.setup(omnisharp)
    lspconfig.postgres_lsp.setup(postgres_lsp)
    lspconfig.pyright.setup(pyright)
    -- lspconfig.rust_analyzer.setup(rust_analyzer)
    lspconfig.tsserver.setup(tsserver)
    lspconfig.tailwindcss.setup(tailwindcss)
    lspconfig.volar.setup(volar)

    print("LSP Server  ")
end


--[[ Diagnostic --]]
local diagnostic = {
    virtual_text = false,
    signs = true,
    float = {
        border = "single",
        format = function(diagnostic)
            return string.format(
                "%s (%s) [%s]",
                diagnostic.message,
                diagnostic.source,
                diagnostic.code or diagnostic.user_data.lsp.code
            )
        end,
    },
}


--[[ A callback which is invoke to setup keybinding when LSP is attached --]]
local on_lsp_attach = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, opts)

    vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>lwl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>lca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>lf', function()
        vim.lsp.buf.format { async = true }
    end, opts)
end

local lsp_attach_auto = {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = on_lsp_attach
}


--[[ Create autocmd binding define above --]]
local keybinding = function()
    -- below keybinds are migrated to which.lua
    -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    -- vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_prev)
    -- vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_next)
    -- vim.keymap.set('n', '<leader>n', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', lsp_attach_auto)

    print("LSP Keybinding  ")
end

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            core()
            vim.diagnostic.config(diagnostic)
            keybinding()
        end,
        lazy = false
    },
}
