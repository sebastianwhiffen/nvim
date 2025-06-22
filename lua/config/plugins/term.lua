
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
    --  direction         = "float",     -- ctrl-` opens/closes a floating terminal
      start_in_insert   = true,
      terminal_mappings  = true,
      persist_mode       = true,
    },
    keys = {
      -- Ctrl+` toggles the floating terminal (open or close, preserving state)
      { "<C-`>",  "<cmd>ToggleTerm<cr>", mode = { "n", "t" } },

      -- Ctrl+Shift+` (i.e. Ctrl+~) opens a vertical split terminal on the right
      { "<C-~>",  "<cmd>ToggleTerm direction=vertical<cr>", mode = "n" },
    },
  },
}
