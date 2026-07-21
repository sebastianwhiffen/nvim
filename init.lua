
require('vim._core.ui2').enable({})
require('lsp_configs')
require('packages')
require('dap_conf')

local builtin = require('telescope.builtin')

vim.g.mapleader = " "
vim.g.netrw_keepj = ""
-- vim.g.netrw_browse_split = 1

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"

vim.o.expandtab = true   -- expand tab input with spaces characters
vim.o.smartindent = true -- syntax aware indentations for newline inserts
vim.o.tabstop = 4        -- num of space characters per tab
vim.o.shiftwidth = 4     -- spaces per indentation level


vim.keymap.set('n', '<leader>vs', ":vsplit<CR>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>s', ":split<CR>", { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, {})

vim.keymap.set('n', ']e', function()
  vim.diagnostic.get_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Go to next error' })

vim.keymap.set('n', '[e', function()
  vim.diagnostic.get_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Go to previous error' })

vim.keymap.set('n', '<leader>t', function() vim.cmd('rightbelow vsplit | terminal') end)

vim.cmd.colorscheme('vague')

vim.print('Hello Sexy')
