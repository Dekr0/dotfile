-- For nvim plugin development
P = function (v)
   print(vim.inspect(v))
   return v
end

RELOAD = function (...)
   return require("pleanary.reload").reload_module(...)
end

R = function (name)
   RELOAD(name)
   return require(name)
end

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
