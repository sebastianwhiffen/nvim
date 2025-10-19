-- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#c-c-rust-via-lldb-vscode

local dap = require("dap")

dap.adapters.lldb = {
  type = 'executable',
  command = '/Library/Developer/CommandLineTools/usr/bin/lldb-dap',
  name = 'lldb'
}



local dap = require('dap')
dap.configurations.c = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    args = {},
  },
}
