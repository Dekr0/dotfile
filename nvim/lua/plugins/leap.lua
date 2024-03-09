local setup = function()
   require("leap").add_default_mappings()
end

return {
    "ggandor/leap.nvim",
    config = setup,
    dependencies = "tpope/vim-repeat",
    lazy = false,
}
