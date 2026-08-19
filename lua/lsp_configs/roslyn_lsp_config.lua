local uv = vim.uv or vim.loop
local fs = vim.fs

vim.lsp.config('roslyn_ls', {
    cmd = {
        'roslyn-language-server',
        '--logLevel',
        'Information',
        '--extensionLogDirectory',
        fs.joinpath(uv.os_tmpdir(), 'roslyn_ls/logs'),
        '--stdio',
    },

    filetypes = { 'cs', 'razor', 'cshtml'},

    settings = {
        ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
            dotnet_provide_regex_completions = true,
        },

        ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "openFiles",
            dotnet_compiler_diagnostics_scope = "fullSolution",
        },
            -- "fullSolution" "openFiles"
    },

    root_markers = {
        'dummy_dotnet_root',
        '*.sln',
        '*.csproj',
    },
})
