require("config.lazy")

vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 4

-- absolute line numbers
vim.opt.number = true

-- map leader f to format file lsp command
vim.keymap.set("n", "<D-f>", function() vim.lsp.buf.format() end)

-- let netrw change directory when you browse
vim.g.netrw_keepdir = 0

-- accept completion with <Tab> instead of <C-y>
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() and "\\<C-y>" or "\\<Tab>"', {expr=true, noremap=true})

-- automatically `:cd` to the file’s folder on every buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local dir = vim.fn.expand("%:p:h")
    if vim.fn.isdirectory(dir) == 1 then
      vim.cmd("silent! cd " .. dir)
    end
  end,
})

