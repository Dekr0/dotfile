local vnoremap = require("vanilla.keymapper").vnoremap

vim.g.mapleader = " "

vnoremap("sy", '"+y')

vim.keymap.set("n", "j", "<Up>")
vim.keymap.set("n", "k", "<Down>")

vim.keymap.set("v", "j", "<Up>")
vim.keymap.set("v", "k", "<Down>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<c-d>", "<C-d>zz")
vim.keymap.set("n", "<c-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

print("Keymapping ")
