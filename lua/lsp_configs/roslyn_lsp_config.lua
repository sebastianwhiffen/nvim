local uv = vim.uv or vim.loop
local fs = vim.fs

vim.lsp.config('roslyn_ls', {
  cmd = {
    'dotnet',
    vim.env.ROSLYN_LANGUAGE_SERVER,
    '--logLevel',
    'Information',
    '--extensionLogDirectory',
    fs.joinpath(uv.os_tmpdir(), 'roslyn_ls/logs'),
    '--stdio',
  },

  filetypes = { 'cs' },

  root_markers = {
    '*.sln',
    '*.csproj',
  },
})

