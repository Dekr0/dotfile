local harpoon = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>m", mark.add_file)
    vim.keymap.set("n", "<leader>M", mark.rm_file)
    vim.keymap.set("n", "<leader>hc", mark.clear_all)
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

    vim.keymap.set("n", "<leader>v1h", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>v2h", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<leader>v3h", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<leader>v4h", function() ui.nav_file(4) end)

    print("Harpoon ")
end

return harpoon
