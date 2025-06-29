return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		vim.api.nvim_set_keymap('n', '<leader>rg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
		vim.keymap.set("n", "<space>f", require('telescope.builtin').find_files)
	end
}
