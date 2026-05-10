require "nvchad.options"

-- add yours here!

local o = vim.o

o.number = true
o.relativenumber = true

o.cursorlineopt = "both" -- to enable cursorline!

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
