-- Cursor and Line
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.timeout = false


-- line number
vim.opt.nu = true
vim.opt.relativenumber = true


-- Tab
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4


-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true


-- Spellcheck => press z= for suggestion
vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.opt.shell = "/usr/bin/zsh"

vim.opt.colorcolumn = "81"

-- vim.api.nvim_create_autocmd('BufWinLeave', { command = 'mkview' })
-- vim.api.nvim_create_autocmd('BufLeave', { command = 'mkview' })
-- vim.api.nvim_create_autocmd('BufWinEnter', { command = 'loadview' })
-- vim.api.nvim_create_autocmd('BufEnter', { command = 'loadview' })
