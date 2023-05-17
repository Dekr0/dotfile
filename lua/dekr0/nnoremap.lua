local nnoremap = require("dekr0.generate_keymapper").nnoremap

nnoremap("<leader><esc>", "<cmd>Ex<CR>")

vim.keymap.set("n", "j", "<Up>")
vim.keymap.set("n", "k", "<Down>")

vim.keymap.set("v", "j", "<Up>")
vim.keymap.set("v", "k", "<Down>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- System clip board
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
