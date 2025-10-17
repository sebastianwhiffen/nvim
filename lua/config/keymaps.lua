local r = {}
-- lsp
vim.keymap.set('n', 'gh', function() vim.diagnostic.open_float() end, { silent = true })
-- general
vim.opt.clipboard = "unnamedplus"


function r.register_format_callback(args, client)

	vim.keymap.set('n', 'gf', function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
	end, { silent = true })
end

return r
