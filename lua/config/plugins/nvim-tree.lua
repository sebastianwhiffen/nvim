return {
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			vim.g.loaded_netrw       = 1
			vim.g.loaded_netrwPlugin = 1
			require('nvim-tree').setup {
				disable_netrw = true,
				hijack_netrw  = true,
				view          = { width = 30, side = 'left' },
			}
			vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
		end,
	} }
