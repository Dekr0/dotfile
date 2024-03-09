local vnoremap = require("vanilla.keymapper").vnoremap
local inoremap = require("vanilla.keymapper").inoremap

vim.g.mapleader = " "

vnoremap("sy", '"+y')


vim.keymap.set("i", "<c-k>", "<Up>")
vim.keymap.set("i", "<c-l>", "<Right>")
vim.keymap.set("i", "<c-j>", "<Down>")
vim.keymap.set("i", "<c-h>", "<Left>")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<c-d>", "<C-d>zz")
vim.keymap.set("n", "<c-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "gt", "gt<cmd>cd %:p:h<cr><cmd>pwd<cr>")
vim.keymap.set("n", "Gt", "gt<cmd>cd %:p:h<cr><cmd>pwd<cr>")

print("Keymapping ")
