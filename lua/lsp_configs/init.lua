require('lsp_configs.lua_lsp_config')
require('lsp_configs.roslyn_lsp_config')
require('lsp_configs.html_lsp_config')

vim.lsp.enable('lua_ls')
vim.lsp.enable('roslyn_ls')
vim.lsp.enable('html')
vim.lsp.enable('bashls')
vim.lsp.enable('tsgo')

vim.opt.completeopt = { "menu", "menuone", "noinsert", "popup" }

vim.keymap.set("n", "gf", vim.lsp.buf.format)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gh', vim.diagnostic.open_float)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

vim.keymap.set("i", "<Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-y>" or "<Tab>"
end, { expr = true })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end

        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
            autotrigger = true,
        })
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
    callback = function()
        for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
            if client:supports_method("workspace/diagnostic") then
                vim.lsp.buf.workspace_diagnostics({
                    client_id = client.id,
                })
            end
        end
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = "#90ee90" })
        vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "#4EC9B0" })
    end,
})
