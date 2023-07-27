local nnoremap = require("vanilla.keymapper").nnoremap
local vnoremap = require("vanilla.keymapper").vnoremap

vim.g.mapleader = " "

nnoremap("<leader><esc>", "<cmd>Ex<CR>")
nnoremap("<S-q>", "<cmd>q<CR>")
nnoremap("<leader>s", "<cmd>w<CR>")
vnoremap("<leader>c", '"+y')

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

nnoremap("<leader>cd", function ()
    vim.cmd([[ cd %:p:h ]])
    vim.cmd([[ pwd ]])
end)

-- Omn
nnoremap("<F12>", function ()
    vim.cmd([[ Slient grep -RIi "Invalid character in group name" ]])
end)

print("Keymapping ")
