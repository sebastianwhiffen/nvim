return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls", "rust_analyzer" },
			}

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { silent = true })

			vim.diagnostic.config({
				virtual_text     = true,
				signs            = true,
				underline        = true,
				update_in_insert = true,
			})

			vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references({}) end,
				{ noremap = true, silent = true })

			vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

			local caps = require("blink.cmp").get_lsp_capabilities()
			require("lspconfig").lua_ls.setup { capabilities = caps }
			require("lspconfig").rust_analyzer.setup { flags = { debounce_text_changes = 150 },
				settings = {
					["rust-analyzer"] = {
						cargo       = { allFeatures = true },
						checkOnSave = { enable = true },
						diagnostics = { enable = true },
					},
				},
				capabilities = caps, }

			vim.keymap.set("n", "gn", function()
				vim.lsp.buf.rename()
			end, { silent = true })

			vim.keymap.set("n", "go", vim.lsp.buf.code_action, {})

			vim.keymap.set("n", "gf", function() vim.lsp.buf.format() end)

			-- fuckass lsp <3	
			vim.keymap.set('n', 'gl', function()
				vim.cmd('LspRestart')
			end, { noremap = true, silent = true })

			local function filterDuplicates(array)
				local uniqueArray = {}
				for _, tableA in ipairs(array) do
					local isDuplicate = false
					for _, tableB in ipairs(uniqueArray) do
						if vim.deep_equal(tableA, tableB) then
							isDuplicate = true
							break
						end
					end
					if not isDuplicate then
						table.insert(uniqueArray, tableA)
					end
				end
				return uniqueArray
			end

			local function on_list(options)
				options.items = filterDuplicates(options.items)
				vim.fn.setqflist({}, ' ', options)
				vim.cmd('botright copen')
			end

			-- Usage
			vim.lsp.buf.references(nil, { on_list = on_list })

			vim.keymap.set("v", "<C-k>c", function()
				vim.lsp.buf.code_action()
			end, { silent = true })

			vim.keymap.set("v", "<C-k>u", function()
				vim.lsp.buf.code_action()
			end, { silent = true })
		end,
	},
}
