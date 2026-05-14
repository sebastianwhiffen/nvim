local uv = vim.uv or vim.loop
local fs = vim.fs

vim.lsp.config('roslyn_ls', {
  cmd = {
    'dotnet',
    '/usr/local/bin/Microsoft.CodeAnalysis.LanguageServer.Linux-x64/Microsoft.CodeAnalysis.LanguageServer.dll',
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

