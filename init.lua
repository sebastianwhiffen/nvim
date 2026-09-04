vim.g.mapleader = " "

require('vim._core.ui2').enable({})
require('lsp_configs')
require('packages')
require('dap_conf')

vim.cmd.colorscheme('vague')
require('file_tabline')

local builtin = require('telescope.builtin')

vim.opt.sessionoptions:append("tabpages")

vim.opt_local.spelllang = "en_us"

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

-- vim.keymap.set("n", "", "<cmd>tabclose<CR>")
-- vim.keymap.set("n", "", "<cmd>tabnew<CR>")
vim.keymap.set("n", "}", "<cmd>tabnext<CR>")
vim.keymap.set("n", "{", "<cmd>tabprevious<CR>")

vim.keymap.set('n', '<leader>vs', ":vsplit<CR>")
vim.keymap.set('n', '<leader>s', ":split<CR>")

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)


vim.keymap.set('n', ']e', function()
    vim.diagnostic.get_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Go to next error' })

vim.keymap.set('n', '[e', function()
    vim.diagnostic.get_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Go to previous error' })

vim.keymap.set('n', '<leader>t', function()
    vim.cmd('rightbelow vsplit | vertical resize 50% | term')
end)

vim.keymap.set("n", "<leader>x", function()
    vim.opt_local.spell = not vim.opt_local.spell:get()
end)


-- vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, {})
-- if you see this, vibe coding turns your brain to liquid; but idgaf abt my config. optimal for escaping microslops products.
-- the irony is puzzling.
vim.keymap.set("n", "<leader>.", function()
    local original_select = vim.ui.select

    vim.ui.select = function(items, opts, on_choice)
        vim.ui.select = original_select

        local merged = {}

        -- LSP actions first
        for _, item in ipairs(items) do
            table.insert(merged, item)
        end

        -- Only add spelling suggestions when spellcheck is enabled
        if vim.opt_local.spell:get() then
            local word = vim.fn.expand("<cword>")
            local suggestions = vim.fn.spellsuggest(word)

            for _, suggestion in ipairs(suggestions) do
                table.insert(merged, {
                    __spell = true,
                    suggestion = suggestion,
                })
            end
        end

        local original_format_item = opts.format_item

        opts.format_item = function(item)
            if item.__spell then
                return "Spelling: " .. item.suggestion
            end

            if original_format_item then
                return original_format_item(item)
            end

            return tostring(item)
        end

        original_select(merged, opts, function(choice, index)
            if not choice then
                return
            end

            if choice.__spell then
                vim.cmd("normal! ciw" .. choice.suggestion)
                return
            end

            on_choice(choice, index)
        end)
    end

    vim.lsp.buf.code_action()
end)

vim.keymap.set("n", "<leader>x", function()
    vim.opt_local.spell = not vim.opt_local.spell:get()
end)
vim.print('Hello Sexy')
