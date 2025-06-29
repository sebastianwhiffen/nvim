return {
	"ErichDonGubler/lsp_lines.nvim",
	version = "*",
	config = function()
		vim.keymap.set(
			"",
			"<Leader>l",
			require("lsp_lines").toggle,
			{ desc = "Toggle lsp_lines" }
		)
	end,

}
