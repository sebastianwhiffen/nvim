require("config.lazy")

vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 4

-- map leader f to format file lsp command
vim.keymap.set("n", "<D-f>", function() vim.lsp.buf.format() end)

-- let netrw change directory when you browse
vim.g.netrw_keepdir = 0

-- automatically `:cd` to the file’s folder on every buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local dir = vim.fn.expand("%:p:h")
    if vim.fn.isdirectory(dir) == 1 then
      vim.cmd("silent! cd " .. dir)
    end
  end,
})

