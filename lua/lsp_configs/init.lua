require('lsp_configs.lua_lsp_config')

vim.lsp.enable('lua_ls')
vim.lsp.enable('roslyn_ls')

vim.keymap.set("n", "gf", vim.lsp.buf.format, { remap = false })

vim.opt.completeopt = { "menu", "menuone", "noinsert", "popup" }

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
