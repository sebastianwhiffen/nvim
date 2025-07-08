return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-live-grep-args.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>tg", require("telescope").extensions.live_grep_args.live_grep_args)
		vim.keymap.set("n", "<space>f", require('telescope.builtin').find_files)
	end
}
