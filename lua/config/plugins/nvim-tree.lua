return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.g.loaded_netrw       = 1
      vim.g.loaded_netrwPlugin = 1

      vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

      require('nvim-tree').setup({
        update_focused_file = { enable = false, update_cwd = false },
      })

      vim.api.nvim_create_autocmd('BufEnter', {
        callback = function()
          if vim.bo.filetype ~= 'NvimTree' then
            local prev_win = vim.api.nvim_get_current_win()
            vim.cmd('silent! NvimTreeFindFile')
            vim.api.nvim_set_current_win(prev_win)
          end
        end,
      })
    end,
  },
}

