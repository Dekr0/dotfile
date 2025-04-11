local setup = function()
    require('nvim-treesitter.configs').setup({
        auto_install = true,
        ensure_installed = {
            "c",
            "lua",
            "python",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            disable = { "python" }
        },
        sync_install = false,
    })
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = {
            "TSInstall",
            "TSBufEnable",
            "TSBufDisable",
            "TSModuleInfo"
        },
        config = setup,
        lazy = false
    }
}

--[[ 
Tree-sitter is NOT 
    - LSP 
    - Compiler
    - Interpreter
Tree-sitter is 
    - Parser generator tool
    - Incremental parsing library
    - Query engine
    - a "framework" to
      - Generate a syntax tree in a single text file
      - Ask questions about the tree for some information, and use those information
      to do something
Why Tree-sitter
    - Incremental
    - Error Recovery
    - Queries
What is Tree-sitter Used For (In An Editor)?
    - Highlighting
        - Embedding languages (JavaScript inside HTML)
    - Indenting
    - Structural Editing
        - Text Object (daf -> "d"elete "a"round "f"unction)
        - Selection
        - Move
    - Code context
    - Folding code
What is Tree-sitter Used For (Outside Editors)?
    - Code Analysis
    - Code Linter
    - Code Highlighting
--]]
