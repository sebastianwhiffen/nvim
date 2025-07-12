return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw       = 1
      vim.g.loaded_netrwPlugin = 1

      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

      require("nvim-tree").setup({
        disable_netrw       = true,
        hijack_netrw        = true,
        update_focused_file = { enable = true, update_cwd = true },
        actions = {
          open_file = {
            quit_on_open  = false,
            resize_window = true,
          },
        },
        git = {
          enable = false,
        },
      })
    end,
  },
}

