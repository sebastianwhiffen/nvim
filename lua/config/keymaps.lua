local r = {}

-- lsp
vim.keymap.set('n', 'gh', function() vim.diagnostic.open_float() end, { silent = true })

-- general
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -


function r.register_format_callback(args, client)

	vim.keymap.set('n', 'gf', function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
	end, { silent = true })
end

return r
