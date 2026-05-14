
require('vim._core.ui2').enable({})
require('lsp_configs')
require('packages')

vim.print('Hello Sexy')

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
