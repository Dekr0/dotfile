-- [[ Mapping functions ]]
-- All functions follow one unified signature
--     key_seq: string - The key input sequence
--     action : string or function - The action or command associate with a 
--     key input sequence.
--     opts   : table - Options about this mapping

-- Normal mode remapping
local nremap = function(key_seq, action, opts)
    -- Merged two or more tables
    opts = vim.tbl_extend(
        -- What to do if a key is found in more than one table 
        --   "keep", use value from the leftmost map
        --   "force", use value from the rightmost map
        "keep", 
        { noremap = false },
        opts or {}
    )
    -- Use ":h mode()" to check what each mode short name means
    vim.keymap.set("n", key_seq, action, opts)
end

-- Insert mode no remapping
local inoremap = function(key_seq, action, opts)
    opts = vim.tbl_extend("keep", { noremap = true }, opts or {})
    vim.keymap.set("i", key_seq, action, opts)
end

-- Normal mode no remapping
local nnoremap = function(key_seq, action, opts)
    opts = vim.tbl_extend("keep", { noremap = true }, opts or {})
    vim.keymap.set("n", key_seq, action, opts)
end

-- Visual mode no remapping
local vnoremap = function(key_seq, action, opts)
    opts = vim.tbl_extend( "keep", { noremap = true }, opts or {})
    vim.keymap.set("v", key_seq, action, opts)
end

-- Completion mode no remapping?
local xnoremap = function(key_seq, action, opts)
    opts = vim.tbl_extend( "keep", { noremap = true }, opts or {})
    vim.keymap.set("x", key_seq, action, opts)
end

-- [[ Section end ]]


-- leader key => space
vim.g.mapleader = " "

-- [[ Key mapping for vanilla nvim ]] 

vim.keymap.set("n", "<leader>rh", "5<c-w><", { desc = "decrease width by 5 unit" })
vim.keymap.set("n", "<leader>rl", "5<c-w>>", { desc = "increase width by 5 unit" })

-- Yank into clipboard
vim.keymap.set("v",  "sy", '"+y')

-- Cursor movement in insert mode
vim.keymap.set("i", "<c-k>", "<Up>")
vim.keymap.set("i", "<c-l>", "<Right>")
vim.keymap.set("i", "<c-j>", "<Down>")
vim.keymap.set("i", "<c-h>", "<Left>")

-- Move the next line in the current line with white space
vim.keymap.set("n", "J", "mzJ`z")

-- Move the screen up / down by half while maintaining the content center
vim.keymap.set("n", "<c-d>", "<C-d>zz")
vim.keymap.set("n", "<c-u>", "<C-u>zz")

-- Move a line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste while keeping the yank content in the register instead of overwriting
-- the register with the content pasted
vim.keymap.set("x", "<leader>p", "\"_dP")


    -- [[ File operation and file system ]] 
    
    -- Change to the directory of the current active buffer
    vim.keymap.set("n", "<leader>fc", function() vim.cmd("cd %:p:h") end, 
    { desc = "cd to the active buffer" })
    -- Vim File explorer
    vim.keymap.set("n", "<leader>fe", function() vim.cmd("Ex") end, 
    { desc = "vim file explorer"  })
    
    -- Quit viewing the current buffer (Without removing from nvim process memory)
    vim.keymap.set("n", "<leader>fq", function() vim.cmd("q") end, 
    { desc = "quit the current buffer" })

    -- Quit viewing the current buffer (Remove from nvim process memory as well)
    vim.keymap.set("n", "<leader>fd", function() vim.cmd("bdelete") end, 
    { desc = "close the current buffer" })

    -- Save the current buffer
    vim.keymap.set("n", "<leader>fs", function() vim.cmd("w") end, 
    { desc = "save the current buffer" })

    -- [[ Section end ]]
    

    -- [[ Tab (Session) ]]
   
    vim.keymap.set("n", "<leader>sb", function() vim.cmd("tab split") end,
    { desc = "open current buffer in the new tab page"})
    vim.keymap.set("n", "<leader>sn", function() vim.cmd("+tabnext") end,
    { desc = "go the next tab page"})
    vim.keymap.set("n", "<leader>sp", function() vim.cmd("-tabnext") end,
    { desc = "go the prev tab page"})

    -- [[ Section end]]
    
    
    -- [[ Terminal (Primarily used in Windows)]]
    vim.keymap.set("n", "<leader>mn", function() vim.cmd("tab terminal") end,
    { desc = "open terminal in a new tab" })
    vim.keymap.set("n", "<leader>mm", function() vim.cmd("terminal") end,
    { desc = "open terminal in the current buff" })
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "exit terminal mode"})
    
    -- [[ Section end ]]
    

