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

vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<Tab>"
end, { expr = true })

vim.keymap.set('n', 'gx', function()     vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply =	false
    })
end, {expr = true})


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
      autotrigger = true,

      convert = function(item)
        local abbr = item.label
        abbr = abbr:gsub("%b()", ""):gsub("%b{}", "")
        abbr = abbr:match("[%w_.]+.*") or abbr
        abbr = #abbr > 15 and abbr:sub(1, 14) .. "…" or abbr

        local menu = item.detail or ""
        menu = #menu > 15 and menu:sub(1, 14) .. "…" or menu

        return { abbr = abbr, menu = menu }
      end,
    })

    vim.keymap.set("i", "<C-Space>", function()
      vim.lsp.completion.get()
    end, { buffer = ev.buf })
  end,
})