-- [[ Section end ]]


-- [[ Key mapping for plugin ]]

local harpoon = require("harpoon")
local telescope_builtin = require("telescope.builtin")

    -- [[ Harpoon section ]]
    
    -- Harpoon quick menu
    vim.keymap.set(
        "n", 
        "<leader>hh", 
        function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "Quick menu" }
    )

    -- Append the active buffer into Harpoon
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
    { desc = "Append the active buffer" })

    -- Harpoon quick access (buffer 1 to buffer 4)
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end,
    { desc = "Harpoon quick access 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end,
    { desc = "Harpoon quick access 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end,
    { desc = "Harpoon quick access 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end,
    { desc = "Harpoon quick access 4" })

    -- [[ Section end ]]


    -- [[ LSP section ]]

    -- LSP diagnostics in float window 
    vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, 
    { desc = "diagnostic float window" })
    
    -- LSP diagnostics in telescope
    vim.keymap.set("n", "<leader>lE", telescope_builtin.diagnostics,
    { desc = "diagnostics (telescope)" })

    -- Jump the previous diagnostic
    vim.keymap.set("n", "<leader>lgk", vim.diagnostic.goto_prev,
    { desc = "go to previous diagnostic" })

    -- Jump to the next diagnostic
    vim.keymap.set("n", "<leader>lgj", vim.diagnostic.goto_next,
    { desc = "go to next diagnostic" })

    -- List all diagnostics
    vim.keymap.set("n", "<leader>lgn", vim.diagnostic.setloclist,
    { desc = "list all diagnostics" })

    -- This is a callback function when a LSP server is attached. This callback 
    -- function will setup some keybinding that's only available when a LSP 
    -- server is successfully attached.
    local on_lsp_attach = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    
        -- Buffer local mappings.
        local map = function(key_seq, action, desc)
            vim.keymap.set('n', key_seq, action, { buffer = ev.buf, desc = desc })
        end
        
        local opts = { buffer = ev.buf }
       
        -- See `:help vim.lsp.*` for documentation on any of the below functions
    
        -- The following key mappings are suggested by `nvim-lspconfig`
        map('gd', vim.lsp.buf.definition, "LSP symbol definition")
        map('gD', vim.lsp.buf.declaration, "LSP symbol declartion")
        map('gi', vim.lsp.buf.implementation, "LSP symbol implementation")
        map('gr', vim.lsp.buf.references, "LSP symbol references")
    
        -- The following key mappings are suggested by `nvim-lspconfig`
        map('K', vim.lsp.buf.hover, "LSP hover")
        map('<c-k>', vim.lsp.buf.signature_help, "LSP signature help")
    
        map('<leader>lca', vim.lsp.buf.code_action, "code action")

        map('<leader>lD', vim.lsp.buf.type_definition, "type definition")

        map(
            '<leader>lf', 
            function() vim.lsp.buf.format { async = true } end,
            "formatting")

        -- Rename symbol (It will change affect all files that contain this 
        -- symbol)
        map('<leader>lrn', vim.lsp.buf.rename, "Rename symbol")

        -- Workspace
        map(
            '<leader>lwa',
            vim.lsp.buf.add_workspace_folder,
            "Add workspace folder"
        )
        map(
            '<leader>lwl', 
            function()
                -- TODO, I need to display the result in a floating window
                vim.inspect(vim.lsp.buf.list_workspace_folders())
            end,
            "List all workspace folder"
        )
        map(
            '<leader>lwr',
            vim.lsp.buf.remove_workspace_folder,
            "Remove workspace folder"
        )
    end

    -- Create an auto command specifically for which a LSP is attached.
    -- Auto command is equivalently of event handler when a event is fired
    local lsp_attach_auto = {
        -- Group help avoid callbacks being fired multiple times
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = on_lsp_attach
    }
    -- Bind the above auto command group with `LspAttach` event
    vim.api.nvim_create_autocmd('LspAttach', lsp_attach_auto)

    -- [[ Section end ]]
    

    -- [[ Telescope ]]
    
    -- Search for files at the current directory recursively
    vim.keymap.set("n", "<leader>tt", telescope_builtin.find_files,
    { desc = "file" })

    -- Search for symbol in TS 
    vim.keymap.set("n", "<leader>tr", telescope_builtin.treesitter,
    { desc = "treesitter" })

    -- Search for command
    vim.keymap.set("n", "<leader>tc", telescope_builtin.commands,
    { desc = "command" })

    -- Search for LSP symbols at the active buffer
    vim.keymap.set("n", "<leader>ts", telescope_builtin.lsp_document_symbols,
    { desc = "lsp document symbols" })

    -- Search for LSP symbols at the workspace scope (TODO: Unfinished)
    vim.keymap.set("n", "<leader>tsw", telescope_builtin.lsp_workspace_symbols,
    { desc = "workspace symbols" })

    -- Search for LSP dynamic symbols at the workspace scope
    vim.keymap.set(
        "n", 
        "<leader>tswd", 
        telescope_builtin.lsp_dynamic_workspace_symbols,
        { desc = "lsp dynmaic workspace symbols" }
    )

    -- Search for git files
    vim.keymap.set("n", "<leader>tg", telescope_builtin.git_files,
    { desc = "git file" })

    -- Search for git status
    vim.keymap.set("n", "<leader>tgs", telescope_builtin.git_status,
    { desc = "git status" })

    -- Search for vim mark
    vim.keymap.set("n", "<leader>tm", telescope_builtin.marks,
    { desc = "marks" })

    -- [[ Section end ]]


    -- [[ Trouble ]]
    
    
    -- [[ Section end ]]


    -- [[ Toggle plugins' features ]]

    vim.keymap.set("n", "<leader>zh", function() vim.cmd("Hardtime toggle") end,
    { desc = "hard time" })
    vim.keymap.set("n", "<leader>zz", function() vim.cmd("ZenMode") end,
    { desc = "zen mode" })
    
    -- [[ Section end ]]


-- [[ Section end ]]

-- Each table contain the description of each individual key mapping.
-- Each table are categorized by action of a set of key mappings.
-- The reason why key mapping is in the actual which.key configuration table is 
-- that it's free from coupling if which.key deprecated

local which_file = {
    { "<leader>f", group = "file" }
}

local which_session = {
    { "<leader>s", group = "tab / session" }
}

local which_harpoon = {
    { "<leader>h", group = "harpoon" },
}

local which_lsp = {
    { "<leader>l", group = "lsp" },
    { "<leader>lg", group = "jump to" },
    { "<leader>lw", group = "workspace" },
}

local which_telescope = {
    { "<leader>t", group = "telescope" },
}

-- local which_rpc = {
--     { "<leader>r", group = "discord rich presence" },
--     { "<leader>rl", desc = "show log" },
--     { "<leader>rp", desc = "pause update" },
--     { "<leader>rr", desc = "resume update" },
--     { "<leader>rx", desc = "close communication" },
--     { "<leader>ro", desc = "open / reopen communication" }
-- }

local which_set = {
    { "<leader>z", group = "set and unset" },
}

--[[ Register all specs of leading keys into which.key --]]
local setup = function ()
    local wk = require("which-key")
    wk.setup({ icons = { mappings = false }})
    wk.add(which_file)
    wk.add(which_harpoon)
    wk.add(which_lsp)
    wk.add(which_telescope)
    -- wk.add(which_rpc)
    wk.add(which_set)
end

return {
    "folke/which-key.nvim",
    config = setup,
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
}
